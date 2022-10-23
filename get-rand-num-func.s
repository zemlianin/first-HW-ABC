	.intel_syntax noprefix
	.text				# Новая область
	.globl	Rand			# Обхявление функции
	.type	Rand, @function
Rand:
	push	rbp			# Начало метода
	mov	rbp, rsp
	sub	rsp, 48
	
	
	mov	QWORD PTR -24[rbp], rdi	# Парметры метода кладутся в стек
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -32[rbp], edx
	mov	QWORD PTR -40[rbp], rcx
	
	mov	edi, DWORD PTR -32[rbp] # Запсиь параметра рандома в регистр и вызов метода рандома
	call	srand@PLT
	
	mov	DWORD PTR -8[rbp], 0	# Выозов метода перевода символа 0 в число
	mov	rdi, QWORD PTR -24[rbp]
	call	atoi@PLT
	
	
	mov	DWORD PTR -8[rbp], eax	# Запись результата метода в стек
	
	mov	DWORD PTR -4[rbp], 0 	# Обнуление параметра цикла
	jmp	.L2
.L3:
	call	rand@PLT		# Вызов метода рандом
	cdq
	idiv	DWORD PTR -32[rbp] 	# Деление на диапазон
	mov	esi, edx
	mov	edx, DWORD PTR -32[rbp]	
	shr	edx, 31			# Сдвиг вправо
	add	eax, edx
	sar	eax
	neg	eax
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]	# Запасиь параметра в регистр
	
	lea	rdx, 0[0+rax*4]		# Арифметика для поиска текущего элемента массива
	mov	rax, QWORD PTR -40[rbp]	 # Начальная позиция массива
	add	rax, rdx
	lea	edx, [rsi+rcx]		# Получение адреса текущего элемента массива
	mov	DWORD PTR [rax], edx
	
	add	DWORD PTR -4[rbp], 1	# параметр +=1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp] # Сравнение параметра с сайз
	jl	.L3
	nop
	nop
	leave
	ret
	.size	Rand, .-Rand
	.align 8
4:
