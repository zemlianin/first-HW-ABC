# Delete information from gcc
# Delete name 
# Удаление endbr64
# Удаление посредника раикс при получении значения переменной

	.intel_syntax noprefix
	.text
	.section	.rodata 		#  Начало секции, объявление строк
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
	.globl	main 				# Объявление символа мэйн, обозначение его как функции
	.type	main, @function
main:
	push	rbp 				# Запись рбп в стэк и запись рсп в рбп, начало нового метода 
	mov	rbp, rsp
	sub	rsp, 896
	
	mov r8d, edi 	# Получение параметра размера массива
	mov	r9, rsi 	# Получение параметра указателя на массив

	lea	rdi, .LC0[rip] 			# Запись строки в регистр
	call	puts@PLT 			# Запуск метода принт, вывод строки из регистра
	
	lea	rsi, -852[rbp] 			# Запись сайз в регистр
	lea	rdi, .LC1[rip] 			# Запись строки в регистр
	mov	eax, 0 				# Обнуление регистра
	call	__isoc99_scanf@PLT 		# Запуск метода скан
	
	lea	rsi, .LC2[rip]
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT 			# Запись строк, параметров принта в регистры и вызов принт
	
	lea	rsi, -856[rbp]
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT  		# Запись строк, параметров принта в регистры и вызов метода скан
	
	mov	eax, DWORD PTR -856[rbp] 	# Запись переменной команда в регистр
	cmp	eax, 1 				# Сравнение с единицей
	jne	.L2				# Если Они не равны прыжок в точку 2
	
	lea	rsi, .LC4[rip]
	lea	rdi, .LC5[rip]
	call	fopen@PLT 			# Запись строк как параметров в регистры и вызов метода открытия потока\
	
	mov r12, rax 
	mov	DWORD PTR -4[rbp], 0 # i = 0
	jmp	.L3
.L4:
	lea	rdx, -448[rbp] 			# Запись адреса А в регистр
	mov	eax, DWORD PTR -4[rbp] 		#  Запись параметра в регистр
	sal	rax, 2
	add	rdx, rax   			#  Расчет адреса текущего элемента массива
	
	mov	rdi, r12 	# Запись параметров метода скан в регистры, строка и указатель
	lea	rsi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_fscanf@PLT 		#  Запуск метода скан
	
	add	DWORD PTR -4[rbp], 1 		# Прибавление 1 к параметру
.L3:
	mov	eax, DWORD PTR -852[rbp]	# Проверка условия выхода из цикла
	cmp	DWORD PTR -4[rbp], eax
	jl	.L4				# Если параметр меньше сайз, прыжок в точку 4
	
	
.L2:
	mov	eax, DWORD PTR -856[rbp] 	# Запись перемнной команда в регистр
	cmp	eax, 2 				# Сравнение команды с двойкой
	jne	.L5 				#  Если условие не выполнено прыжок в точку 5
	mov	DWORD PTR -4[rbp], 0		# Запись параметра цикла в регистр
	jmp	.L6				#  Прыжок в точку 6
.L7:
	lea	rdx, -448[rbp] 			# Получение адреса начала массива А
	mov	eax, DWORD PTR -4[rbp] 		# Запись параметра цикла в регистр
	
	sal	rax, 2 				# расчет адреса текущего элемента массива
	add	rax, rdx
	mov	rsi, rax
	
	lea	rdi, .LC1[rip] 			# Запись строки в регистр
	mov	eax, 0
	call	__isoc99_scanf@PLT 		# Запуск метода скан
	
	add	DWORD PTR -4[rbp], 1  		# Увеличение параметра на 1
.L6:
	mov	eax, DWORD PTR -852[rbp] 	#  Запись значения сайз в регистр
	cmp	DWORD PTR -4[rbp], eax 		#  Сравнение значения сайз с параметром
	jl	.L7				#  Если параметр меньше, прыжок в точку 7
