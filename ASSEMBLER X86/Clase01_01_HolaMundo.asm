
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.STACK   100h           ;Directiva que determina pila de 256 posiciones

CR  EQU  13             ;Definicion de retorno de carro
LF  EQU  10             ;Definicion de nueva linea

.DATA                   ;Seccion de datos con valores iniciales

    TEXTO   DB  LF,LF,LF,LF,LF,CR,'Jesus ','Hola mundo en ensamblador$'

.CODE                   ;Seccion de codigo de datos

    MOV AX,@DATA        ;Copia en AX la direccion donde se encuentra DATA   [AX,BX,CX y DX]
    MOV DS,AX           ;Copia de AX a DS
    
    MOV AH,09H
    INT 21H             ;Imprime la variable "TEXTO" en pantalla

    MOV AH,4CH          ;Se finaliza la ejecución del programa en curso, y se devuelve un código de retorno al programa padre
    INT 21H            

END




