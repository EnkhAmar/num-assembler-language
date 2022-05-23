Hexadecimal macro str
LOCAL jmp1,jmp2, exit, exit1
push ax
push cx
push dx
mov ah, 0
mov cx, 0
mov dx, 0

mov al, str
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
endm
Binary macro str
LOCAL stort1, label, xxa
push ax
push cx
push dx
mov ah, 0
mov cx, 0
mov dx, 0
mov al, str
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

endm
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

PrintSpace macro
mov dl, ' '
mov ah, 2
int 21h
Endm

Break macro
mov ah,00
int 16h
endm
Endline macro
mov ah, 2
mov dx, 10
int 21h
mov dl, 13
int 21h
endm
PrintMenu macro
mov dx, offset msg
mov ah, 9
int 21h
PrintSpace
PrintSpace
PrintSpace
mov dx, offset menu1
mov ah, 9
int 21h
Endline
mov dx, offset menu2
mov ah, 9

int 21h
PrintSpace
PrintSpace
PrintSpace
mov dx, offset menu3
mov ah, 9
int 21h
PrintSpace
mov dx, offset menu4
mov ah, 9
int 21h
PrintSpace
mov dx, offset menu5
mov ah, 9
int 21h
Endline
mov dx, offset menu6
mov ah, 9
int 21h

Endm
PrintReaded Macro
mov dx, offset readed
mov ah, 9
int 21h
Endm
PrintWrited Macro
mov dx, offset wrote
mov ah, 9
int 21h

Endm
calculateTime macro h1, m1, s1, h2, m2, s2
push ax
push bx
push cx
push dx
mov result, 0
mov Time1, 0
mov Time2, 0
xor ax, ax
mov al, h1
mul timeConst
add Time1, ax
xor ax, ax
mov al, m1
add ax, Time1
mul timeConst
mov Time1, ax
xor ax, ax
mov al, s1
add Time1, ax

xor ax, ax
mov al, h2
mul timeConst
add Time2, ax
xor ax, ax
mov al, m2
add ax, Time2

mul timeConst
mov Time2, ax
xor ax, ax
mov al, s2
add Time2, ax

mov ax, Time2
sub ax, Time1
mov result, ax

pop dx
pop cx
pop bx
pop ax
endline
mov dx, offset msg1
mov ah, 9
int 21h
PrintSpace
Decimal h1
mov dx, offset hour
mov ah, 9
int 21h
PrintSpace
Decimal m1
mov dx, offset minute
mov ah, 9
int 21h
PrintSpace
Decimal s1
mov dx, offset second
mov ah, 9
int 21h

PrintSpace
endline
mov dx, offset msg2
mov ah, 9
int 21h
PrintSpace
Decimal h2
mov dx, offset hour
mov ah, 9
int 21h
PrintSpace
Decimal m2
mov dx, offset minute
mov ah, 9
int 21h
PrintSpace
Decimal s2
mov dx, offset second
mov ah, 9
int 21h
PrintSpace
mov cl, s2
mov ch, s1
sub cl, ch
mov s2, cl
endline
mov dx, offset msg3
mov ah, 9
int 21h
PrintSpace
mov ax, result
mov h1, al
Decimal h1
mov dx, offset second
mov ah, 9
int 21h

PrintSpace

endm
CreateFile Macro filename
mov ah, 3ch
mov cx, 0
mov dx, offset filename
int 21h
jc err
err:
nop
Endm
CreateDir Macro director
mov dx, offset director
mov ah, 39h
int 21h
Endm
OpenFile Macro filename, handle
mov al, 2
mov dx, offset filename
mov ah, 3dh
int 21h
mov handle, ax
Endm
CloseFile Macro handleCF
mov ah, 3eh
mov bx, handleCF
int 21h
Endm
WriteToFileText Macro filename, input, size
LOCAL handleW
handleW dw ?

OpenFile filename, handleW
mov ah, 40h
mov bx, handleW
mov dx, offset input
mov cx, size
int 21h
CloseFile handleW
Endm
ReadFile Macro filename, cont
handleR dw ?
OpenFile filename, handleR
mov ah,3Fh
mov cx,255
mov dx,offset cont
mov bx,handleR
int 21h
mov dx,offset cont
add dx,ax
mov bx,dx
mov byte [bx],'$'

CloseFile handleR
mov handleR, 0
Endm
FindLenght Macro String, len
LOCAL jmp1, jmp2
xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx
mov bx, offset len

mov bx, offset String
mov si, 0
mov cx, 0
jmp1:
cmp [bx+si], 24h
je jmp2
inc cx
inc si
jmp jmp1
jmp2:
mov len, cx

Endm
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
PutIntoString buffer1, 30h
mov dl, 30h
int 21h
jmp xxa
label:
mov ah, 2
PutIntoString buffer1, 31h
mov dl, 31h
int 21h

xxa:
pop ax
loop stort1
PutIntoString buffer1, 20h
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

PutIntoString buffer1, dl
mov ah, 2
int 21h
loop start2
PutIntoString buffer1, 20h
pop dx
pop cx
pop ax
ENDM
PutIntoString macro str, input
push dx
push si
mov si, idx1
mov al, input
mov str[si], al
inc idx1
pop si
pop dx
Endm

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
PutIntoString buffer1, al
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
PutIntoString buffer1, al
mov ah, 2
mov dl, al
int 21h
PutIntoString buffer1, 20h
pop dx
pop cx
pop ax
ENDM
InputString macro
mov dx, OFFSET input
mov ah, 0Ah

