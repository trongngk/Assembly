.model small
.stack 100h
.data     
    msv db 'Nhap msv: $'
    strMsv db 100 dup('$')
    ten db 10,13, 'Ten sv: Nguyen Kim Trong - $'
    dex db 10,13, 'Nhap so thap phan: $' 
    str 100 dup('$')
    bin db 10,13, 'So dang nhi phan: $'
    hex db 10,13, 'So dang thap luc phan: $'  
    num dw ?
    
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
    lea dx, dex
    int 21h
    
    mov ah, 0Ah
    lea dx, str
    int 21h    
             
    lea si, [str+2]
    mov bx, 10
    mov ax, 0  
     
    xulychuoi:
        mov dx, [si]
        cmp dl, 0Dh
        je next
        
        mul bx
        mov dx, [si] 
        mov dh, 0
        sub dl, 30h    
        add ax, dx 
        inc si
        jmp xulychuoi
        
    next: 
        mov num, ax
        mov ah, 09h
        lea dx, bin
        int 21h
        call dextobin
    
        mov ah, 09h
        lea dx, hex
        int 21h           
        call dextohex
    
    mov ah, 4Ch
    int 21h
    
    main endp 
    
    dextobin: 
        mov ax, num
        mov bx, 2 
        mov cx, 0         
        chia2:  
            mov dx, 0
            div bx
            add dx, 30h            
            push dx  
            inc cx
            cmp ax, 0
            jne chia2  
            
        xuat2:
            pop dx
            mov ah, 02h
            int 21h
            loop xuat2
            
        ret
    
    dextohex:
        mov ax, num
        mov bx, 16
        mov cx, 0
        chia16:  
            mov dx, 0
            div bx                        
            push dx  
            inc cx
            cmp ax, 0
            jne chia16  
            
        xuat16:
            pop dx   
            cmp dl, 9 
            jb calc        
            add dl, 7
            calc:
                add dl, 30h                   
            mov ah, 02h
            int 21h
            loop xuat16
            
        ret
 end main