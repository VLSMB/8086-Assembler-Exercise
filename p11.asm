assume cs:code,ds:data,ss:stack
stack segment
	dw 8 dup(0)
stack ends
data segment
	db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends
code segment
  start:mov ax,stack
	mov ss,ax
	mov sp,10H
	mov ax,data
	mov ds,ax
	mov si,0

	call letterc
	mov ax,4c00h
	int 21h

letterc:;uper the letters
	pushf
s:	cmp byte ptr [si],0
	je ok
	cmp byte ptr [si],61H
	jb jump
	cmp byte ptr [si],7AH
	ja jump
	
	mov al,[si]
	sub al,20H
	mov [si],al
jump:	inc si
	jmp short s
ok:	popf
	ret
code ends
end start
