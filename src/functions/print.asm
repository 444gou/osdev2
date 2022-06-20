print:
	push	bp
	mov	bp,	sp

	pusha

	mov	si,	[bp+4]

	.loop:
		mov	al,	[si]
		add	si,	1
		cmp	al,	0x00
		je	.end

		mov	ah,	0x0e
		int	0x10

		jmp	.loop

	.end:
		popa
		pop	bp
		ret
