.data
	x: .long 256
	y: .long 1
	egale: .asciz "Sunt egale\n"
	diferite: .asciz "Nu sunt egale\n"
	
.text


.global main


main:
	movl x, %eax
	sarl $4, %eax
	movl y, %ebx
	sall $4, %ebx
	cmp %eax, %ebx
	je et_egale
	movl $4, %eax
	movl $1, %ebx
	movl $diferite, %ecx
	movl $15, %edx
	int $0x80
	jmp et_exit
	

et_egale:
	movl $4, %eax
	movl $1, %ebx
	movl $egale, %ecx
	mov $12, %edx
	int $0x80
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
