assume cs:code
data segment
        db 'Welcome to masm!',0
data ends
code segment
  start:mov dh,8
        mov dl,3
        mov cl,2
        mov ax,data
        mov ds,ax
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
code ends
end start

