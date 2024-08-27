
org 100h ; Start address for the program

; Define two 16-bit numbers to subtract
num1 dw 4610h ; First 16-bit number
num2 dw 5805h ; Second 16-bit number

start:
    mov ax, num1 ; Load the first 16-bit number into AX
    sub ax, num2 ; Subtract the second 16-bit number from AX
   
    mov bx, ax ; Store the result in BX for future use or display

    ; Prepare to display the result as hexadecimal
    ; Convert the upper byte of AX to a printable character
    mov ah, al ; Copy AL (lower 8 bits of AX) to AH
    mov al, bh ; Copy BH (upper 8 bits of BX) to AL

    ; Process the upper nibble (4 bits) of AL
    mov cl, al
    and cl, 0F0h ; Mask the lower nibble
    shr cl, 4 ; Shift right to get the upper nibble
    add cl, 30h ; Convert to ASCII
    cmp cl, 39h
    jle print_first_digit
    add cl, 7 ; If it's A-F, adjust the ASCII value
print_first_digit:
    mov dl, cl ; Move the digit to DL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h

    ; Process the lower nibble (4 bits) of AL
    mov cl, al
    and cl, 0Fh ; Mask the upper nibble
    add cl, 30h ; Convert to ASCII
    cmp cl, 39h
    jle print_second_digit
    add cl, 7 ; If it's A-F, adjust the ASCII value
print_second_digit:
    mov dl, cl ; Move the digit to DL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h

    ; Convert the lower byte of AX to a printable character
    ; Convert upper nibble of AL to ASCII
    mov cl, ah
    and cl, 0F0h ; Mask the lower nibble
    shr cl, 4 ; Shift right to get the upper nibble
    add cl, 30h ; Convert to ASCII
    cmp cl, 39h
    jle print_third_digit
    add cl, 7 ; If it's A-F, adjust the ASCII value
print_third_digit:
    mov dl, cl ; Move the digit to DL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h

    ; Convert the lower nibble (4 bits) of AL to a character
    mov cl, al
    and cl, 0Fh ; Mask the upper nibble
    add cl, 30h ; Convert to ASCII
    cmp cl, 39h
    jle print_fourth_digit
    add cl, 7 ; If it's A-F, adjust the ASCII value
print_fourth_digit:
    mov dl, cl ; Move the digit to DL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h

    ; End the program
    mov ah, 4Ch ; Terminate the program
    int 21h