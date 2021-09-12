;
; Lab3_2c.asm
;
; Created: 10/1/2019 9:47:49 AM
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
Ldi zl,LOW(2*base)
Ldi zh, HIGH(2*base)
lpm r16, z  ; base r16

ldi zl, LOW(2*expon)
ldi zh, HIGH(2*expon)
lpm r17, z   ; expon r17

clr r0
clr r1           
clr r18         ; interim low  
clr r19         ; interim high
ldi r20, 1		; result low byte
clr r21         ; result high byte

cpi r17, 0
breq end		; If the exponent is 0, jump to end
loop:
	mul r20, r16;
	movw r19:r18, r1:r0		; interim storage for later addition

	mul r21, r16		
	add r19, r0;

	movw r21:r20,r19:r18	; Move to the result bytes

	dec r17;
	brne loop



end: rjmp end

; Declarations
base: .DB 2; the base
expon: .DB 15; the exponent
