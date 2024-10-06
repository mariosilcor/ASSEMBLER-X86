;-----------------------------------------------------
; Semana 6. Codigo 01
;
; Universidad UTEL 
; Ejemplo uso de macros

Imprime macro mensaje                ;Macro declarada
  mov dx,offset mensaje             
  mov ah,09h
  int 21h
endm

 Org 100h                          ;Inicio del codigo       
.data
   mensaje0 db 10,13,'Primer mensaje$'    
   mensaje1 db 10,13,'Segundo mensaje$'
   mensaje2 db 10,13,'Tercer mensaje$'  
.code
  Imprime mensaje0
  Imprime mensaje1
  Imprime mensaje2
  Imprime mensaje1
  Imprime mensaje2
  
  mov ax,4ch       ;Sale del programa
  int 21h
end    


