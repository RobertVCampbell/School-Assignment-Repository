;
; Lab5_2f.asm
;
; Created: 10/15/2019 10:42:26 AM
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
	clr r0
	ldi r18,0x90
	ldi r19, 0x86
	ldi r20, 0x01 ; loads a total value of 100,000
	in r17, sreg;
	call delay
	rjmp loop

delay:
	subi r18,1;
	sbc r19, r0;
	sbc r20, r0;
	brne delay; delays for 5microseconds * value of R20:R18
				; 100000 * 5 = 500,000microseconds
	out sreg, r17
	ret
