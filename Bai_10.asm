.model small
.stack 100h
.data
    msv db 'Nhap msv: $'
    ten db 10,13,'Ten sv: Nguyen Kim Trong$'
    str db 10,13,'Nhap chuoi: $'   
    kytu db 10,13,'Ky tu muon tim: $'
    xh db 10,13,'Co xuat hien ky tu$'
    kxh db 10,13, 'Khong xuat hien ky tu$'
    arr db 100 dup('$')
    
    
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
    lea dx, str
    int 21h
        
    mov ah, 0Ah
    lea dx, arr
    int 21h
    
    mov ah, 09h
    lea dx, kytu
    int 21h
    
    mov ah, 01h
    int 21h 
    
    
    lea si, [arr+2]
    
    ktra:
        mov dx, [si] 
        cmp dl, 0Dh
        je false
        ;sub kytu, 30h
        cmp dl, al
        je true
        inc si 
        jmp ktra
        true:
            mov ah, 09h
            lea dx, xh
            int 21h
            jmp exit
        false:
            mov ah, 09h
            lea dx, kxh
            int 21h
            jmp exit
        
    exit:    
        mov ah, 04Ch
        int 21h
    
    