[bits 16]
[org 0x7e00]

	mov     al,     'X'
        mov     ah,     0x0e
        int     0x10
	jmp	$

times 2048 - ($-$$) db 0
