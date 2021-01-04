!cd $filepath
!include screen.asm
!include string.asm
!include syscalls.asm

db:
	set "foo", [0x0A]
	set 0x00, [0x0B]
	set "quit", [0x0C]
	set %quitCommand, [0x0D]
	set "help", [0x0E]
	set %helpCommand, [0x0F]
	set "info", [0x10]
	set %infoCommand, [0x11]
	set "cls", [0x12]
	set %clsCommand, [0x13]
	set "whoami", [0x14]
	set %whoamiCommand, [0x15]
	set "test", [0x16]
	set %testCommand, [0x17]
	set "quit", [0x18]
	set %quitCommand, [0x19]

_entry:
	pop [0x05]
	pop [0x06]
	equ [0x05], 0x00
	jne %execandstop
	set "Welcome to MSEShell!", [0x01]
	call %println

main:
	set "MSE Shell> ", [0x01]
	call %print
	call %input
	set 0x0A, 3$G4
	set 0x0A, [0x04]
	set [0x01], [0x03]
	call %comcmp
	jmp %main

execandstop:
	set 0x0A, 3$G4
	set 0x0A, [0x04]
	set [0x06], [0x03]
	call %comcmp
	end

quitCommand:
	set "Bye!!", [0x01]
	call %println
	end
	ret
helpCommand:
	set "info - shows the informations about this shell", [0x01]
	call %println
	set "help - shows this message", [0x01]
	call %println
	set "quit - exit the shell", [0x01]
	call %println
	set "test - test command", [0x01]
	call %println
	ret
infoCommand:
	set "[MSE Shell ver 0.1 alpha 3]\nthis shell has the aim of showing people what magical things can this instructions set do", [0x01]
	call %println
	ret
clsCommand:
	call %clearscreen
	ret
whoamiCommand:
	call %cuser
	call %println
	ret
testCommand:
	push "test"
	pop [0x01]
	call %println
	ret


callCommand:
	add 0x01, 3$G4
	call [3$G4]
	ret

notFound:
	set "command not found!", [0x01]
	call %println
	ret

comcmp:
	call %strcmp
	je %callCommand
	equ [3$G4], 0x00
	je %notFound
	add 0x02, 3$G4
	set [3$G4], [0x04]
	set [0x01], [0x03]
	jmp %comcmp
