;
; lab5.asm
;
; Created: 10/15/2019 9:57:25 AM
; Author : campbellrobert
;


; Replace with your application code


start:
ldi r16, 0xff
Out DDRB, r16; Sets all of port b to be output

cbi portb, 0
cbi portb, 1
sbi portb, 2 
sbi portb, 3 
sbi portb, 4
sbi portb, 5
cbi portb, 6
cbi portb, 7 ; sets portb to 1100 0011 or 0xC3 with active low

end: rjmp end
