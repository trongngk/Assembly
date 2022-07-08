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
    so10 dw 10  
    soam dw 0
    so dw 1
.code
    main proc
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
    lea dx, str
    int 21h
           
    mov ah, 0Ah
    lea dx, numStr
    int 21h
    
    lea si,[numStr+2]
        
    
    nhapchuoi:
        mov dx, [si]
        cmp dl, '$'
        je calc
        cmp dl, '-'
        je demsoam
        cmp dl, ','
        je demso      ; 1,2,3: 2 dau ',' -> co 3 so
        inc si
        jmp nhapchuoi 
        
    demsoam:
        inc soam
        inc si
        jmp nhapchuoi
        
    demso:
        inc so
        inc si
        jmp nhapchuoi         
        
    calc:
        mov ah, 09h
        lea dx, msg1
        int 21h        
        mov ax, soam  
        call convert
        
        mov ah, 09h
        lea dx, msg
        int 21h                 
        mov ax, so
        sub ax, soam     ; so so duong = so cac so - so so am
        call convert
        
        mov ah, 04Ch
        int 21h
    main endp 
    
    convert:
        mov cx, 0        
        nhap:
            mov dx, 0
            div so10
            add dx, 30h
            push dx
            inc cx 
            cmp ax, 0
            jne nhap
            
        xuat:
            pop dx
            mov ah, 02h
            int 21h
            loop xuat  
        ret
 end main
