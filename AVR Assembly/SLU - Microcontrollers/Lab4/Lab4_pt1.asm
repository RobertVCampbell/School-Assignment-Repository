;************************************************
; written by:
; Updated by: Armineh Khalili 8/27/2014
; date:
; file saved as:
; for AVR: ATmega32
; clock frequency:
;************************************************
; Program Function: <describe purpose of program here>
; .device ATmega32 ; don't need because it's in .inc file below
.nolist
;.include "C:\Program Files\Atmel\AVR Tools\AvrAssembler2\Appnotes\m32def.inc"
.list
;=================
; Start of Program
jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:
; Copy elements of array (initialized in program memory) to data memory
; Pseudocode:
;
; n = Array_Size
;
; for (i = 0; i < 6; i++)
; Byte_Array[i] = Array_Decl[i];
;
	ldi zl, LOW(2*Array_Size) ; Z = address of Array_Size
	ldi zh, HIGH(2*Array_Size)
	lpm r10, z ; r10 = size of array (6 elements/bytes)
	ldi zl, LOW(2*Array_Decl) ; Z = address of Array_Decl array
	ldi zh, HIGH(2*Array_Decl)
	ldi yl, LOW(Byte_Array) ; Y = address of Byte_Array array
	ldi yh, HIGH(Byte_Array)
	mov r16, r10 ; i = n (r16 holds i)
CopyLoop:
	lpm r5, z+ ; r5 = Array_Decl[i]
	st y+, r5 ; Byte_Array[i] = r5
	subi r16, 1 ; i--
	brne CopyLoop ; if (i != 0) repeat Copy_Loop
; Perform bubble sort
; Pseudocode:
;
; n = Array_Size
;
; for (i = n-1; i > 0; i--)
; {
; for (j = 0; j < i; j++)
; {
; if (Byte_Array[j] > Byte_Array[j+1])
; {
; // swap bytes
; temp = Byte_Array[j];
; Byte_Array[j] = Byte_Array[j+1];
; Byte_Array[j+1] = temp;
; }
; }
; }
	mov r16, r10 ; i = n (r16 holds i)
	subi r16, 1 ; i = i-1
OuterLoop:
	cpi r16, 0
	breq ExitOuter ; if (i == 0) exit OuterLoop
	ldi yl, LOW(Byte_Array) ; Y = address of Byte_Array array
	ldi yh, HIGH(Byte_Array)
	clr r17 ; j = 0 (r17 holds j)
InnerLoop:
	cp r17, r16
	breq ExitInner ; if (j >= i) exit InnerLoop
	ld r5, y ; r5 = Byte_Array[j]
	ldd r6, y+1 ; r6 = Byte_Array[j+1]
	cp r5, r6
	brlo SkipSwap ; if (Byte_Array[j] < Byte_Array[j+1])goto
	; SkipSwap
	st y, r6 ; Byte_Array[j] = r6 (Byte_Array[j+1])
	std y+1, r5 ; Byte_Array[j+1] = r5 (Byte_Array[j])
SkipSwap:
	adiw y, 1 ; y++
	inc r17 ; j++
	rjmp InnerLoop ; repeat InnerLoop
ExitInner:
	dec r16 ; i--
	rjmp OuterLoop ; repeat OuterLoop
ExitOuter:
End: rjmp End
;=============
; Declarations
; Constants in Program Memory (can't write/store to Program Memory)
Array_Decl:
	.DB 0, 192, 13, 4, 163, 209
Array_Size:
	.DB 2 * (Array_Size - Array_Decl)
;============
; Data Memory
.DSEG
Byte_Array:
	;.DB 0, 192, 13, 4, 163, 209
	.BYTE 6