.model small
.stack 100h
.data             
    msv db "Nhap ma sv: $"  
    str db 100 dup ('$')
    ten db 10,13, "Ten sv: Nguyen Kim Trong $"
    
    msg db 10,13, "Nhap chuoi: $" 
    msg1 db 10,13, 'So ky tu: $'
    so10 dw 10

.code            
    mov ax, data
    mov ds, ax   
               
    mov ah, 09h
    lea dx, msv
    int 21h
    
    mov ah, 0Ah
    int 21h
    
    mov ah, 09h
    lea dx, ten
    int 21h  
    
    mov ah, 09
    lea dx, msg
    int 21h    
    
    mov cx,0 
    mov ax, 0            
    nhapchuoi:
        mov ah, 01h
        int 21h
        cmp al, 0Dh
        je con  ; Nhap xong in ten sv        
        inc cx      ; tang bien dem  
        jmp nhapchuoi
        
           
    con:
        mov ah, 09
        lea dx, msg1
        int 21h                                       
    
    mov ax, cx
    mov cx,0    
                   
    nhap:           ; vd 16
        mov dx, 0
        div so10    ; 16%10 = 6
        add dx, 30h ; doi 6 -> '6'
        push dx     ; dua vao ngan xep
        inc cx      ; tang cx
        cmp ax,0
        jne nhap    ; neu ax != 0 thi tiep tuc 
                    ; ngan xep: 3|2|1
    xuat:
        pop dx      ; day 1 -> day 2 -> day 3
        mov ah, 02h
        int 21h
        loop xuat                       
   
    
        
    mov ah, 04Ch
    int 21h