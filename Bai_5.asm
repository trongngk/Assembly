.model small
.stack 100h
.data
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    str db 10,13, 'Nhap chuoi so: $' 
    numStr db 100 dup('$')
    msg db 10,13, 'So so duong: $'
    msg1 db 10,13, 'So so am: $'
    
.code
    mov ax, data
    mov ds, ax
    
    ;mov ah, 09h
;    lea dx, msv
;    int 21h
;    
;    mov ah, 0Ah
;    lea dx, strMsv
;    int 21h
;    
    mov ah, 09h
;    lea dx, ten
;    int 21h
;    lea dx, [strMsv+2]
;    int 21h
    lea dx, str
    int 21h
           
    mov ah, 0Ah
    lea dx, numStr
    int 21h
    
    lea si,[numStr+2]
    mov bx, 0
    mov cx, 1
    nhapchuoi:
        mov dx, [si]
        cmp dl, '$'
        je exit
        cmp dl, '-'
        je demsoam
        cmp dl, ','
        je demso
        inc si
        jmp nhapchuoi 
        
    demsoam:
        inc bx
        inc si
        jmp nhapchuoi
        
    demso:
        inc cx
        inc si
        jmp nhapchuoi
        
        
    exit:
        mov ah, 09h
        lea dx, msg1
        int 21h
        mov dx, bx  
        add dx, 30h
        mov ah, 02h
        ;mov dl, bx
        int 21h
        sub cx, bx
        mov ah, 09h
        lea dx, msg
        int 21h
        mov dx, cx
        add dx, 30h
        mov ah, 02h
        int 21h 
        
    mov ah, 04Ch
    int 21h
