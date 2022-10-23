	.file	"Main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"input size"
.LC1:
	.string	"%d"
	.align 8
.LC2:
	.string	"input command: \n 1 - read from file \n 2 - read from console\n 3 - Random\n 0 - Testing"
.LC3:
	.string	"%s"
.LC4:
	.string	"r"
.LC5:
	.string	"tests.txt"
.LC6:
	.string	"input range of numbers"
.LC7:
	.string	"w"
.LC8:
	.string	"times.txt"
.LC9:
	.string	"Sum of Time in ms: "
.LC10:
	.string	"output.txt"
	.align 8
.LC11:
	.string	"output command: \n 1 - write B to file \n 2 - write B to console"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 896
	mov	DWORD PTR -884[rbp], edi
	mov	QWORD PTR -896[rbp], rsi
	mov	DWORD PTR -12[rbp], 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -852[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -856[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -856[rbp]
	cmp	eax, 1
	jne	.L2
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	lea	rdx, -448[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	eax, DWORD PTR -852[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L4
.L2:
	mov	eax, DWORD PTR -856[rbp]
	cmp	eax, 2
	jne	.L5
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	lea	rdx, -448[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -852[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L7
.L5:
	mov	eax, DWORD PTR -856[rbp]
	cmp	eax, 3
	jne	.L8
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -860[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR -884[rbp], 1
	jne	.L9
	mov	BYTE PTR -865[rbp], 48
	jmp	.L10
.L9:
	mov	rax, QWORD PTR -896[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR 1[rax]
	mov	BYTE PTR -865[rbp], al
.L10:
	mov	edx, DWORD PTR -860[rbp]
	mov	esi, DWORD PTR -852[rbp]
	lea	rcx, -448[rbp]
	lea	rax, -865[rbp]
	mov	rdi, rax
	call	Rand@PLT
.L8:
	mov	eax, DWORD PTR -856[rbp]
	test	eax, eax
	jne	.L11
	mov	eax, DWORD PTR -852[rbp]
	mov	DWORD PTR -864[rbp], eax
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC7[rip]
	mov	rsi, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L15:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L13
.L14:
	lea	rdx, -448[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -8[rbp], 1
.L13:
	mov	eax, DWORD PTR -852[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L14
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -848[rbp]
	lea	rcx, -864[rbp]
	lea	rax, -448[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	Task@PLT
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	add	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	cmp	DWORD PTR -4[rbp], 9
	jle	.L15
	lea	rax, .LC9[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -12[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L23
.L11:
	lea	rdx, -848[rbp]
	lea	rcx, -852[rbp]
	lea	rax, -448[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	Task@PLT
	lea	rax, .LC7[rip]
	mov	rsi, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -856[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -856[rbp]
	cmp	eax, 1
	jne	.L17
	mov	DWORD PTR -4[rbp], 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -848[rbp+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L18:
	mov	eax, DWORD PTR -852[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L19
.L17:
	mov	eax, DWORD PTR -856[rbp]
	cmp	eax, 2
	jne	.L20
	mov	DWORD PTR -4[rbp], 0
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -848[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L21:
	mov	eax, DWORD PTR -852[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L22
.L20:
	mov	eax, 0
.L23:
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
