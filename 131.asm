assume cs:code
code segment
sqr:	mul ax
	iret
sqrend:	nop
	
  start:mov ax,cs
	mov ds,ax
	mov ax,offset sqr
	mov si,ax
	mov cx,offset sqrend-offset sqr
	mov ax,0
	mov es,ax
	mov di,200H
	cld
	rep movsb

	mov ax,0
	mov es,ax
	mov word ptr es:[7ch*4], 200H
	mov word ptr es:[7ch*4+2],0

	mov ax,3456
	int 7ch
	add ax,ax
	adc dx,dx
	mov ax,4c00h
	int 21h
code ends
end start