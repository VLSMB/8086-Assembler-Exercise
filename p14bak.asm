assume cs:code 

code segment 

	string:db '00/02/04 06:08:10',0
	adress:db 9,8,7,4,2,0
	
	start:
	mov ax,cs
	mov ds,ax
	mov di,0
	mov si,0
	mov ax,0b800h
	mov es,ax
	mov ah,2
	mov cx,17
	s0:
	mov al,byte ptr [si]
	mov word ptr es:[12*160+40*2+di],ax; 向显存中写入初始字符串
	inc si
	add di,2
	loop s0
	
	mov si,0
	mov di,offset adress
	mov cx,6
	s:
	push cx
	mov al,[di]
	out 70h,al
	in al,71h
	
	mov ah,al
	mov cl,4
	shr ah,cl
	and al,00001111B
	pop cx
	
	add ah,30h
	add al,30h
	mov byte ptr es:[12*160+40*2+si],ah
	mov byte ptr es:[12*160+40*2+si+2],al
	inc di
	add si,6
	loop s
	
	mov ax,4c00h
	int 21h
	
	
code ends 

end start