.data
	v: .float 0.33, 0.5, 0.08, 0.08
	n: .long 4
	rez: .space 4
	minus_unu: .float -1.0
	fs: .asciz "%f\n"
.text

entropie:
	push %ebp
	mov %esp, %ebp
	push %edi
	push %ebx
	mov 8(%ebp), %edi
	xorl %ebx, %ebx
	pxor %xmm2, %xmm2
et_loop:
	cmp 12(%ebp), %ebx
	jge exit_loop
	
	flds (%edi, %ebx, 4)
	subl $4, %esp
	fstps 0(%esp)
	call logf
	fstps rez
	addl $4, %esp
	
	movss (%edi, %ebx, 4), %xmm0
	movss rez, %xmm1
	mulss  %xmm0, %xmm1
	addss %xmm1, %xmm2
	incl %ebx
	jmp et_loop
exit_loop:
	mulss minus_unu, %xmm2
	movss %xmm2, rez
	flds rez
	pop %ebx
	pop %edi
	pop %ebp
	ret	

.global main



main:
	pushl n
	push $v
	
	call entropie
	
	addl $8, %esp
	
	subl $8, %esp
	fstpl 4(%esp)
	push $fs
	call printf
	addl $12, %esp
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