.L5:
	mov	eax, DWORD PTR -856[rbp] 	# Запись команды в регистр
	cmp	eax, 3				# Сравнение команды с 3
	jne	.L8				# Если условие не выполнено то прыжок вточку 8
	
	lea	rdi, .LC6[rip]			# Запись Строки в регистр и вызов метода принт для строк
	call	puts@PLT	
			
	lea	rsi, -860[rbp]			# Запись адреса переменной диапазон значений в регистр
	lea	rdi, .LC1[rip]			# Запись строки в регистр
	mov	eax, 0
	call	__isoc99_scanf@PLT		# Вызов метода скан
	
	cmp r8d, 1		# Сравнение парамметра мметода мэйн с 1
	jne	.L9				
	mov	BYTE PTR -865[rbp], 48		# Запись нолика в переменную параметр  рандома
	jmp	.L10
.L9:
	mov	rax, r9	# Получение ссылки на массив
	mov	rax, QWORD PTR [rax]		# Получение элемента массива
	movzx	eax, BYTE PTR 1[rax]
	mov	BYTE PTR -865[rbp], al		# Запись полученного значения в перемменную
.L10:
	mov	edx, DWORD PTR -860[rbp]	# Запись параметров метода ранд в регистры
	mov	esi, DWORD PTR -852[rbp]
	lea	rcx, -448[rbp]
	lea	rdi, -865[rbp]
	call	Rand@PLT			# Запуск метода ранд
.L8:
	mov	eax, DWORD PTR -856[rbp]	# Запись переменной команд в регистр
	test	eax, eax			# Сравнение переменной с нулем через побитовое и
	jne	.L11				# Если условие не выполнено прыжок в точку 11
	
	mov	eax, DWORD PTR -852[rbp]	# Запись сайз в сайзН
	mov	DWORD PTR -864[rbp], eax
		
	lea	rsi, .LC4[rip]			# Задание параметров и открытие потока на чтение
	lea	rdi, .LC5[rip]
	call	fopen@PLT
	
	mov r12, rax	
		
	lea	rsi, .LC7[rip]			# Открытие потока на запись
	lea	rdi, .LC8[rip]
	call	fopen@PLT
	
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0		# Присвоение параметру нуля
	jmp	.L12				# Прыжок в точку 12
.L15:
	mov	DWORD PTR -8[rbp], 0		# Присвоение параметру внутреннего цикла нуля
	jmp	.L13				# Прыжок в точку 13
.L14:
	lea	rdx, -448[rbp]			# Получение адреса Начала массива А
	
	mov	eax, DWORD PTR -4[rbp]		# Расчет Адреса текущего элемента массива
	sal	rax, 2
	add	rdx, rax
	
	mov	rdi, r12		# Запуск метода скан
	lea	rsi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	
	add	DWORD PTR -8[rbp], 1		# +1 к внутреннему параметру
.L13:
	mov	eax, DWORD PTR -852[rbp]	# Запись значения сайз в регистр
	cmp	DWORD PTR -8[rbp], eax		# Сравнение внутреннего параметра с сайзом
	jl	.L14				# Если параметр меньше прыжок в точку 14
	
	call	clock@PLT			# Вызов метода клок
	mov	r13, rax		# Запись результата выполнения функции в стэк
	
	lea	rdx, -848[rbp]			# Вызов функции таск
	lea	rsi, -864[rbp]			# Запись переменных в регистры
	lea	rdi, -448[rbp]
	call	Task@PLT
	
	call	clock@PLT			# Вызов функции клок
	mov	r14, rax		# Запись результата в стэк
	
	mov	rax, r14		# Запись конечного момента времени в регистр
	mov	edx, eax			
	mov	rax, r13	# Запись начального момента времени в регистр
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx			# Получение разности значений
	mov	edx, eax			# Запись результата в регистр
	
	mov	rdi, QWORD PTR -32[rbp]		# Вызов функции эф принт 
	lea	rsi, .LC1[rip]
	mov	eax, 0
	call	fprintf@PLT
	
	mov	rax, r14		# Запись конечного момента времени в регистр
	mov	edx, eax
	mov	rax, r13		# Запись начального момента времени в регистр
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx			# Получение Разности моментов времени
	
	add	DWORD PTR -12[rbp], eax		# Прибавление нового отрезка времени к существующей сумме
	
	mov	rsi, QWORD PTR -32[rbp]		# Запись указателя на поток в регистр
	mov	edi, 10				# Запись символа переноса строки в регистр
	call	fputc@PLT			# Вызов метода записи в файл
	
	add	DWORD PTR -4[rbp], 1		# Внешний параметр +=1
