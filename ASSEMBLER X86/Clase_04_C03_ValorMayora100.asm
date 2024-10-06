
 ;
; Universidad Tecnologica Latinoamericana en Linea
; Profesor Noe Amir Rodriguez Olivares
;
;-------------------------------------------------------
;Descripcion:
;       Programa que indica si un valor es mayor a 100
;      
;
;-------------------------------------------------------
;Equates o definiciones
    
;-------------------------------------------------------
    Org 100h           ;Inicio del codigo       
    
    .Data        
texto0 db 10,13,'Ingresa numero de 3 digitos',10,13,'$'    
texto1 db 10,13,'El valor es mayor a 100 $'
texto2 db 10,13,10, 'El valor es menor o igual a 100$'   
Valor     dw ''

.Code 

Inicio:
    mov    ah,09h                   ;  Solicita numero de 3 digitos y lo almacena
    mov    dx,offset texto0       
    int    21h
  
    mov     si,0                 
entrada:                         
    mov     ah,1                 
    int     21h       
                                 
                                 
    cmp    al,13                 
    jz     termina               
                                 
    mov    bx[si],al             
    inc    si                    
    
    cmp    si,3
    jz     termina  
    jmp    entrada               


termina:                            ;Compara el valor del numero con 100d    
    

    mov    AX,bx[0]
    MOV    AH,0  
    sub    AX,48 
    mov    BX,100    
    mul    BX 
    mov    Valor,AX 
    
    MOV    BX,0  
    mov    AX,bx[1]
    MOV    AH,0  
    sub    AX,48 
    mov    BX,10    
    mul    BX 
    ADD    Valor,AX 
    
    MOV    BX,0  
    mov    AX,bx[2]
    MOV    AH,0  
    sub    AX,48 
    mov    BX,1    
    mul    BX 
    ADD    Valor,AX 

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
    end
