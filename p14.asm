assume cs:code,ds:data
data segment
	db '00/00/00 00:00:00$'
data ends
code segment
start:	mov ax,data
	mov ds,ax

	mov al,9
	mov si,0
	call read
	mov al,8
	call read
	mov al,7
	call read
	mov al,4
	call read
	mov al,2
	call read
	mov al,0
	call read

	mov dx,0
	mov ax,0900h
	int 21h
	mov ax,4c00h
	int 21h
	
read:	out 70h,al
	in al,71h
	mov ah,al
	mov cl,4
	shr ah,cl
	and al,00001111B
	add ah,30H
	add al,30H
	mov byte ptr ds:[si],ah
	mov byte ptr ds:[si+1],al
	add si,3
	ret
code ends
end start