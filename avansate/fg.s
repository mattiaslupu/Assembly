.data
	x: .long 5
	fp: .asciz "%d\n"
.text
g:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	incl %eax
	popl %ebp
	ret

f:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	shll $1, %eax
	incl %eax
	popl %ebp
	ret

.global main


main:
	movl x, %eax
	
	pushl %eax
	
	call g
	
	addl $4, %esp
	 
	pushl %eax
	call f
	addl $4, %esp
	
	pushl %eax
	pushl  $fp
	call printf
	addl $8, %esp
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
