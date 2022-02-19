assume cs:code
data segment
        dw 10 dup(0)
data ends
code segment
  start:mov ax,12666
	mov bx,data
	mov ds,bx
	mov si,0
	mov dx,0
	call dtoc
	
	mov dh,8
        mov dl,3
        mov cl,2
        mov si,0
        call showstr

        mov ax,4c00h
        int 21h
showstr:; dh=row, dl=colum, cl=color, ds:si=char
        mov bl,cl
        mov di,si

        mov al,0A0H
        mul dh
        add dl,dl
        add al,dl
        add di,ax

      s:mov ch,0
        mov cl,ds:[si]
        jcxz ok
        mov ax,0B800H
        mov es,ax

        
        mov al,ds:[si]
        mov es:[di],al
        mov es:[di+1],bl
        add si,1
        add di,2
        jmp short s
     ok:mov cl,bl
        ret

   dtoc:; ax=the number to str
	push si
	push bx
	push dx
	mov si,4
     s2:jcxz ok2
	mov bx,10
	mov dx,0
	div bx
	mov cx,ax
	add dl,30H
	mov [si],dl
	dec si
	jmp short s2
     ok2:pop dx
	pop bx
	pop si
	ret
	
	
code ends
end start

