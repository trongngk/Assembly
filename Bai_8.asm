.model small
.stack 100h
.data
    msv db 'Nhap msv: $'   
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $' 
    str db 10,13, 'Nhap chuoi: $'
    arr db 100 dup ('$')         
    hoa db 10,13, 'hoa -> thuong: $'
    
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
    lea dx, strMsv+2
    int 21h
    lea dx, str
    int 21h
    
    mov ah, 0Ah
    lea dx, arr
    int 21h
    
    mov ah, 09h
    lea dx, hoa
    int 21h
             
    lea si, [arr+2] 
       
    biendoi:
        mov dx, [si]
        cmp dl, 0Dh
        je exit        
        cmp dl, 'a'
        jae xuat
        add dl, 20h        
        xuat:
            mov ah, 02h
            int 21h
            inc si
        jmp biendoi
        
    exit:
        mov ah, 04Ch
        int 21h
