
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.STACK   100h           ;Directiva que determina pila de 256 posiciones

CR  EQU  13             ;Definicion de retorno de carro
LF  EQU  10             ;Definicion de nueva linea

.DATA                   ;Seccion de datos con valores iniciales

    TEXTO1   DB  LF,CR,'Hola mundo en ensamblador$'
    TEXTO2   DB  LF,CR,'A es mayor $'
    TEXTO3   DB  LF,CR,'B es mayor $'
    TEXTO4   DB  LF,CR,'Son iguales $'
    dato     DB  ''

.CODE                   ;Seccion de codigo de datos

    MOV AX,@DATA        ;Copia en AX la direccion donde se encuentra DATA   [AX,BX,CX y DX]
    MOV DS,AX           ;Copia de AX a DS
    
    LEA DX,Texto1
    MOV AH,09H
    INT 21H
    
  
    MOV AX,50
    MOV BL,20
    DIV BL
    MOV Dato,AH         ;Que queda al final en AH? que queda al final en AL?

     
        
    MOV AX,30
    MOV BX,50
    CMP AX,BX            ;AX-BX
    JZ  Iguales             
    JG  Amayor
    
Bmayor:                     ;Etiqueta
    MOV DX,offset TEXTO3
    MOV AH,09H
    INT 21H 
    JMP FINAL
    
Amayor:
    MOV DX,offset TEXTO2
    MOV AH,09H
    INT 21H 
    JMP FINAL

Iguales:    
    MOV DX,offset TEXTO4
    MOV AH,09H
    INT 21H 
    JMP FINAL

FINAL:    
   
    MOV AH,4CH          ;Se finaliza la ejecución del programa en curso, y se devuelve un código de retorno al programa padre
    INT 21H            

END

