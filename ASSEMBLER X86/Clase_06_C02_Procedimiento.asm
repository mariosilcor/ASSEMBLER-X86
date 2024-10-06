;-----------------------------------------------------
; Semana 6. Codigo 02
;
; Universidad UTEL 
; Ejemplo uso de macros  y procedimientos
;
; Descripcion: Programa que filtra solo los numeros
;              y elimina el texto
;-----------------------------------------------------

Imprime macro mensaje                ;Macro declarada
  mov dx,offset mensaje             
  mov ah,09h
  int 21h
endm
    
;-------------------------------------------------------
    Org 100h      ;Inicio del codigo     
      
.Data 

texto0 db 'Por favor ingresa la cadena con letras y numeros',13,10,'$'
texto1 db 10,13,'El numero es: $'
texto2 db 10,13,10, 'Programa terminado$'

.Code      
    Imprime texto0
    Call    Espera

    mov ah,00h      ;Limpia la pantalla
    mov al,03h
    int 10h       
    
    
    Imprime texto1
    mov bx[si],"$"         ;Se anade el signo $ para terminar una cadena
    Imprime bx
    
    Imprime texto2     
bucle:
    jmp     bucle    
    

Espera Proc Near    
    mov si,0        ;Se inicia en 0 el registro "si"       
                    ;  consulte http://www.cs.buap.mx/~mgonzalez/asm_mododir2.pdf

entrada:            ;Etiqueta para volver a esperar caracter
    mov ah,1        ;Espera de caracter con eco
    int 21h         ;  consulte http://ict.udlap.mx/people/oleg/docencia/ASSEMBLER/asm_interrup_21.html
                    ;recuerde que en AL = codigo ASCII del Carácter leido

    cmp al,13       ;Se presiono la tecla enter?
    jz termina      ;si se presiono enter (valor numerico 13) ve a resultado  
                    ;para entender porque el 13 revise el codigo ASCII  
    
    cmp al,57       ;Compara el numero de la tecla con 57?
    ja  entrada     ;brinca a entrada si es mayor a 57
    cmp al,47       ;Compara el numero de la tecla con 47?
    jng entrada     ;brinca a entrada si es menor o igual a 47
    
                    ;Aqui llega solo aquel valor entre 0 y 9 en ASCII    
    mov bx[si],al   ;si es un digito entonces lo guardo en bx
    inc si          ;incrementa el registro si
    jmp entrada     ;regresa para esperar otro dato

termina: 
    Ret
    EndP   
                                   
    end    
