.data
	x: .long 5
	y: .long 7
	
.text

.global main

main:
	movl x, %eax
	movl y, %ebx
	movl %ebx, x
	movl %eax, y

et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
