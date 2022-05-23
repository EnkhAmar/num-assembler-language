Decimal macro str
LOCAL start1, start2

push ax
push cx
push dx

mov ah, 0
mov cx, 0
mov dx, 0
mov al, str

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
Endm


org 100h


mov cx, 10
mov al, array[0]

loop1:
cmp al, array[si]
jg jump1
mov al, array[si]

jump1:

inc si

loop loop1

Decimal al


array db 10, 20, 30, 40, 50, 99, 70, 80, 90, 12
