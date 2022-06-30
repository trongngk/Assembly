.model small
.stack 100h
.data
    msv db 'Nhap msv: $'
    ten db 10,13, 'Ten sv: Nguyen Kim Trong $'
    str db 10,13, 'Nhap chuoi: $'
    kq db 10,13, 'Ket qua: $'
    
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
            
    mov ah, 09h
    lea dx, str
    int 21h
    
    
    
    mov cx, 0   
    
    nhapchuoi:
        mov dx, 0
        mov ah, 01h
        int 21h
        cmp al, 0Dh
        je cont 
        mov dl, al
        push dx  
        inc cx            
        jmp nhapchuoi
    cont:
        mov ah, 09h
        lea dx, kq
        int 21h    
        
    xuatchuoi:        
        pop dx
        mov ah, 02h
        int 21h
        loop xuatchuoi
        
    mov ah, 04Ch
    int 21h