assume cs:code,ds:data
data segment
	db 'Welcome to masm!'
	db 16 dup (0)
data ends
code segment
  start:mov cx,16
	mov ax,data
	mov ds,ax
	mov es,ax
	mov si,0
	mov di,16
	cld
	rep movsb
	mov ax,4c00h
	int 21h
code ends
end start