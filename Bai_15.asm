.model small
.stack 100h
.data
    tenfile db "test.txt",0   
.code
    mov ax, data
    mov ds, ax
    
    mov ah, 41h ; xoa tep tin
    lea dx, tenfile
    int 21h
    
    mov ah, 4Ch
    int 21h