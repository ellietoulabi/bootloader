  ; use 16 bits format:
bits 16 
  ; tells where to load our program for execution(start address of program):
org 0x7c00 
  ; loads the address of "msg" into si reg:
  mov si, msg 
  ; function number = 0Eh : Display Character in TTY mode: 

  mov ah, 0x0e 
  ;  Load byte at address DS:(E)siinto al and increments the address in SI
print_char:
  lodsb  
  ; compare al to zero   
  cmp al, 0 
  ; if no characteres left to print jump to done 
  je done   
  ; print characteres using interrupt 0x10(videp service interrupt)
  int 0x10 
  ; to continue the loop 
  jmp print_char
done:
 ; stop printing characters 
  hlt
 ; zero byte to fill 512 byte
msg: db "Hello world! Elaheh Toulabi Nejad 9631243", 0 
 ; zero byte to fill 510 byte for output
times 510-($-$$) db 0   
 ; a number to tell BIOS that this is a bootable part       
dw 0xaa55                       