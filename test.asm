assume cs:code
code segment
start:	mov ax,0b800h
	mov es,ax
	mov bx,1
	mov cx,4000
	mov al,20
s:	add byte ptr es:[bx],al
	inc bx
	inc al
	call delay
	loop s
	jmp short start

delay:	push ax
	push dx
	mov dx,10h
	mov ax,0
s1:	sub ax,1
	sbb dx,0
	cmp ax,0
	jne s1
	cmp dx,0
	jne s1
	pop dx
	pop ax
	ret
code ends
end start