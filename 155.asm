assume cs:code,ss:stack
stack segment
	db 128 dup(0)
stack ends
code segment
start:	mov ax,stack
	mov ss,ax
	mov sp,128
	mov ax,cs
	mov ds,ax
	mov si,offset int9
	mov ax,0
	mov es,ax
	mov di,204H
	mov cx,offset int9end-offset int9
	cld
	rep movsb
	
	push es:[9*4]
	pop es:[200h]
	push es:[9*4+2]
	pop es:[202h]
	cli
	mov word ptr es:[9*4],204h
	mov word ptr es:[9*4+2],0
	sti
	mov cx,200
t:	call delay
	loop t
	
	cli
	push es:[200h]
	pop es:[9*4]
	push es:[202h]
	pop es:[9*4+2]
	sti
	mov ax,4c00h
	int 21h

int9:	push ax
	push es
	push bx
	push cx
	in al,60h
	pushf
	call dword ptr cs:[200h]
	cmp al,3bh
	jne int9ret
	
	mov ax,0b800h
	mov es,ax
	mov bx,1
	mov cx,2000
	mov byte ptr es:[bx],20H
s:	add es:[bx],bl
	add bx,2
	loop s
int9ret:pop cx
	pop bx
	pop es
	pop ax
	iret
int9end:nop

delay:	push ax
	push dx
	mov dx,100h
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