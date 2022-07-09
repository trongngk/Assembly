.model small                                           
.stack 100h
.data
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    chuoi db 10,13, 'Nhap chuoi so: $'
    string db 100 dup('$')
    kq db 10,13, 'So luong snt: $'
    dem dw 0   
    num dw 0
    cnt dw 0
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
    lea dx, chuoi
    int 21h
    
    mov ah, 0Ah
    lea dx, string
    int 21h
    
    mov ah, 09h
    lea dx, kq
    int 21h
    
    lea si, [string+2]
    mov bx, 10
    mov ax, 0  
    mov cx, 2
    
    xulychuoi:
        mov dx, [si]
        cmp dl, '$'
        je print 
        cmp dl, 0Dh
        je tinhsnt
        cmp dl, ','
        je tinhsnt
        mul bx
        mov dx, [si] 
        mov dh, 0
        sub dx, 30h  
        add ax, dx 
        inc si
        jmp xulychuoi 
        
    tinhsnt:
        mov num, ax
        calc:  
            mov ax, num             
            cmp cx, ax
            jae endnum          ; ktra tu 2-> n: neu xuat hien nghiem != n : k phai snt
            mov dx, 0               
            div cx
            cmp dx, 0
            je next
            inc cx
            jmp calc        
            
        endnum:    
            mov dx, 0
            div cx
            cmp dx, 0
            jne next 
            inc dem   
            
        next:
            inc si
            mov cx, 2
            mov ax, 0
            jmp xulychuoi
            
            
    print:   
        mov cx, 0 
        mov ax, dem
         pushdx: 
            mov dx, 0
            div bx
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