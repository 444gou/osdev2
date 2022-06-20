diskload:
	push	loadmsg
	call	print

	mov	ah,	0x02
	mov	al,	1
	mov	dl,	0x00
	mov	ch,	0
	mov	dh,	0
	mov	cl,	2
	mov	bx,	0x7e00
	int	0x13
	
	jc	diskerror
	ret

sector2:
	mov	ax,	0x0e61
	int	0x10
	cli
	hlt

diskerror:
	push	errormsg
	call	print

errormsg:	db	"Error",0x00
loadmsg:	db	"Loading",0x00