.L12:
	cmp	DWORD PTR -4[rbp], 9 		# Сравнивание параметра с 9
	jle	.L15				# Если меньше то прыжок в точку 15
	
	lea	rsi, .LC9[rip]			# Запись параметров в регистры, вызов метода принт
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	
	mov	esi, DWORD PTR -12[rbp]		# Запись суммы времени на тесты в регистр
	lea	rdi, .LC1[rip]			# Запись строки в регситр
	mov	eax, 0
	call	printf@PLT			# Вызов принт
	mov	eax, 0
	
	jmp	.L23				# Прыжок к концу программы
.L11:

	lea	rdx, -848[rbp]			# Запись параметров в регисты, вызов метода таск
	lea	rsi, -852[rbp]
	lea	rdi, -448[rbp]
	call	Task@PLT
	
	lea	rsi, .LC7[rip]			# Запись параметров в регистры 
	lea	rdi, .LC10[rip]
	call	fopen@PLT			# Вызов метода открытия потока вывода
	
	mov	QWORD PTR -32[rbp], rax		# Вызов метода принт для строк
	lea	rdi, .LC11[rip]
	call	puts@PLT
	
	lea	rsi, -856[rbp]			# Запись адреса переменной в регистр
	lea	rdi, .LC1[rip]			# Запись строки в регистр
	mov	eax, 0
	call	__isoc99_scanf@PLT		# Вызов метода скан
	
	mov	eax, DWORD PTR -856[rbp]	# Запись команды в регистр
	cmp	eax, 1				# Сравнение команды с 1
	jne	.L17				# Если не равны прыжок на точку 17 
	mov	DWORD PTR -4[rbp], 0		# параметр цикла = 0
	jmp	.L18				# Прыжок на точку 18
.L19:
	mov	eax, DWORD PTR -4[rbp]		# Запись параметра в регистр
	mov	edx, DWORD PTR -848[rbp+rax*4]	# расчет адреса текущего элемента массива В
	mov	rdi, QWORD PTR -32[rbp]		# Запись указателя в регистр
	lea	rsi, .LC1[rip]			# Запись строки в регистр
	mov	eax, 0
	call	fprintf@PLT			# Вызов функции принт
	
	add	DWORD PTR -4[rbp], 1		# параметр цикла +=1
.L18:
	mov	eax, DWORD PTR -852[rbp]	# Запись сайз в регистр
	cmp	DWORD PTR -4[rbp], eax		# Сравнениие сайз с параметром
	jl	.L19				# Если параметр меньше, прыжок на 19
.L17:
	mov	eax, DWORD PTR -856[rbp]	# Получение значения команды
	cmp	eax, 2				# Сравнение с двойкой
	jne	.L20				# Если не равны то прыжок на точку 20
	mov	DWORD PTR -4[rbp], 0		# Парметр цикла  = 0
	jmp	.L21				# Прыжок на точку 21
.L22:
	mov	eax, DWORD PTR -4[rbp]		# Запись параметра в регистр
	
	mov	esi, DWORD PTR -848[rbp+rax*4]	# Расчет текущего элемента массива
	lea	rdi, .LC1[rip]			# Запись строки в регистр
	mov	eax, 0
	call	printf@PLT			# Вызов метода принт
	
	add	DWORD PTR -4[rbp], 1		# Параметр +=1
.L21:
	mov	eax, DWORD PTR -852[rbp]	# Запись сайз в регистр
	cmp	DWORD PTR -4[rbp], eax		# Сравнение сайз с параметром
	jl	.L22				# Прыжок на тчоку 22
.L20:
	mov	eax, 0
.L23:
	leave					# Выход из функции
	ret
	.size	main, .-main
