org 100h
    mov ah, 1 
    int 21h
    
    mov cx, 8
    mov bh, 0 
    mov bl, al 
    start: 
        shl al, 1 
        push ax 
        jc jmp1
            mov ah, 2 
            mov dl, 30h 
            int 21h 
            
        jmp exit
        jmp1:
            mov ah, 2
            mov dl, 31h 
            int 21h 
        exit:
            pop ax 
            LOOP start 
ret