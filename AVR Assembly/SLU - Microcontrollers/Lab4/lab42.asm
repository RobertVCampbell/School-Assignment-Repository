.nolist
.list

jmp Init 

Init:

SP_Init:
	ldi r16,LOW(RAMEND)
	out spl,r16
	ldi r16,HIGH(RAMEND)
	out sph,r16

Start:

	ldi zl, LOW(2*Array_Size) ; Z = address of Array_Size
	ldi zh, HIGH(2*Array_Size)
	lpm r10, z ; r10 = size of array (6 elements/bytes)
	ldi zl, LOW(2*Byte_Array) ; Z = address of Array_Decl array
	ldi zh, HIGH(2*Byte_Array)
	ldi yl, LOW(Even_Results) ; Y = address of Byte_Array array
	ldi yh, HIGH(Even_Results)
	mov r16, r10 ; i = n (r16 holds i)
CheckLoop:
	lpm r1, z+ ; r5 = Array_Decl[i]
	rcall Even_Odd
	st y+, r0 ; Byte_Array[i] = r5
	subi r16, 1 ; i--
	brne CheckLoop ; if (i != 0) repeat Copy_Loop
End:
	rjmp End
Even_Odd:
	mov r20, r1
	andi r20, 0x01
	dec r20
	andi r20, 0x01
	mov r0, r20
	ret

;=============
; Declarations
; Constants in Program Memory (can't write/store to Program Memory)
Byte_Array:
	.DB 5, 29, 126, 1, 93, 0, 68, 33
Array_Size:
	.DB 2 * (Array_Size - Byte_Array)
;============
; Data Memory
.DSEG
Even_Results:
	.BYTE 8