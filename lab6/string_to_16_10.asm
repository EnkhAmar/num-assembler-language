2t MACRO p1   
    
    push ax
    push cx
    push dx  
      
    mov ah, 0
    mov cx, 0
    mov dx, 0
    
    mov al, p1 
    mov cx, 8
    mov bh, 0 
    mov bl, al 
    stort1:
        shl al, 1 
        push ax
        jc label
            mov ah, 2
            mov dl, 30h
            int 21h
        jmp xxa 
        label:
            mov ah, 2 
            mov dl, 31h
            int 21h 
        xxa:
        pop ax
        loop stort1            
                
     pop dx
     pop cx
     pop ax           
                 
ENDM

10t MACRO p1
    push ax
    push cx
    push dx  
      
    mov ah, 0
    mov cx, 0
    mov dx, 0 
    mov al, p1 

    start1:
        aam
  
        mov bl, al 
        mov bh, ah 
            
        mov ax, 0
        mov al, bl 
    
        push ax 
        inc cx

        mov al, bh 
        mov ah, 0 
    
        cmp al, 0 
        jnz start1   
    start2: 

    pop dx
    add dx, 30h
    mov ah, 2
    int 21h
    loop start2
    
    pop dx
    pop cx
    pop ax    
ENDM
                          
                          
16t MACRO p1
    
    push ax
    push cx
    push dx  
      
    mov ah, 0
    mov cx, 0
    mov dx, 0
    
     
    mov al, p1 
    mov cl, 9h 
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
    
    pop dx
    pop cx
    pop ax
    
ENDM   

print10t macro 
    
    push dx  
    
    mov dx, 0 
    mov dx, 10     
    mov AH, 02h
    int 21h  
    
    pop dx           
    mov si, 2
    start3:
       10t buffer[si] 
       mov dl,' ' 
       mov ah, 2
       int 21h
       inc si
    loop start3 
    mov cl,buffer[1]              
ENDM 


ORG 100h   
mov cx, 0 
mov dx, OFFSET buffer 
mov ah, 0Ah 
int 21h
mov cl,buffer[1]  
mov si, 2
loop1:
    push ax
    push dx
    
    
    
    mov ah, 2 
    mov dx, 10
    int 21h 
    mov dl, 13
    int 21h
    mov dl, buffer[si]
    int 21h
    mov dl, ' '
    int 21h 
  
    pop dx
    pop dx    
    
    2t buffer[si]    
       mov dl, ' '
       mov ah, 2
       int 21h 
    
    10t buffer[si]
     mov dl, ' '
       mov ah, 2
       int 21h
    
    16t buffer[si]
       mov dl, ' '
       mov ah, 2
       int 21h       
       
    inc si       
                
    loop loop1            


buffer DB 20,?, 20 dup(' ')
ret