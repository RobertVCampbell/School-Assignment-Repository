;
; Lab7_1a.asm
;
; Created: 11/5/2019 9:09:14 AM
; Author : campbellrobert
;


start:
	clr r16 ; used for initialization and tracking the display value
	clr r17 ; used to preserve sreg
	clr r18 ; used as delay loop sentinel
	clr r19 ; used for general purpose in delay loop

	ldi r16, 0xff
	out DDRB, r16
	ldi r16, 0xFE;
	sec
	call loop;
end: rjmp end

loop:
	out portb, r16;
	rol r16;
	clr r0
	in r17, sreg;
	call delay
	rjmp loop

delay:
	Ldi r18, 2
	Ldi r19, 0x05
	Out TCCR0, r19; Timer starts counting from 0 at Microcontroller clock rate/1024

Timer1:
	Ldi r19, 6
	Out TCNT0, R19 ; Corrects from 512ms to 500ms	
Timer:
	IN r19, TIFR
	SBRS R19, 0;  Checks the Top Overflow flag (TOV0) in the TIFR
	Rjmp timer;  loops until the flag gets set
		
	Ldi r19, 0x01
	Out TIFR, R19 ;  Write a '1' over the TOV0 flag to clear it
		
	Dec r18;
	Brne timer ; Controls the number of loops for the delay. Using 2 to reach a .5s delay
	out sreg, r17
	ret
