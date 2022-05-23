org 100h
    mov ah, 1
    mov cl, 9h   
    int 21h 
    mov bl, al
    
    shr al, 4 
    cmp al, cl 
    jg jmp1
        add al, 30h
        jmp exit 
    jmp1: 
        add al, 37h
    exit:
    
    mov ah, 2 
    mov dl, al
    int 21h
    
    mov al, bl 
    shl al, 4
    shr al, 4 
    
    cmp al, cl 
    jg jmp2 
        add al, 30h 
    jmp exit1
    jmp2:
        add al, 37h 
    exit1:  
    
    mov ah, 2 
    mov dl, al
    int 21h
ret