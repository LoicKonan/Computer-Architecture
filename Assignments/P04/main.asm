.model small
.STACK 100H
.data
covid db 20 dup(?)
.code
; RD procedure still useful
rd proc near ; pseudo code
mov ch,0 ; Value = 0
repit: mov ah,1
int 21h ; cin >>S
cmp al,13 ; while (S = \n)
je goback
sub al,30h
mov cl,al
mov al,ch ; prepare multiplication
mov ch,10
mul ch ; value*10
add al,cl ; value*10 + S
mov ch,al ; value = value *10 +S
jmp repit ; go read again
goback: mov al,ch ; place the result in AL
ret
rd endp
main: mov ax,@data
mov ds,ax
lea bx,covid ;initialize array pointer
call RD
; LAB 12 requires the code below to be modified
again: cmp al,0 ; while (number != 0
je prt ; when done go to print array
and al, 1fh ; extract and change bits
or al, 40h
mov [bx], al ; save result in array
add bx,1
call RD
jmp again ; jump to beginning of loop
prt: mov al,’$’ ; place $ in the array
mov [bx],al
lea dx,covid ; print string
mov ah,9
int 21h
mov ah,4ch
int 21h
end main