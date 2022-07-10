.model small
.stack 100h
.data             
    msv db "Nhap ma sv: $" 
    strMsv db 100 dup ('$')
    ten db 10,13, "Ten sv: Nguyen Kim Trong - $"
    input db 10,13, "Nhap chuoi so: $" 
    str db 100 dup('$')
    msg db 10,13, "Tong: $"  
    sum dw 0
    so10 dw 10

.code            
    mov ax, data
    mov ds, ax   
    
    mov ah, 09h
    lea dx, msv
    int 21h
    
    mov ah, 0Ah
    lea dx, strMsv
    int 21h             
            
    mov ah, 09h
    lea dx, ten
    int 21h
    lea dx, [strMsv+2] 
    int 21h
    lea dx, input
    int 21h
    
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    lea si, [str+2] ; 12,13,14'0Dh$$$$$$$$$$$$
    
    mov ax, 0
    ;mov bx, 0 ; co the dung bx thay bien sum
    nhapchuoi:
        mov dx, [si]         
        cmp dl, 0Dh ; het chuoi dung
        je exit
        cmp dl, ',' ; neu gap , thi hoan thien 1 so 
        je calc
        mul so10    ; ax *= 10
        mov dx, [si]; mat gtri trong dx -> lay lai gtri
        mov dh, 0
        sub dl, 30h ; chuyen '0' -> 0
        add ax, dx  ; 
        inc si
        jmp nhapchuoi 
        
    calc:
        add sum, ax 
        mov ax, 0
        inc si
        jmp nhapchuoi
    exit:
        add sum, ax  
        mov ah, 09h
        lea dx, msg
        int 21h
        mov cx,0 
        mov ax, sum   
        
    nhap:           ; vd 16
        mov dx, 0
        div so10    ; 16%10 = 6
        add dx, 30h ; doi 6 -> '6'
        push dx     ; dua vao ngan xep
        inc cx      ; tang cx
        cmp ax, 0
        jne nhap    ; neu ax != 0 thi tiep tuc 
                    ; ngan xep: 3|2|1
    xuat:
        pop dx      ; day 1 -> day 2 -> day 3
        mov ah, 02h
        int 21h
        loop xuat   
        
    mov ah, 04Ch
    int 21h
