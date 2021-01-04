!include screen.asm
!include string.asm

db:
	set "test", [0x04]
	set %testCommand, [0x05]
	set "info", [0x06]
	set %infoCommand, [0x07]
	set "quit", [0x08]
	set %quitCommand, [0x09]
	set "help", [0x0A]
	set %helpCommand, [0x0B]
	ret

testCommand:
	set "test command OK", [0x01]
	call %println
	ret
quitCommand:
	set "hahahahahahahha you wanna quit, you stupid little bitch? PFFFFFF", [0x01]
	call %println
	ret
infoCommand:
	set "[MSE Shell ver 0.1 alpha 3]\nthis shell has the aim of showing people what magical things can this instructions set do", [0x01]
	call %println
	ret
helpCommand:
	set "info - get the info about this shell", [0x01]
	call %println
	set "help - shows this message", [0x01]
	call %println
	set "quit - exit the shell", [0x01]
	call %println
	set "test - test command", [0x01]
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