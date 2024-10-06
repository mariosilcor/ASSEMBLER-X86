;
; Universidad Tecnologica Latinoamericana en Linea
; Profesor Noe Amir Rodriguez Olivares
;
;                                     
; Descripcion: Programa que filtra solo los numeros
;              y elimina el texto
;-------------------------------------------------------
    Org 100h      ;Inicio del codigo     
.Data 
texto0 db 'Por favor ingresa la cadena con letras y numeros',13,10,'$'
texto1 db 10,13,'El numero es: $'
texto2 db 10,13,10, 'Programa terminado$'

.Code      

    mov ah,09H
    mov dx,offset texto0
    int 21h


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
    mov ah,00h      ;Limpia la pantalla
    mov al,03h
    int 10h       
    
    
    mov ah,9               ;Impresion de texto 1                    
    mov dx,offset texto1
    int 21h                                 
    
    mov bx[si],"$"         ;Se anade el signo $ para terminar una cadena
    mov dx,offset bx
    mov ah,9               ;preparar ah con 9 para la interrupcion 21h
    int 21h                ;mostrar contenido guardado en bx
    
    mov ah,9               ;Impresion de texto 2                    
    mov dx,offset texto2
    int 21h                                 
    end    
                              
                                  
                                  






