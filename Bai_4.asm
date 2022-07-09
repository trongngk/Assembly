.model small
.stack 100h
.data
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    input db 10,13, 'Nhap chuoi: $'
    str db 100 dup ('$')
    kq db 10,13, 'So luong so chia het cho 5: $'     
    so5 dw 5
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
    
    
    lea si, [str+2]
    mov ax, 0
    mov bx, 0 ; bien dem
   
    nhapchuoi:
        mov dx, [si] 
        cmp dl, '$'
        je exit
        cmp dl, 0Dh
        je calc      
        cmp dl, ','
        je calc
        mul so10
        mov dx, [si]
        mov dh, 0
        sub dl, 30h
        add ax, dx
        inc si
        jmp nhapchuoi 
           
    calc:        
        mov dx, 0
        div so5
        cmp dl, 0
        jne cont
        inc bx 
         
    cont:    
        inc si 
        mov ax, 0
        jmp nhapchuoi
        
    exit:  
        mov ah, 09h
        lea dx, kq
        int 21h
        mov cx, 0
        mov ax, bx
        
    pushdx:
        mov dx, 0
        div so10
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0        
        jne pushdx 
        
    popdx:
        pop dx
        mov ah, 02h
        int 21h
        loop popdx
            
    mov ah, 04Ch
    int 21h
        
