;
; Universidad Tecnologica Latinoamericana en Linea
; Profesor Noe Amir Rodriguez Olivares
; Lenguaje ensamblador
; Descripcion: Comparaciones

.STACK 100h     ;Define el tamano de pila de 256 valores       
LF EQU 10       ;Cuando encuentres LF lo sustituyes por el valor 10
CR EQU 13 

.DATA           ;Directiva para definir seccion de datos
Texto1 DB LF,LF,LF,CR,'UTEL universidad $'
Textoi DB LF,CR,'Son iguales $'
Textoa DB LF,CR,'A es mayor $'
Textob DB LF,CR,'B es mayor $' 
Dato DB ''   

.CODE               ;Directiva para definir dónde empieza el codigo a cargar
    
    MOV AX,@DATA    ;Copia en AX la direccion de DATA
    MOV DS,AX       ;Copia en DS el valor de AX       AX, BX y CX
    
    LEA DX,Texto1   ;Carga en DX el tamano de Texto1
    MOV AH,9
    INT 21H         ;Imprime en pantalla Texto 1        
    
    MOV AX,20       ;
    MOV BX,50       ;
    CMP AX,BX       ;
                    ;
                    ;
    JZ  Iguales     ;
    JG  Amayor      ;
Bmayor:
    MOV DX,offset Textob
    MOV AH,9
    INT 21H                            
    JMP FINAL    

Iguales:
    MOV DX,offset Textoi
    MOV AH,9
    INT 21H                            
    JMP FINAL

Amayor:
    MOV DX,offset Textoa
    MOV AH,9
    INT 21H                                
    
FINAL:

    MOV AX,50
    MOV BL,20
    DIV BL         ;Divide AX entre BL  Div=2  Residuo=10    
    MOV Dato,AH
    
    MOV AH,4CH
    INT 21H
    
END
