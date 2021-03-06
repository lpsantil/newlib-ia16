# Stub write() implementation for a DOS .com file.

#include "call-cvt.h"

	.arch i8086
	.code16

	.text
	.global write
write:
	pushw	%bp
	movw	%sp, %bp
	pushw	%si
	movw	6(%bp), %si
	movw	8(%bp), %cx
	cld
writeLoop:
	lodsb
	movb	%al, %dl
	movb	$0x02, %ah
	int	$0x21
	loop	writeLoop
	movw	8(%bp), %ax
	popw	%si
	popw	%bp
	RET_(6)
