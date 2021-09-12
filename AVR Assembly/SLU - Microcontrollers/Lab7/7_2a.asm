;************************************************
; written by: Jason Fritts
; Modified by: Armineh Khalili
; date: 7/26/12
; file saved as: Keypad.asm
; for AVR: STK500 with ATmega32
; clock frequency: ? MHz
;************************************************
; Program Function: Gets keypresses from a keypad
;.device ATmega32 ; don't need because it's in .inc file below

;.nolist
;.include "C:\Program Files\Atmel\AVR Tools\AvrAssembler2\Appnotes\m32def.inc"
;.list

;=================
; Start of Program
jmp Init ; first line executed

;=========
Init:
	; initialize Stack Pointer (SP)
	ldi r16, LOW(RAMEND)
	out SPL, r16
	ldi r16, HIGH(RAMEND)
	out SPH, r16
	; initialize Port B
	ser r16 ; set all PortB pins to output
	out DDRB, r16 ;
	; initialize PortA
	ldi r16, 0b11110000 ; set PA4-PA7 as outputs, PA0-PA3 as inputs
	out DDRA, r16
	ldi r16, 0b11111111 ; enable pull-up registers on PA4-PA7
	out PORTA, r16


;================= 
; Main body of program 
Start: 
	ser r25 ; initialize LEDs to off 
	out PORTB , r25 

Checkpress1:
	Ldi ZL, low(2*TextArray) ;R30
	Ldi ZH, high(2*TextArray); R31

 
	call GetKeyPress ; check for a keypress 
	mov r24, r0 ; if key not pressed, check again 
	cpi r24, 0 
	breq Checkpress1 
	mov r25, r1 ; if key pressed, update display

	ldi r16, 4
	Mul r16,r25 ; multiply the button pos by 4

	Add r30, r0;
	Adc r31, r1; Add that value to the memory location of the text array

Release1: 
	call GetKeyPress ; check for button release 
	mov r24, r0 ; if key not released, check again 
	cpi r24, 0 
	brne Release1

Checkpress2: 
	call GetKeyPress ; check for a keypress 
	mov r24, r0 ; if key not pressed, check again 
	cpi r24, 0 
	breq Checkpress2 
	mov r25, r1 ; if key pressed, update display

	clr r16

	lsr r25
	lsr r25 ; A = 0, D = 3


	add r30, r25;
	Adc R31, r16;

	Lpm R25, Z;
 
	com r25
	out PORTB, r25 ; Displays the char selected 

Release2: 
	call GetKeyPress ; check for button release 
	mov r24, r0 ; if key not released, check again 
	cpi r24, 0 
	brne Release2
	rjmp Checkpress1; repeat indefinitely

End: 
	rjmp End ; end of program


;=================
; Procedures
;Procedure: GetKeyPress
; Function: checks whether a key has been pressed, and if so, which button
; Inputs:
; none
; Outputs:
; r0 <- 1 if button pressed (0 otherwise)
; r1 <- button number pressed (0 to 15)

GetKeyPress:
	push r16 ; save registers
	push r18
	push r19
	push r20
	push r22
	clr r0
	clr r1
	ldi r16, 0b11101111 ; clear output pins PA4-PA7
	clr r20 ; initial button number

KeyLoop:
	out PORTA, r16
	; short delay while changes to row voltages propagate through keypad
	ldi r22, 100

Delay:
	dec r22
	brne Delay
	; read status of buttons from keypad
	in r18, PINA ; read values from PA0-PA3
	com r18
	andi r18, 0x0F ; check if any buttons pressed
	breq RowNotLit
	; if a button was pressed, compute the button number (0 to 15)
	sbrc r18, 1 ; if 2nd button in row pressed
	subi r20, -1 ; then add 1 to button number for 2nd button in row
	sbrc r18, 2 ; if 3rd button in row pressed
	subi r20, -2 ; then add 2 to button number for 3rd button in row
	sbrc r18, 3 ; if 4th button in row pressed
	subi r20, -3 ; then add 3 to button number for 4th button in row
	ldi r19, 0x01
	mov r0, r19 ; indicate a button was pressed (set r0 to 1)
	mov r1, r20 ; copy button number pressed into r1
	rjmp ExitProc

RowNotLit:
	; if button not pressed, check next row in keypad
	lsl r16
	ori r16, 1
	subi r20, -4 ; update button number for next row
	; if all rows checked, exit procedure
	cpi r16, 0b11111111
	brne KeyLoop

ExitProc:
	pop r22 ; restore registers
	pop r20
	pop r19
	pop r18
	pop r16
	ret

TextArray:
	.DB "11112abc3def", 0, 0, 0, 0
	.DB "4ghi5jkl6mno", 0, 0, 0, 0
	.DB "7prs8tuv9wxy", 0, 0, 0, 0
	.DB "****0000####", 0, 0, 0, 0