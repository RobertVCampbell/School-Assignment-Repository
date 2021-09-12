;
; Lab4_3.asm
;
; Created: 10/8/2019 11:31:45 AM
; Author : campbellrobert
;


; Replace with your application code
start:
    ldi r16, low(RAMEND)
	out SPL, r16
	Ldi r16, high(RAMEND)
	out SPH, r16

	clr r16
	clr r17
	clr r18
	clr r19			
	clr r20			; remainder
	clr r21			; remainder
	
	clr r22			; incremental quotient
	ldi r16, low(2389)  ; numerator lowbyte
	ldi r17, high(2389) ; numerator highbyte
	ldi r18, 0x1a		; denominator lowbyte
	call division

	clr r22			; incremental quotient
	ldi r16, low(215)  ; numerator lowbyte
	ldi r17, high(215) ; numerator highbyte
	ldi r18, 5		; denominator lowbyte
	call division

	clr r22			; incremental quotient
	ldi r16, low(0)  ; numerator lowbyte
	ldi r17, high(0) ; numerator highbyte
	ldi r18, 9		; denominator lowbyte
	call division

	clr r22			; incremental quotient
	ldi r16, low(63)  ; numerator lowbyte
	ldi r17, high(63) ; numerator highbyte
	ldi r18, 68		; denominator lowbyte
	call division

	clr r22			; incremental quotient
	ldi r16, low(136)  ; numerator lowbyte
	ldi r17, high(136) ; numerator highbyte
	ldi r18, 52		; denominator lowbyte
	call division

	clr r22			; incremental quotient
	ldi r16, low(152)  ; numerator lowbyte
	ldi r17, high(152) ; numerator highbyte
	ldi r18, 1		; denominator lowbyte
	call division


end:
	rjmp end

division:
	inc r22
	mul r22, r18	; multiplies denom by quot
	movw r20, r16	
	sub r20, r0
	sbc r21, r1

	cp r20, r18
	cpc r21, r19
	brsh division
	ret