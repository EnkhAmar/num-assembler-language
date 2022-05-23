DrawRectangle MACRO x, y, w, h, c  
    LOCAL  loop1, loop2, loop3, loop4
    mov ah, 0ch
    mov al, c
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop1:
        int 10h 
        inc cx
        dec bl
        jnz loop1 
           
    mov bx, h 
    loop2: 
        int 10h 
        inc dx  
        dec bl
        jnz loop2  
        
    mov bx, w
     loop3:
        int 10h 
        dec cx
        dec bl
        jnz loop3   
         
    mov bx, h         
    loop4: 
        int 10h 
        dec dx  
        dec bl
        jnz loop4
 
    
endm  

DrawLineXRight macro x, y, w 
 
    
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y
    int 10h   
    
    mov bx, w
    loop5:
        int 10h 
        inc cx
        dec bl
        jnz loop5 
Endm

DrawLineYDown macro x, y, w  
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop6:
        int 10h 
        inc dx
        dec bl
        jnz loop6 
Endm 

DrawLineXLeft macro x, y, w 
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop7:
        int 10h 
        dec cx
        dec bl
        jnz loop7 
Endm  


DrawLineYUp macro x, y, w  
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop8:
        int 10h 
        dec dx
        dec bl
        jnz loop8 
Endm     



DrawLineLeftDown macro x, y, w 
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop9:
        int 10h 
        dec cx
        inc dx 
        dec bl
        jnz loop9 
Endm 

DrawLineLeftUp macro x, y, w 
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop10:
        int 10h 
        dec cx
        dec dx 
        dec bl
        jnz loop10 
Endm 

DrawLineRightUp macro x, y, w 
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop11:
        int 10h 
        inc cx
        dec dx 
        dec bl
        jnz loop11 
Endm   


DrawLineRightDown macro x, y, w 
    mov ah, 0ch
    mov al, 10
    int 10h
    
    mov cx, x
    mov dx, y 
    int 10h   
    
    mov bx, w
    loop11:
        int 10h 
        inc cx
        inc dx 
        dec bl
        jnz loop11 
Endm
    
    

org  100h

mov ah, 0   
mov al, 13h 
int 10h     

DrawRectangle 90, 20, 70, 70, 9 
DrawRectangle 90, 20, 10, 20, 9 
DrawRectangle 150, 20, 10, 20, 9
DrawRectangle 105, 40, 15, 10, 3
DrawRectangle 130, 40, 15, 10, 3
DrawLineYDown 120, 60, 5           
DrawLineYUp 130, 65, 5
DrawLineXRight 120, 73, 10  
DrawLineLeftDown 120, 73, 5
DrawLineRightDown 130, 73,5 
DrawRectangle 110, 90, 30, 10, 9
DrawRectangle 80, 100, 90, 100, 5
DrawRectangle 50, 100, 30, 100, 5
DrawRectangle 170, 100, 30, 100, 5
 
ret