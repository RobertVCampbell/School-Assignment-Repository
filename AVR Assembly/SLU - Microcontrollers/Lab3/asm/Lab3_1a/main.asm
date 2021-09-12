;************************************************
; written by: Jason Fritts
; date: 9/15/08
; Updated by: Armineh Khalili 8/25/2014
; file saved as: lab3_p1.asm
; for AVR: ATmega32
; clock frequency:
;************************************************
; Program Function: <describe purpose of program here>

; .device ATmega32 ; don't need because it's in .inc file below
;.nolist
;.include "C:\Program Files\Atmel\AVR Tools\AvrAssembler2\Appnotes\m32def.inc"
;.list

;=================
; Start of Program
jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:
; Summing four 8-bit words
	ldi zl, LOW(2*Byte_Array)
	ldi zh, HIGH(2*Byte_Array)
	clr r10
	clr r11
	clr r1
	clr r16

Loop1:
	lpm r0, z+
	add r10, r0
	adc r11, r1
	subi r16, -1
	cpi r16, 4
	brlo Loop1


; Summing two 16-bit words
	ldi zl, LOW(2*Word_Array)
	ldi zh, HIGH(2*Word_Array)
	lpm r24, z+
	lpm r25, z+
	lpm r0, z+
	lpm r1, z+
	add r24, r0
	adc r25, r1


; Iterating through an ASCII string
	ldi zl, LOW(2*String1)
	ldi zh, HIGH(2*String1)

	Loop2:
	lpm r16, z+
	cpi r16, 0
	brne Loop2
End:
rjmp End


;=============
; Declarations
Byte_Array:
.DB 123,45,67,89 ; a list of four bytes
Word_Array:
.DW 2137,984, 0 ; a wordwise list of labels
String1:
.DB "This is a text.", 0 ; a list of byte characters
