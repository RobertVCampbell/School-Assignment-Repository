;
; lab5_3e.asm
;
; Created: 10/15/2019 11:42:39 AM
; Author : campbellrobert
;


; Replace with your application code
start:
;PIND, 7 = input 
;PORTB = outputs
ldi r16, low(ramend)
out spl, r16
ldi r16, high(ramend)
out sph, r16

Clr r16
Out DDRD, r16
Ldi r16, 0xff
Out DDRB, r16

Out portb, r16

LoopPress:
	Ldi r17, 1
	Call delay
	Sbic pind,7
	Rjmp LoopPress

LoopRelease:
	Ldi r17, 1
	Call delay
	Sbis pind, 7
	Rjmp LoopRelease

	Dec r16
	Out portb, r16
	Rjmp LoopPress

Delay:
	Dec r17
	Brne delay
	ret
