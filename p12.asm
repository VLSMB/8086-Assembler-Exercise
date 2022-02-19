assume cs:code

code segment

d0:	jmp short d0start
str:	db 'divide ERROR!$'
d0start:mov dx,offset str
	mov ax,0900h
	int 21h
	mov ax,4c00h
	int 21h
d0end:	nop

start:	mov ax,cs
	mov ds,ax
	mov si,offset d0
	mov ax,0
	mov es,ax
	mov di,200h
	mov cx,offset d0end-offset d0
	cld
	rep movsb
	
	mov ax,0
	mov es,ax
	mov word ptr es:[0],200H
	mov word ptr es:[2],0
	
	int 0
	
	mov ax,4c00h
	int 21h
code ends
end start
	