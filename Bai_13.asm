.model small
.stack 100h
.data                
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    tenfile db 'bai15.txt',0
    thefile dw ?
    buffer db 251 dup('$')
    
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
    int 2h1
    lea dx, strMsv+2
    int 21h 
    
    mov ah, 3dh 
    lea dx, tenfile
    mov al, 2
    int 21h
    
    mov thefile,ax
    mov ah, 3fh    
    mov bx, thefile
    lea dx, buffer    
    mov cx, 250
    int 21h
    
    mov ah, 3eh
    mov bx, thefile    
    int 21h
    
    mov ah, 09h
    lea dx, buffer
    int 21h         
    
    
    mov ah, 04Ch
    int 21h  
    
    
    
;3ch: tao file
;3dh: mo file da co
;3fh: doc file
;3eh: dong file
;40h: ghi file
;41h: xoa file
;56h: rename    