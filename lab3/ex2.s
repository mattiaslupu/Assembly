.data
	s: .asciz "mere"
	t: .space 5
	n: .long 3

.text

.global main

main:
	lea s, %edi
	lea t, %esi
	movl n, %ecx
	movl $0, %edx
	
parcurgere:
	cmp $0, %ecx
	jl afisare
	movb (%edi, %ecx, 1), %al
	movb %al, (%esi, %edx, 1)
	decl %ecx
	incl %edx
	jmp parcurgere

afisare:
	movb $0, (%esi, %edx, 1)
	
	movl $4, %eax
	movl $1, %ebx
	lea t, %ecx
	movl $4, %edx
	int $0x80
	
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
