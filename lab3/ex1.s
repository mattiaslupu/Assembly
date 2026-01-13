.data
	t: .long 5, 4, 3, 7, 8, 8, 1
	n: .long 7

.text


.global main


main:
	lea t, %edi
	movl $0, %ecx
	movl $0, %ebx
for_loop:
	cmp n, %ecx
	je et_exit
	cmp %ebx, (%edi, %ecx, 4)
	jg maimare
	cmp %ebx,  (%edi, %ecx, 4)
	je egale
	jmp incrementare

maimare:
	movl (%edi, %ecx, 4), %ebx
	movl $1, %edx
	jmp incrementare

egale:
	incl %edx
	jmp incrementare

incrementare:
	incl %ecx
	jmp for_loop
	
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
