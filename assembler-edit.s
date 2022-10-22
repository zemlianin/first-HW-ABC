.intel_syntax noprefix #
 
 
 .text #Start new section
 
 
 .section .rodata #ReadOnly Section
.LC0:
 .string "%d "
 .text
 .globl PolNum
 .type PolNum, @function
 

PolNum:
 push rbp # запись rbp в стек
 mov rbp, rsp # Присвоение rbd rsp

 sub rsp, 56 # rsp-=56
 mov QWORD PTR -56[rbp], rdi # Получение указателя на массив  
 mov DWORD PTR -60[rbp], esi #  Получение длины массива
 mov rax, rsp
 mov rbx, rax
 mov eax, DWORD PTR -60[rbp]
 movsx rdx, eax
 sub rdx, 1
 mov QWORD PTR -32[rbp], rdx
 movsx rdx, eax
 mov r10, rdx
 mov r11d, 0
 movsx rdx, eax
 mov r8, rdx
 mov r9d, 0
 cdqe
 lea rdx, 0[0+rax*4]
 mov eax, 16
 sub rax, 1
 add rax, rdx
 mov esi, 16
 mov edx, 0
 div rsi
 imul rax, rax, 16
 mov rcx, rax
 and rcx, -4096
 mov rdx, rsp
 sub rdx, rcx
.L2:
 cmp rsp, rdx
 je .L3
 sub rsp, 4096
 or QWORD PTR 4088[rsp], 0
 jmp .L2
.L3:
 mov rdx, rax
 and edx, 4095
 sub rsp, rdx
 mov rdx, rax
 and edx, 4095
 test rdx, rdx
 je .L4
 and eax, 4095
 sub rax, 8
 add rax, rsp
 or QWORD PTR [rax], 0
.L4:
 mov rax, rsp
 add rax, 3
 shr rax, 2
 sal rax, 2
 mov QWORD PTR -40[rbp], rax
 mov DWORD PTR -20[rbp], 0
 mov DWORD PTR -24[rbp], 0
 jmp .L5
.L7:
 mov eax, DWORD PTR -24[rbp]
 cdqe
 lea rdx, 0[0+rax*4]
 mov rax, QWORD PTR -56[rbp]
 add rax, rdx
 mov eax, DWORD PTR [rax]
 test eax, eax
 jle .L6
 mov rax, QWORD PTR -40[rbp]
 mov edx, DWORD PTR -20[rbp]
 movsx rdx, edx
 mov ecx, DWORD PTR -24[rbp]
 mov DWORD PTR [rax+rdx*4], ecx
 add DWORD PTR -20[rbp], 1
.L6:
 add DWORD PTR -24[rbp], 1
.L5:
 mov eax, DWORD PTR -24[rbp]
 cmp eax, DWORD PTR -60[rbp]
 jl .L7
 mov DWORD PTR -24[rbp], 0
 jmp .L8
.L9:
 mov rax, QWORD PTR -40[rbp]
 mov edx, DWORD PTR -24[rbp]
 movsx rdx, edx
 mov eax, DWORD PTR [rax+rdx*4]
 mov esi, eax
 lea rax, .LC0[rip]
 mov rdi, rax
 mov eax, 0
 call printf@PLT
 add DWORD PTR -24[rbp], 1
.L8:
 mov eax, DWORD PTR -24[rbp]
 cmp eax, DWORD PTR -20[rbp]
 jl .L9
 mov rsp, rbx
 nop
 mov rbx, QWORD PTR -8[rbp]
 leave
 ret
 .size PolNum, .-PolNum
 .section .rodata
.LC1:
 .string "%d"
 
 
 .text
 .globl main
 .type main, @function
 
 
main:
 push rbp #Rbp в стек
 mov rbp, rsp # Записываем rsp в rbp
 sub rsp, 32 # rsp -= 32
 mov DWORD PTR -4[rbp], 0
 jmp .L11
.L12:
 lea rdx, -32[rbp]
 mov eax, DWORD PTR -4[rbp]
 cdqe
 sal rax, 2
 add rax, rdx
 mov rsi, rax
 lea rax, .LC1[rip]
 mov rdi, rax
 mov eax, 0
 call __isoc99_scanf@PLT
 add DWORD PTR -4[rbp], 1
.L11:
 cmp DWORD PTR -4[rbp], 4
 jle .L12
 lea rax, -32[rbp]
 mov esi, 5
 mov rdi, rax
 call PolNum
 mov eax, 0
 leave
 ret
 .size main, .-main