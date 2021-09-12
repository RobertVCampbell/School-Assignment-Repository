;
; Lab5_3a.asm
;
; Created: 10/15/2019 11:07:34 AM
; Author : campbellrobert
;


; Replace with your application code
start:
;PORTD = inputs
;PORTB = outputs

Clr r16
clr r17
clr r18 ; null register
Out DDRD, r16
Ldi r16, 0xff
Out DDRB, r16

Out Portb, r16; default output

loop:
	in r17, pind
	cp r17, r16  ; Checks if all buttons are off (active low, 0xff)
	brne turnon
	out portb, r16;
	rjmp loop;

turnon:
	sbis pind, 0
	cbi portb, 0

	sbis pind, 1
	cbi portb, 1

	sbis pind, 2
	cbi portb, 2

	sbis pind, 3
	cbi portb, 3

	sbis pind, 4
	cbi portb, 4

	sbis pind, 5
	cbi portb, 5

	sbis pind, 6
	cbi portb, 6

	sbis pind, 7
	cbi portb, 7

	rjmp loop
	


