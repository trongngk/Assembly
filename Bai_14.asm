.model small
.stack 100h
.data 
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    filename db 'test.txt', 0     
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
            
    mov ah, 41h
    lea dx, filename
    int 21h                 
    mov ah, 04Ch
    int 21h
    
    
