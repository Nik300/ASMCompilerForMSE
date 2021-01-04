strcmp:
	set [0x03], 3$G0
	set [0x04], 3$G1
cmp:
	equ [3$G1], 0x00
	je %strcomplete
	equ [3$G0], [3$G1]
	jne %strfalse
	add 0x01, 3$G0
	add 0x01, 3$G1
	jmp %cmp

strcomplete:
	equ [3$G0], 0x00
	je %strtrue
	jne %strfalse
strtrue:
	equ 0x00, 0x00
	ret
strfalse:
	equ 0x01, 0x00
	ret
