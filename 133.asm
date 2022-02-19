assume cs:code,ss:stack
stack segment
	dd 8 dup(0)
stack ends
code segment
start:	mov ax,stack
	mov ss,ax
	mov sp,10H
	mov ax,cs
	mov ds,ax
	mov si,offset lp
	mov ax,0
	mov es,ax
	mov di,200H
	mov cx,offset lpend-offset lp
	rep movsb
	
	mov ax,0
        mov es,ax
	mov word ptr es:[7ch*4],200H
	mov word ptr es:[7ch*4+2],0

	mov ax,0b800h
	mov es,ax
	mov di,160*12
	mov bx,offset s-offset se ;s to se an negative number
	mov cx,80
s:	mov byte ptr es:[di],'!'
	add di,2
	int 7ch
se:	nop
	mov ax,4c00h
	int 21h

lp:	push bp
	mov bp,sp
	dec cx
	jcxz ok
	add [bp+2],bx
ok:	pop bp
	iret
lpend:	nop
	
code ends
end start