.model small
.stack 100h
.data 
tb1 db 'Welcome to our project $'
tb2 db 'BMI Calculator $'
tb4 db 'Nhap chieu cao cua ban (cm): $'
tb5 db 'Nhap can nang cua ban <kg>: $'
kq1 db 'Can nang cua ban la: thua can $'
kq2 db 'Can nang cua ban la: can doi $'
kq3 db 'Can nang cua ban la: thieu can $'
tb6 db 'Nhan phim 1 de xem huong dan tang can ly tuong neu ban thieu can $'
tb7 db 'Nhan phim 2 de xem huong dan giam can hoan hao neu ban thua can $' 
uw1 db 'An nhieu hon va ngu 8 tieng 1 ngay. $'
uw2 db 'Hap thu thuc an co ham luong calo cao (khoai tay, gao lut, uc ga, v.v.)$'
uw3 db 'Uong it nhat 3l nuoc moi ngay $'
uw4 db 'Moi ngay an rau, 1 ly sua va 1 qua trung $'
ow1 db 'Co gang tuan theo che do an uong lanh manh it calo $'
ow2 db 'An nhieu chat dam, rau cu va tranh do an nhanh'
ow3 db 'Tap 1 so bai tap de giam can (di bo, chay, nhay, gap bung, v.v.) $'
tb8 db 'Xin chuc mung ban..! Hay tiep tuc nhe! $'
cn1 db 'Nhan phim 1 de tinh toan lai $'
cn2 db 'Nhan phim 2 de THOAT $'
tb9 db 'Cam on ban da tham gia $'
tb10 db 'Nhan 1 phim bat ki de tiep tuc... $'    
chieucao dw ?
cannang dw ?
.code                                                                       
main proc 
    mov ax,@data
    mov ds,ax 
    
    lea dx,tb1
    mov ah,9
    int 21h
    
    call NL
    call NL
    
    lea dx,tb2
    mov ah,9
    int 21h
    
    call NL
    call NL
    
    Start:
    call NL
    call NL
    
    lea dx,tb4
    mov ah,9
    int 21h
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    ;mov sum,0
    
    Input: 
    
    and ax,000FH ;Giu lai 4 bit thap nhat cua ax
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
    
    mov ah,1
    int 21h
    
    cmp al,13
    je print
    
    jmp Input
    
    print:
    call nl
    lea dx,tb5
    mov ah,9
    int 21h
    
    ;mov sum,bx
    mov chieucao,bx
    mov bx,0
    mov ax,0
    
    Input2:
    and ax,000FH
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
    
    mov ah,1
    int 21h
    
    cmp al,13
    je convert
    
    jmp Input2
    
    convert:
    
    ;mov ax,sum
    mov cannang,bx
    mov dx,0
    
    mov ax,chieucao
    mov cx,ax
    mul cx
    mov bx,ax   ; chieucao^2 == bx
    
    mov ax,cannang
    mov dx,0
    mov cx,10000
    mul cx
    div bx
    
    cmp ax,18
    jl under
    
    
    cmp ax,25
    jl perfect
    
    jmp  over
    
    over:
    call NL
    call NL
    
    lea dx,kq1
    mov ah,9
    int 21h
    
    JMP Press
    
    perfect:
    call NL 
    call NL
    
    lea dx,kq2
    mov ah,9
    int 21h
    
    call NL
    call NL
    
    lea dx,tb8
    mov ah,9
    int 21h
    
    JMP Exit
    
    under:
    call NL
    call NL
    
    lea dx,kq3
    mov ah,9
    int 21h
    
    jmp press
    
    press:
    mov ax,0
    call NL
    call NL
    
    lea dx,tb6
    mov ah,9
    int 21h
    
    call NL
    call NL
    
    lea dx,tb7
    mov ah,9
    int 21h
    
    mov AH,1
    int 21h
    
    cmp AL,'1'
    JE P1
    
    cmp AL,'2'
    JE P2
    
    P1:
    call NL
    call NL
    
    lea dx,uw1
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,uw2
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,uw3
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,uw4
    mov ah,9
    int 21h
    
    JMP Exit
    
    P2:
    call NL
    call NL
    
    lea dx,ow1
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,ow2
    mov ah,9
    int 21h
    
    call NL
    
    lea dx,ow3
    mov ah,9
    int 21h
    
    Exit:
    mov ax,0
    call NL
    call NL
    
    lea dx,tb10
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    call NL
    
    lea dx,cn1
    mov ah,9
    int 21h
    call NL
    
    lea dx,cn2
    mov ah,9
    int 21h 
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    JE Start
    
    JMP Exit2
    
    Exit2:
    call NL 
    call NL
    lea dx,tb9
    mov ah,9
                   
    int 21h
    mov ah,4ch
    int 21h
    
    NL:
    mov ah,2 
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    ret
    
main endp
end
