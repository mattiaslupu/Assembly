.data
	x: .long 16
	y: .long 2

.text

.global main


main:
	movl x, %eax
	movl $16, %ebx
	movl $0, %edx
	idiv %ebx
	movl %eax, %ecx
	movl y, %eax
	imul %ebx
	add %eax, %ecx
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
