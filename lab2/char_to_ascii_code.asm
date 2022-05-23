org 100h 

mov ah, 1 
int 21h  
mov ah, 0
mov cx, 0 

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