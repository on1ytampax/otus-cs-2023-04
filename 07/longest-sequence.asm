%include 'library.asm'

section .data
    arr_ptr dd  1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1
    n_ptr   dd  15

section .text
    global _start
    
_start:
    mov ebx, arr_ptr        ; ebx = arr_ptr
    mov ecx, [n_ptr]        ; ecx = *n_ptr
    xor edx, edx            ; edx = 0
    push edx                ; пушим в стек 0

FOR_LOOP:
    mov eax, [ebx]          ; eax = *ebx
    add ebx, 4              ; сдвигаем указатель на след. элемент массива
    cmp eax, 1              ; if eax == 1 goto INCREMENT
    je INCREMENT            ;
    xor edx, edx            ; else edx = 0

STACK:
    cmp edx, [esp]          ; if edx <= *стек[0] goto CONTINUE
    jle CONTINUE            ;
    mov [esp], edx          ; else записываем edx в *стек[0]

CONTINUE:
    loop FOR_LOOP
    jmp OUTPUT

INCREMENT:
    inc edx                 ; edx++
    jmp STACK

OUTPUT:
    pop eax
    call print_number
    call exit
