 
 
 
 
 
 
; Descripcion: Programa que despliega N mensajes

Imprime  macro  mensaje
    MOV     AH,9                              ;Impresion en pantalla y
    MOV     DX,offset mensaje
    INT     21h                               ;llamada al sistema operativo
endm
       

Org    100h 


.STACK 100h
CR EQU 13                             ;Retorno de carro
LF EQU 10                             ;Nueva Linea
.DATA                                 ;Zona de datos  

TEXTO1   DB LF,CR,'Por favor ingresa un valor',CR,LF,'$'             ;Texto      
TEXTO2   DB LF,CR,'Mensaje$'                       ;Texto      
VALOR    DB ' $'
                                                     
.CODE                               
    MOV     AX,@DATA                          
    MOV     DS,AX                              
    
EsperaTecla:    
    MOV     AH,00H
    MOV     AL,03H
    INT     10H
    Imprime TEXTO1                      ;Se le solicita un valor a usuario
    
    MOV     AH,01H                      ;INT 01h- 
    INT     21H
    
    CMP     AL,49
    JL      EsperaTecla             ;Salta a etiqueta si AL<49
    CMP     AL,57
    JG      EsperaTecla 
    
    SUB     AL,48
    MOV     AH,0
    MOV     CX,AX    


bucle:
    Imprime TEXTO2   
    LOOP    bucle
    
    MOV     AH,4ch                            ;Termina el programa
    INT     21h

END           

                                  
                                  
                 