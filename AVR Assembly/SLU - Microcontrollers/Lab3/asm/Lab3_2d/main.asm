;
; Lab3_2d.asm
;
; Created: 10/1/2019 9:48:21 AM
; Author : campbellrobert
;


;=================
; Start of Program
jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:

	clr r0		; output register

	clr r18		; Character from string 1
	clr r16		; String 1 index low
	clr r17		; String 1 index high

	clr r19		; Character from String 2
	clr r20		; String 2 index low
	clr r21		; String 2 index high

	ldi r16, low(2*string1)
	ldi r17, high(2*string1)

	ldi r20, low(2*string2)
	ldi r21, high(2*string2)

loop:
	movw zh:zl, r17:r16;
	lpm R18, z+
	movw r17:r16, zh:zl;

	movw zh:zl,r21:r20
	lpm r19,z+
	movw r21:r20, zh:zl;

	cp r19,r18
	brne end;

	cpi r18, 0
	brne loop;
	
	inc r0

end: rjmp end



string1: .DB "This is a good book.",0
string2: .DB "This is a good book.",0
