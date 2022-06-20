[bits 16]
[org 0x7c00]
[global _start]

_start:
	xor	ax,	ax
	mov	ds,	ax
	mov	es,	ax

	push	lstring
	call	print

	mov	al,	'e'
	mov	ah,	0x0e
	int	0x10

	call diskload
	mov	ax,	0x7e00
	jmp 0x0:0x7e00

%include "src/functions/print.asm"
%include "src/functions/diskload.asm"

lstring:	db	"Hello World!",0x0d,0x0a,0x00

times	510 - ($-$$)	db	0
dw	0xaa55
