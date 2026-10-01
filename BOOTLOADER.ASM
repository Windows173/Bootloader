BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    mov si, msg
.print:
    lodsb
    or al, al
    jz .load
    mov ah, 0x0E
    mov bh, 0
    mov bl, 0x09
    int 0x10
    jmp .print

.load:
    mov ax, 0x1000
    mov es, ax
    xor bx, bx
    mov ah, 2
    mov al, 4
    mov ch, 0
    mov cl, 1
    mov dh, 0
    mov dl, 0x80
    int 0x13
    jmp 0x1000:0000
msg db "LOADING.", 0

times 510-($-$$) db 0
dw 0xAA55
