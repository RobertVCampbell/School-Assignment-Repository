;
; Lab5_2D.asm
;
; Created: 10/15/2019 10:37:16 AM
; Author : campbellrobert
;


; Replace with your application code
start:
	ldi r16, 0xff
	out DDRB, r16
	ldi r16, 0xFE;
	sec

	call loop;
end: rjmp end

loop:
	out portb, r16;
	rol r16;
	rjmp loop
	