assume cs:code,ss:stack

stack segment
	db 128 dup(0)
stack ends
data segment
	dw 0,0
data ends

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
	mov ax,data
	mov ds,ax
	cli
	push es:[9*4]
	pop es:[200H]
	push es:[9*4+2]
	pop es:[202H]
	mov word ptr es:[9*4],204h
	mov word ptr es:[9*4+2],0
	sti
	
	;push es:[0]
	;pop es:[9*4]
        ;push es:[2]
	;pop es:[9*4+2]
	mov ax,4c00h
	int 21h
int9:	push ax
	push cx
	push bx
	push ds
	in al,60h
	pushf
	call dword ptr cs:[200H]
	cmp al,9EH
	jne int9ret
	mov cx,80*25
	mov bx,0
	mov ax,0b800H
	mov ds,ax
int9s:	mov byte ptr ds:[bx],'A'
	add bx,2
	loop int9s 
int9ret:pop ds
	pop bx
	pop cx
	pop ax
	iret
int9end:nop

code ends
end start
