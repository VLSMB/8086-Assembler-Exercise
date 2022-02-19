assume cs:code
data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'
        ; The strings of 21 years

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,184300,2759000,3753000,4649000,5937000
        ; Dwords of total profile in 21 years

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800
        ; Words of the number of clark in 21 years
data ends
table segment
        db 21 dup ('year summ ne ?? ')
table ends

code segment
  start:mov ax,data
	mov es,ax
	mov ax,table
	mov ds,ax
	mov bx,0
	mov si,0
	mov di,0
	mov ax,0
	; Initializing

	mov cx,21
      s:mov ax,es:[si]
        mov [bx],ax
        mov ax,es:[si+2]
	mov [bx+2],ax
	; edit years

	mov ax,es:[si+54H]
	mov dx,es:[si+56H]
	mov [bx+5],ax
	mov [bx+7],ax
	; edit profiles

	mov bp,word ptr es:[di+168]
	mov [bx+0AH],bp
	; edit numbers

	div bp
	mov [bx+0DH],ax
	; get average

	add si,4
        add bx,16
	add di,2
        loop s


        mov ax,4c00h
        int 21h
code ends
end start



