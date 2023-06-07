%include 'library.asm'

section .data
    arr_ptr dd  17, 21, 13, 17, 14, 12
    n_ptr   dd  6

section .text
    global _start
    
_start:
    mov ebx, arr_ptr        ; ebx = arr_ptr
    push ebx                ; запушили в стек указатель на массив
    xor ecx, ecx            ; ecx = 0

NEXT_NUMBER:
    cmp ecx, 0              ; if ecx == 0 goto NOT_FOUND (0й элемент)
    je NOT_FOUND            ;
    mov edx, ecx            ; edx = ecx
    cmp ecx, [n_ptr]        ; if ecx >= *n_ptr goto EXIT (прошли все элементы)
    jge EXIT                ;
    pop ebx                 ; забрали из стэка указатель на массив
    add ebx, 4              ; сдвинули указатель
    push ebx                ; запушили в стек указатель на массив
    mov eax, [ebx]          ; eax = *ebx

CHECK_PREVIOUS:
    dec edx                 ; edx--
    cmp edx, 0              ; if edx < 0 goto NOT_FOUND (закончились предыдущие элементы)
    jl NOT_FOUND            ;
    sub ebx, 4              ; сдвинули указатель
    cmp eax, [ebx]          ; if eax < *ebx goto WARM_FOUND (нашли предыдущее число больше текущего)
    jl WARM_FOUND           ;
    jmp CHECK_PREVIOUS

WARM_FOUND:
    mov eax, [ebx]

PRINT:
    call print_number
    inc ecx                 ; увеличили счетчик
    jmp NEXT_NUMBER

NOT_FOUND:
    mov eax, -1    
    jmp PRINT

EXIT:
    call exit
