;
; Universidad Tecnologica Latinoamericana en Linea
; Profesor Noe Amir Rodriguez Olivares
;
;-------------------------------------------------------
;Descripcion:
;       Programa para mutiplicar 2 valores
;      
;
;-------------------------------------------------------
;Equates o definiciones
    
;-------------------------------------------------------
Imprime macro mensaje                ;Macro declarada
  mov dx,offset mensaje             
  mov ah,09h
  int 21h
endm
                                                  
                                                        
;-------------------------------------------------------
    Org 100h           ;Inicio del codigo       
    
    .Data        
texto0 db 10,13,'Ingresa numero A de 2 digitos',10,13,'$'    
texto1 db 10,13,'Ingresa numero B de 2 digitos',10,13,'$'    
texto2 db 10,13,10, 'El valor es menor o igual a 100$'   
Valor      db ' $'
Valor1     db ' $'
Valor2     db ' $'
Multiplo   dw ' $'

.Code 

Inicio:
    Imprime texto0  
    CALL   Espera 
    MOV    Valor1,AL 
    
    Imprime texto1  
    CALL   Espera 
    MOV    Valor2,AL   
    
    MOV    AL,Valor2
    MUL    Valor1
    MOV    Multiplo,AX  
    

    

    CMP    Valor,100
    JG     ImprimeMayor
    JMP    ImprimeMenorIg   
    
ImprimeMayor:    
    mov    ah,09h                   ;  Imprime resultado de la comparación
    mov    dx,offset texto1       
    int    21h
    JMP    Salida 


ImprimeMenorIg:       
    mov    ah,09h                   ;  
    mov    dx,offset texto2       
    int    21h
    JMP    Salida 

Salida:     
 
    JMP     Inicio
    
    mov    ah,4CH                   
    int    21h   
    
    
Espera Proc Near    
    mov    si,0                    
    MOV    BX,0 
entrada:     
    mov     ah,1                 
    int     21h       
                                 
                                 
    cmp    al,13                 
    jz     termina               
                                 
    mov    bx[si],al             
    inc    si                    
    
    cmp    si,2
    jz     termina  
    jmp    entrada               


termina:                            ;Compara el valor del numero con 100d    
    MOV    AX,0  
    MOV    Valor,0  
    MOV    BX,0  
    mov    AX,bx[0]
    MOV    AH,0  
    sub    AX,48 
    mov    BX,10    
    mul    BX 
    ADD    Valor,AL 
    
    MOV    BX,0  
    mov    AX,bx[1]
    MOV    AH,0  
    sub    AX,48 
    mov    BX,1    
    mul    BX    
    ADD    AL,Valor
    Ret
    EndP      
    
                                  
    end
