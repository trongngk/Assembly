.model small
.stack 100h
.data 
    str db 100 dup(0) 
    filename db 10,13, 'Nhap ten file: $'
    file dw 100 dup(?),0 
    content db 10,13, 'Nhap noi dung: $'    
    thefile dw ?
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'       
    
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
    
    mov ah, 09h
    lea dx, filename
    int 21h
           
    mov si, 0
    nhaptenfile:
        mov ah, 01h
        int 21h
        cmp al, 0Dh
        je nhapnoidung
        mov ah, 0
        mov file[si], ax
        inc si
        jmp nhaptenfile  
         
    nhapnoidung:
        mov ah, 09h
        lea dx, content
        int 21h
        mov si,0
        mov cx, 100
        nhap:
            mov ah, 01h
            int 21h
            cmp al, 0Dh
            je taofile 
            mov str[si], al
            inc si
            jmp nhap
            
    taofile:
        mov ah, 3ch
        lea dx, file
        mov cx, 0
        int 21h
        mov cx, si
        mov thefile, ax
        mov ah, 40h ; ghi file
        mov bx, thefile
        ghifile:
            mov dh, 0
            mov dl, str[si]
            ;inc si
            int 21h
            loop ghifile
        
        mov ah, 3eh
        mov bx, thefile
        int 21h    
     
    mov ah, 4Ch
    int 21h
    
;3ch: tao file
;3dh: mo file da co
;3fh: doc file
;3eh: dong file
;40h: ghi file
;41h: xoa file
;56h: rename        
    
