updatescreen:
	push 3$G3
	set [0x01], 3$G3
	scall 0x00
	pop 3$G3
	ret
clearscreen:
	scall 0x02
	ret

input:
	push 3$G3
	scall 0x01
	set 3$G3, [0x01]
	pop 3$G3
	ret

requestAdminPerms:
	scall 0x03
	equ 3$G3, 0x01
	ret

cuser:
	push 3$G3
	scall 0x04
	mov 3$G3, [0x01]
	pop 3$G3
	ret