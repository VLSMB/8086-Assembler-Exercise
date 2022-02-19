assume cs:code,ds:data,ss:stack
stack segment
	db 128 dup(0)
stack ends
data segment
	db 128 dup(0)
data ends
code segment
init:	mov ax,stack
	mov ss,ax
	mov sp,128
	mov ax,data
	mov ds,ax
	mov si,0
start:	mov ax,0
	int 16h
	cmp al,20h
	jb nochar
	mov [si],al
	inc si
	call reshow
	jmp short start

nochar:	cmp ah,0eh
	je delete
	cmp ah,1ch
	je enter
delete:	mov byte ptr [si],0
	dec si
	call reshow
	jmp short start
enter:	call reshow
	mov ax,4c00h
	int 21h
reshow:	push ax
	push es
	push cx
	push di
	push si
	mov ax,0b800h
	mov es,ax
	mov cx,2000
	mov di,0
cls:	mov byte ptr es:[di],0
	add di,2
	loop cls
	mov si,0
	mov di,0
sh:	mov al,[si]
	cmp al,0
	je reshowret
	mov es:[di],al
	inc si
        add di,2
	jmp short sh
reshowret:
	pop si
	pop di
	pop cx
	pop es
	pop ax
	ret
	
code ends
end init
