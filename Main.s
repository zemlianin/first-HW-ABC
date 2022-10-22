	.file	"Main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"input.txt"
.LC2:
	.string	"input size "
.LC3:
	.string	"%s"
.LC4:
	.string	"%d"
	.align 8
.LC5:
	.string	"input command: \n 1 - read from file \n 2 - read from console"
.LC6:
	.string	"w"
.LC7:
	.string	"output.txt"
	.align 8
.LC8:
	.string	"output command: \n 1 - write to file \n 2 - write to console"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 864
	mov	DWORD PTR -852[rbp], edi
	mov	QWORD PTR -864[rbp], rsi
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -836[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -840[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -840[rbp]
	cmp	eax, 1
	jne	.L2
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	lea	rdx, -432[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	eax, DWORD PTR -836[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L4
.L2:
	mov	eax, DWORD PTR -840[rbp]
	cmp	eax, 2
	jne	.L5
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	lea	rdx, -432[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -836[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L7
.L5:
	lea	rdx, -832[rbp]
	lea	rcx, -836[rbp]
	lea	rax, -432[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	Task@PLT
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -840[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -840[rbp]
	cmp	eax, 1
	jne	.L8
	mov	DWORD PTR -4[rbp], 0
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -832[rbp+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L9:
	mov	eax, DWORD PTR -836[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L10
.L8:
	mov	eax, DWORD PTR -840[rbp]
	cmp	eax, 2
	jne	.L11
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -832[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -836[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
.L11:
	mov	edx, DWORD PTR -852[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
