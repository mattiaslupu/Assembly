.data 
	x: .long 10
	y: .long 6

.text


.global main

main:
	movl x, %eax
	sar $4,  %eax
	movl %eax, %ecx
	movl y, %eax
	sal $4, %eax
	add %eax, %ecx
	
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