int 21h
endm
PrintHex macro
LOCAL loop1
xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx
mov ch, 0
mov cl, input[1]
mov si, 2
loop1:
endline
mov dl, input[si]
int 21h
mov dl, ' '
int 21h

Hexadecimal input[si]
mov dl, ' '
mov ah, 2
int 21h
inc si
loop loop1
endm
PrintBinary macro
LOCAL loop1
mov ch, 0
mov cl, input[1]
mov si, 2
loop1:
endline
mov dl, input[si]
int 21h
mov dl, ' '

int 21h

Binary input[si]
mov dl, ' '
mov ah, 2
int 21h
inc si
loop loop1
endm
PrintDecimal macro
LOCAL loop1
mov ch, 0
mov cl, input[1]
mov si, 2
loop1:
endline
mov dl, input[si]
int 21h
mov dl, ' '
int 21h

Decimal input[si]
mov dl, ' '
mov ah, 2
int 21h
inc si
loop loop1
endm

PrintConvert Macro
LOCAL loop1
FindLenght buffer, lenght1

mov cx, 0
mov dx, OFFSET buffer
mov cx, lenght1
mov si, 0
mov idx1, 0h
loop1:
push ax
push dx

mov ah, 2
mov dx, 10
int 21h
mov dl, 13
int 21h
mov dl, buffer[si]
PutIntoString buffer1, dl
PutIntoString buffer1, 20h
int 21h
mov dl, ' '
int 21h
pop dx
pop dx
16t buffer[si]
mov dl, ' '
mov ah, 2
int 21h
2t buffer[si]
mov dl, ' '
mov ah, 2
int 21h
10t buffer[si]
mov dl, ' '
mov ah, 2
int 21h

inc si

PutIntoString buffer1, 0Ah
PutIntoString buffer1, 0Dh
loop loop1
PutIntoString buffer1, dollarSign

Endm

DrawRectangle MACRO x, y, w, h, c
LOCAL loop1, loop2, loop3, loop4
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

DrawImage Macro
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
mov ah, 0h
mov al, 03h
int 10h
PrintMenu
mov ax, 0001h
int 33h
Endm

org 100h
mov ah, 0h
mov al, 03h
int 10h
PrintMenu
mov ax, 0001h
int 33h
start:
mov ax, 0003h
int 33h
cmp bx, 01h
jnz jump99
cmp dx, 8
jg jump1
cmp cx, 110
jg jump2
mov ah, 2ch
int 21h

mov hour1, ch
mov min1, cl
mov sec1, dh

Endline

ReadFile file1, buffer
Endline

mov dx, offset buffer

mov ah, 9
int 21h
Endline
PrintReaded
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh
calculateTime hour1, min1, sec1, hour2, min2, sec2

jmp jump1:
jump2:

cmp cx, 240
jg jump3
mov ah, 2ch
int 21h
mov hour1, ch
mov min1, cl
mov sec1, dh

Endline
PrintConvert
CreateFile output
FindLenght buffer1, lenght
WriteToFileText output, buffer1, lenght

PrintWrited
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh
calculateTime hour1, min1, sec1, hour2, min2, sec2

jmp jump1:
jump3:

jump1:
cmp dx, 10h
jg jump4
cmp cx, 95
jg jump5
endline
InputString
jmp jump4
jump5:
cmp cx, 143
jg jump6

mov ah, 2ch
int 21h
mov hour1, ch
mov min1, cl
mov sec1, dh
endline
PrintHex
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh
calculateTime hour1, min1, sec1, hour2, min2, sec2
jmp jump4
jump6:
cmp cx, 175
jg jump7
mov ah, 2ch
int 21h
mov hour1, ch
mov min1, cl
mov sec1, dh
endline
PrintBinary
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh
calculateTime hour1, min1, sec1, hour2, min2, sec2

jmp jump4

jump7:

cmp cx, 207
jg jump8
mov ah, 2ch
int 21h
mov hour1, ch
mov min1, cl
mov sec1, dh
endline
PrintDecimal
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh
calculateTime hour1, min1, sec1, hour2, min2, sec2
jmp jump4

jump8:
jump4:
cmp dx, 18h
jg jump9
cmp cx, 77
jg jump10
mov ah, 2ch
int 21h
mov hour1, ch

mov min1, cl
mov sec1, dh
DrawImage
mov ah, 2ch
int 21h
mov hour2, ch
mov min2, cl
mov sec2, dh

calculateTime hour1, min1, sec1, hour2, min2, sec2
jmp jump4
jump10:

jump9:
jump99:
jmp start

jmp go
Time dw 0
hour1 db 0
min1 db 0
sec1 db 0
hour2 db 0
min2 db 0
sec2 db 0
Time1 dw 0
Time2 dw 0
result dw 0
timeConst dw 60
idx1 dw ?
lenght dw ?
lenght1 dw ?
hour db "Hour$"
minute db "min$"
second db "sec$"

dollarSign db '$'

input db 20, ?, 20 dup(' ')
;msg db "READ FROM FILE$"
menu1 db "CONVERT WRITE TO FILE$"
menu2 db "INPUT STRING$"
menu3 db "HEX$"
menu4 db "BIN$"
menu5 db "DEC$"
menu6 db "DRAW IMAGE$"
readed db "FIlE READED$"
wrote db "FILE WRITTEN$"
msg1 db "Start Date;$"
msg2 db "Finished date;$"
msg3 db "Executed in:$"
dir1 db "C:assem-lab", 0
file1 db "c:\assem-lab\file1.txt", 0
output db "c:\assem-lab\output.txt", 0
buffer db 5 DUP ?
msg db "READ FROM FILE$"
buffer1 db 200 DUP ?

go:
ret