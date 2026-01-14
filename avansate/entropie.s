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
	mov 8(%ebp), %edi
	xorl %ecx, %ecx
	pxor %xmm2, %xmm2
et_loop:
	cmp 12(%ebp), %ecx
	jg exit_loop
	
	flds (%edi, %ecx, 4)
	subl $4, %esp
	fstps 0(%esp)
	
	call logf
	
	fstps rez
	addl $4, %esp
	
	movss (%edi, %ecx, 4), %xmm0
	movss rez, %xmm1
	mulss  %xmm0, %xmm1
	addss %xmm1, %xmm2
	incl %ecx
exit_loop:
	mulss minus_unu, %xmm2
	movss %xmm2, rez
	flds rez
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
	movl $fs, 0(%esp)
	call printf
	addl $8, %esp
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

