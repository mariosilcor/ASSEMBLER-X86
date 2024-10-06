 
 
 
 
 
 
; Descripcion: Programa 
; El programa acepta valores de >=32 del codigo ASCII
; Si se presiona "enter" termina la captura de datos

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
TEXTO1   DB LF,CR,'Por favor ingresa texto a guardar',CR,LF,'$'             ;Texto      
TEXTO2   DB LF,CR,'Mensaje: $'                                                ;Texto      
VALOR    DB ' $'
.CODE                               
    MOV     AX,@DATA                          
    MOV     DS,AX                              
    
    MOV     AH,00H
    MOV     AL,03H
    INT     10H
    Imprime TEXTO1                      ;Se le solicita un valor a usuario
    
    MOV     SI,0

EsperaTecla:        
    MOV     AH,01H                      ;INT 01h- 
    INT     21H
    
    CMP     AL,13                       ;13 es el valor ASCCI de enter
    JE      Continua
    CMP     AL,32
    JL      EsperaTecla                 ;Regresa a espera tecla, ya que el valor fue menor a 32
    
    MOV     BX[SI],AL
    INC     SI   
    JMP     EsperaTecla

Continua:    
    
   Imprime TEXTO2   
   MOV      BX[SI],'$'
   MOV      DX,offset BX
   MOV      AH,09H
   INT      21H
   
    
    MOV     AH,4ch                            ;Termina el programa
    INT     21h

END           

                                  
                                  
                 