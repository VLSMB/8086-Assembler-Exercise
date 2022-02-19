assume cs:code,ss:stack
stack segmet
        dw 8 dup(0)
stack ends
code segment
  start:mov ax,stack
        mov ss,ax

        mov ax,4240H
        mov dx,000FH
        mov cx,0AH

        call divdw

        mov ax,4c00H
        int 21H

  divdw:; dx=High 16, ax=Low 16, cx=divsion
        ; return dx=High 16, ax=Low 16, cx=more
        push ax
      	mov ax,dx
      	mov dx,0
      	div cx
      	mov bx,ax
      	pop ax
      	div cx
      	mov cx,dx
      	mov dx,bx
	ret
code ends
end start

