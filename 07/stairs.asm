%include 'library.asm'

section .data
    arr_ptr dd  'u', 'd', 'd', 'u', 'u', 'd', 'd', 'u', 'u', 'd'
    n_ptr   dd  10

section .text
    global _start
    
_start:
    mov ebx, arr_ptr        ; ebx = arr_ptr
    mov ecx, [n_ptr]        ; ecx = *n_ptr
    push 0
    push 0

FOR_LOOP:
    mov eax, [ebx]          ; eax = *ebx
    add ebx, 4              ; сдвигаем указатель на след. элемент массива
    cmp eax, 'u'            ; if eax == 'u' goto UP
    je UP                   ;

DOWN:
    mov eax, [esp+4]        ; else *стек[1]++
    inc eax                 ;
    mov [esp+4], eax        ; 

CONTINUE:
    loop FOR_LOOP
    jmp COMPARE

UP:
    mov eax, [esp]          ; *стек[0]++
    inc eax                 ;
    mov [esp], eax          ;
    jmp CONTINUE

COMPARE:
    pop eax
    cmp eax, [esp]
    jne PRINT0
    mov eax, 1
    jmp OUTPUT

PRINT0:
    mov eax, 0

OUTPUT:
    call print_number
    call exit
