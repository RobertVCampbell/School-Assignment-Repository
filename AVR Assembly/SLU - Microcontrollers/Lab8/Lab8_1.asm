;
; Lab8_2.asm
;
; Created: 11/19/2019 8:20:28 AM
; Author : campbellrobert
;
; R17 used for switch input

.org 0x0030

;=========
Init:
	; initialize PortA
	ldi r16, 0x00 ;PA0-PA7 as inputs
	out DDRA, r16
	ldi r16, 0xFF
	out PORTA, r16 ; enable pull-up resisters

	SBI DDRB, 3; set PB3 as output

	ldi r16, 8
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16

InLoop:
	in r17, pina
	sbrs r17, 0
		jmp pw0
	sbrs r17, 1
		jmp pw1
	sbrs r17, 2
		jmp pw2
	sbrs r17, 3
		jmp pw3
	sbrs r17, 4
		jmp pw4
	sbrs r17, 5
		jmp pw5
	sbrs r17, 6
		jmp pw6
	rjmp InLoop

end: rjmp end

pw0:
	ldi r16, 8
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw1:
	ldi r16, 12
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw2:
	ldi r16, 16
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw3:
	ldi r16, 20
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw4:
	ldi r16, 24
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw5:
	ldi r16, 28
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
pw6:
	ldi r16, 32
	out ocr0, r16
	ldi r16, 0b01101011
	out tccr0, r16
	jmp InLoop
			 