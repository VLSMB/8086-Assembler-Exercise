assume cs:code
data segment
	db 'conversation',0
data ends
code segment
jump:	push bp
	mov bp,sp
	add [bp+2],bx
	pop bp
	iret
jumpend:nop
start:	; install 7ch program
	mov ax,code
	mov ds,ax
	mov si,offset jump
	mov ax,0
	mov es,ax
	mov di,200H
	mov cx,offset jumpend-offset jump
	cld
	rep movsb
	mov ax,0
	mov ds,ax
        mov word ptr ds: [7ch*4],200H
        mov word ptr ds: [7ch*4+2],0

	mov ax,data
	mov ds,ax
	mov si,0
	mov ax,0b800h
	mov es,ax
	mov di,12*60
s:	cmp byte ptr [si],0
	je ok
	mov al,[si]
	mov es:[di],al
	inc si
	add di,2
	mov bx,offset s-offset ok
	int 7ch
ok:	mov ax,4c00h
	int 21h
code ends
end start
