.data
	n: .long 19
	nuprim: .asciz "Nu este prim\n"
	prim: .asciz "Este prim\n"

.text

.global main


main:
	movl n, %eax
	movl $0, %ebx
	movl $2, %ecx
for_loop:
	cmp n, %ecx
	je verificare
	movl n, %eax
	movl $0, %edx
	idiv %ecx
	cmp $0, %edx
	je arediv
	jmp incrementare
arediv:
	movl $1, %ebx
incrementare:
	incl %ecx
	jmp for_loop

verificare:
	cmp $1, %ebx
	je nuesteprim
	movl $4, %eax
	movl $1, %ebx
	movl $prim, %ecx
	movl $11, %edx
	int $0x80
	jmp et_exit
	
nuesteprim:
	movl $4, %eax
	movl $1, %ebx
	movl $nuprim, %ecx
	movl $14, %edx
	int $0x80

et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
