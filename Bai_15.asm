.model small
.stack 100h
.data 
    oldfilename db 'm.txt', 0
    newfilename db 'bai15.txt',0
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
 .code
    mov ax, data
    mov ds, ax
    mov es, ax
    
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
    
    mov ah, 56h
    lea dx, oldfilename
    lea di, newfilename
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
    
