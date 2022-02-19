assume cs:code,ss:stack,ds:data
data segment
	db 'conversation',0
data ends
stack segment
	db 16 dup(0)
stack ends
code segment
uper:	push ds
	push si
	mov ax,data
	mov ds,ax
	mov si,0
s:	mov ch,0
	mov cl,[si]
	cmp cl,0
	je ok
	sub cl,20H
	mov [si],cl
	inc si
	jmp short s
ok:	pop si
	pop ds
	iret
uperend:nop
start:	mov ax,cs
	mov ds,ax
	mov si,offset uper
	mov ax,0
	mov es,ax
	mov di,200H
	cld
	mov cx,offset uperend-offset uper
	rep movsb
        mov ax,0
        mov es,ax
	mov word ptr es:[7ch*4],200H
	mov word ptr es:[7ch*4+2],0
	int 7ch
	mov ax,data
	mov ds,ax
	mov ax,4c00h
	int 21h
code ends
end start
