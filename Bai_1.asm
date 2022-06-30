.model small
.stack 100h
.data             
    msv db "Nhap ma sv: $"  
    str db 100 dup ('$') 
    inmsv db 10,13, 'Masv: $'
    ten db 10,13, "Ten sv: Nguyen Kim Trong$"
    
    msg db 10,13, "Nhap n: $" 
    n db 10,13, "n! = $"
    so10 dw 10
.code            
    mov ax, data
    mov ds, ax   
    
    mov ah, 09h
    lea dx, msv
    int 21h
    
    mov ah, 0Ah
    lea dx, str
    int 21h   
    
    mov ah, 09h
    lea dx, inmsv
    int 21h
    lea dx, [str+2]
    int 21h
    lea dx, ten
    int 21h
    
    mov ah, 09h
    lea dx, msg ;Nhap n
    int 21h  
    
    mov ah, 01h
    int 21h           
              
    sub al, 30h ;Chuyen chu thanh so '0' -> 0
      
   
    mov cx ,0   ; xor cx, cx
    mov cl, al  
    
    mov ah, 09h
    lea dx, n
    int 21h
           
    mov ax, 1   ; Khoi tao gia tri ban dau
    mov bx, 1   ; Bien tang dan
    
    gt:
        mul bx  ; ax = ax*bx
        inc bx  ; bx += 1
        cmp bx, cx  
        jbe gt  ; bc =< cx : tiep tuc
    mov cx,0
    
    nhap:           ; vd 123
        mov dx, 0
        div so10    ; 123%10 = 3
        add dx, 30h ; doi 3 -> '3'
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