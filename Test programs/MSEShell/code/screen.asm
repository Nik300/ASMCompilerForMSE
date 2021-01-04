!include syscalls.asm
println:
	call %updatescreen
	set "\n", [0x01]
	call %updatescreen
	ret

print:
	call %updatescreen
	ret