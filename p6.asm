assume cs:code,ss:stack,ds:data
stack segment
        dw 0,0,0,0,0,0,0,0
stack ends
data segment
        db '1. display      '
        db '2. brows        '
        db '3. replace      '
        db '4. modify       '
data ends
code segment
  start:mov ax,data
        mov ds,ax
        mov ax,stack
        mov ss,ax
        mov sp,10H
        mov ax,0
        mov bx,0
        mov cx,4
      r:mov si,0
        push cx
        mov cx,4
      s:mov al,[bx+si+3]
        and al,11011111B
        mov [bx+si+3],al
        inc si
        loop s
        pop cx
        add bx,10h
        loop r

        mov ax,4c00h
        int 21h
code ends
end start
