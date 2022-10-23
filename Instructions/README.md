# Список изменений
### 1. Удаление ненужных перезаписываний регистров, таких как:

``` 
lea	rax, .LC2[rip]
mov	rsi, rax
  ```
  ```
lea	rax, .LC3[rip] 
mov	rdi, rax
  ```
  ```
lea	rax, .LC1[rip]
mov	rdi, rax
```
```
lea	rax, .LC0[rip]
mov	rdi, rax
  ```
  
  ```
  mov	rax, QWORD PTR -24[rbp]
lea	rcx, .LC1[rip]
mov	rsi, rcx
mov	rdi, rax
  ```
  
  ```
  add	rax, rdx
mov	rsi, rax
  ```
  
  ```
  lea	rax, .LC1[rip]
mov	rdi, rax
  ```
  
  ```
  lea	rax, .LC6[rip]
mov	rdi, rax
  ```
  
  ```
  lea	rax, -860[rbp]
mov	rsi, rax
  ```
  
  ```
  lea	rax, -865[rbp]
mov	rdi, rax
  ```
  
  ```
  lea	rax, .LC4[rip]
mov	rsi, rax
lea	rax, .LC5[rip]
mov	rdi, rax
  ```
  
  ```
  mov	rax, QWORD PTR -24[rbp]
lea	rcx, .LC1[rip]
mov	rsi, rcx
mov	rdi, rax
  ```
  
  ```
mov	rax, QWORD PTR -32[rbp]
lea	rcx, .LC1[rip]
mov	rsi, rcx
mov	rdi, rax
```

```
mov	rax, QWORD PTR -32[rbp]
mov	rsi, rax
```

```
lea	rcx, -852[rbp]
lea	rax, -448[rbp]
mov	rsi, rcx
mov	rdi, rax
  ```
  
 ### Вместо этого, строка/адрес/переменная записываются напрямую в конечных регистр, без посредника rax или rcx
 ### 2. Удаление кода сгенерированного GCC
 ```
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
```
### 3. Повсеместное удаление макроса cdqe
### 4. Удаление макроса endbr64
### 5. Оптимизация за счет хранения некторых переменных стека в регистре, среди которых:
## Main.s:
* arcs -> r8d
* argv[] -> r9
* *input -> r12
* begin -> r13
* end -> r14
* i - неудается заменить, Segmentation fault (core dumped)
* command - неудается заменить, Segmentation fault (core dumped)
* size - неудается заменить, Segmentation fault (core dumped)
## func.s:
* *A -> r14
* *B -> r15
* size -> неудается заменить, Segmentation fault (core dumped)

