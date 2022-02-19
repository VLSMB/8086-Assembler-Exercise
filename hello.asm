assume cs:code,ds:data
data segment
        db 'Hello World!$'
data ends
code segment
  start:mov ax,data
        mov ds,ax
        mov dx,0
        mov ax,0
        mov ah,09h
        int 21h

        mov ax,4c00h
        int 21h
code ends
end start
