DATA   SEGMENT                               
INPUT  DB  "Please input a string: ",'$'
OUTPUT DB  "Your input is: ",'$'
BUFFER DB  20				    ;Ԥ����20�ֽڵĿռ�
       DB  ?				    ;��������ɺ��Զ����������ַ�����
       DB  20  DUP(0)    
CRLF   DB  0AH, 0DH,'$'                   
DATA   ENDS                                  
STACK  SEGMENT   STACK                       
       DW  20  DUP(0)                      
STACK  ENDS                                  
CODE   SEGMENT                              
ASSUME CS:CODE, DS:DATA, SS:STACK            
START:                                       
        MOV AX, DATA                         
        MOV DS, AX                      
        LEA DX, INPUT                        ;��ӡ��ʾ������Ϣ    
        MOV AH, 09H							 
        INT 21H
        LEA DX,BUFFER                        ;�����ַ���
        MOV AH, 0AH
        INT 21H
        MOV AL, BUFFER+1                     ;���ַ������д���
        ADD AL, 2
        MOV AH, 0
        MOV SI, AX
        MOV BUFFER[SI], '$'
        LEA DX, CRLF                         ;��ȡһ��                   
        MOV AH, 09H							 
        INT 21H
        LEA DX, OUTPUT                       ;��ӡ��ʾ�����Ϣ
        MOV AH, 09H							 
        INT 21H
        LEA DX, BUFFER+2                     ;���������ַ���
        MOV AH, 09H							 
        INT 21H
        LEA DX, CRLF                         ;��ȡһ��                  
        MOV AH, 09H							 
        INT 21H
 
        MOV AH, 4CH                          ;����DOSϵͳ
        INT 21H
CODE   ENDS                                  
END    START                                 