assume cs:code,ss:stack
stack segment
	db 128 dup(0)
stack ends
code segment
start:	mov ax,stack
	mov ss,ax
	mov sp,128
	mov ax,code
	mov ds,ax
	mov si,offset setscreen
	mov ax,0
	mov es,ax
	mov di,200H
	mov cx,offset setend-offset setscreen
	cld
	rep movsb
	mov ax,0
	mov ds,ax
        mov word ptr ds: [7ch*4],200H
        mov word ptr ds: [7ch*4+2],0
	
	mov ah,1
	int 7ch
	mov ax,4c00h
	int 21h

setscreen: jmp short set

    table  dw sub1,sub2,sub3,sub4

set:	push bx
	
	cmp ah,3		;�жϴ��ݵ��Ƿ���� 3
	ja sret
	mov bl,ah
	mov bh,0
	add bx,bx		;����ah�еĹ��ܺż����Ӧ�ӳ���ĵ�ַ��table���е�ƫ��
	
	call word ptr table[bx]	;���ö�Ӧ�Ĺ����ӳ���

sret:	pop bx	
	iret

;�����ӳ���1������
sub1:   push bx
	push cx
        push es
        mov bx,0b800h
        mov es,bx
        mov bx,0
        mov cx,2000
sub1s:  mov byte ptr es:[bx],' '
        add bx,2
        loop sub1s
        pop es
        pop cx
        pop bx
	ret ;sub1 ends

;�����ӳ���2������ǰ��ɫ
sub2:	push bx
	push cx
	push es
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
sub2s:	and byte ptr es:[bx],11111000b	
	or es:[bx],al 
	add bx,2
	loop sub2s

	pop es
	pop cx
	pop bx
	ret ;sub2 ends

;�����ӳ���3�����ñ���ɫ
sub3:	push bx
	push cx
	push es
	mov cl,4
	shl al,cl
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
sub3s:	and byte ptr es:[bx],10001111b
	or es:[bx],al 
	add bx,2
	loop sub2s

	pop es
	pop cx
	pop bx
	ret ; sub3 ends

;�����ӳ���4�����Ϲ���һ��
sub4:	push cx
	push si
	push di
	push es
	push ds

	mov si,0b800h
	mov es,si
	mov ds,si
	mov si,160			;ds:siָ���n+1��
	mov di,0			;es:diָ���n��
	cld
	mov cx,24;������24��

sub4s:	push cx
	mov cx,160
	rep movsb 			;����
  	pop cx
	loop sub4s

	mov cx,80	
	mov si,0
sub4s1: mov byte ptr es:[160*24+si],' '		;���һ�����
	add si,2
	loop sub4s1

	pop ds
	pop es
	pop di
	pop si
	pop cx
	ret ;sub4 ends
setend:	nop
code ends
end start