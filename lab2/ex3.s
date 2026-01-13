.data
	a: .long 5
	b: .long 7
	c: .long 3
	min: .space 4
	
.text

.global main


main:
	movl a, %eax
	movl b, %ebx
	movl c, %ecx
	cmp %eax, %ebx
	jg et1
	movl %ebx, min
	jmp continuare
et1:
	movl %eax, min
continuare:
	cmp min, %ecx
	jl maimic
	jmp et_exit
maimic:
	movl %ecx, min
	movl min, %edx

et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80	
	
