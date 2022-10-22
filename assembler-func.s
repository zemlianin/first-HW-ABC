 .intel_syntax noprefix # Выбор синтаксиса

 .text # Начало синтаксиса
 .globl Task # Определение символа таск
 .type Task, @function # Обозначение символа, как функции


Task:
 push rbp # Запись рбп в стэк 
 mov rbp, rsp # Запись в рбп рсп

 mov QWORD PTR -24[rbp], rdi # Объявление(параметра) Указателя на первый массив
 mov QWORD PTR -32[rbp], rsi # Объявление(параметра) указателя на число, размер массива
 mov QWORD PTR -40[rbp], rdx # Объявление(Параметра) указателя на второй массив

 mov DWORD PTR -8[rbp], 0 # Объявление переменной current = 0
 mov DWORD PTR -4[rbp], 0 # Объявление переменной j = 0
 
 jmp .L2 # Прыжок ко второй метке

.L4:
 mov eax, DWORD PTR -4[rbp] # Запись j в регистр
 lea rdx, 0[0+rax*4]  # запись в rdx отступа от начала массива
 mov rax, QWORD PTR -24[rbp] # запись в rax адреса начала массива 
 add rax, rdx # получение адреса элемента массива
 mov eax, DWORD PTR [rax]  # Запись значения элемета массива в eax
 test eax, eax # Сравнивание с 0 через побитовое и
 jle .L3 # если не больше нуля то на метку 3
 mov eax, DWORD PTR -8[rbp] # Запись каррент в eax
 lea rdx, 0[0+rax*4] # Запись сдвига текущего элемента массива в eax
 mov rax, QWORD PTR -40[rbp] # Запись начала массива в rax
 add rdx, rax # Получение адреса текущего элемента
 mov eax, DWORD PTR -4[rbp] # Запись значения j в eax
 mov DWORD PTR [rdx], eax # Запись eax в текущий элемент массива б
 add DWORD PTR -8[rbp], 1 # curent++
.L3:
 add DWORD PTR -4[rbp], 1 # j++

.L2:
 mov rax, QWORD PTR -32[rbp] # Запись адреса size в rax
 mov eax, DWORD PTR [rax] # Разыменование rax и запись в eax
 cmp DWORD PTR -4[rbp], eax # Сравнение j и size
 jl .L4 # Если -4[rbp]<eax прыжок ко второй метке

 mov     rax, QWORD PTR [rbp-32] # Запись адреса size в rax
 mov     edx, DWORD PTR [rbp-8] # Запись значения current в edx
 mov     DWORD PTR [rax], edx # Запись edx по адресу rax
 nop
 nop
 pop     rbp # / Эпилог (1/2)
 ret   # \ Эпилог (2/2)
 .size Task, .-Task