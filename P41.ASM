assume cs:code
code segment
        mov ax,0020H
        mov ds,ax
        mov cx,40H
        mov bx,0
      s:mov ds:[bx],bl
        inc bx
        loop s

        mov ax,4c00h
        int 21h
code ends
end
