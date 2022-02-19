assume cs:code,ds:data
data segment
        dw 77H,65H,6CH,63H,6FH,6DH,65H,20H,74H,6FH,20H,6DH,61H,73H,6DH,21H
data ends
code segment
  start:mov ax,data
        mov ds,ax
        mov ax,0B8B4H ; The 12th line
        mov es,ax
        mov cx,16
        mov bx,0
        mov si,0
     s0:mov al,[si]
        mov es:[bx],al
        mov byte ptr es:[bx+1],2H
        add bx,2
        add si,2
        loop s0
        
        mov cx,16
        mov si,0
     s1:mov al,[si]
        mov es:[bx+0AH],al
        mov byte ptr es:[bx+0BH],21H
        add bx,2
        add si,2
        loop s1
        
        mov cx,16
        mov si,0
     s2:mov al,[si]
        mov es:[bx+14H],al
        mov byte ptr es:[bx+15H],71H
        add bx,2
        add si,2
        loop s2
        mov ax,4c00h
        int 21h
code ends
end start
