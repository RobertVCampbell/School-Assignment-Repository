;
; Lab3_1d.asm
;
; Created: 9/24/2019 10:57:11 AM
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
; Summing two 16-bit words
ldi zl, LOW(2*Word_Array)
ldi zh, HIGH(2*Word_Array)
clr r0
clr r1
ldi r16, 2
loop2: lpm r0, z+
lpm r1, z+
add r24, r0
adc r25, r1
dec r16
brne loop2

End:
rjmp End
;=============
; Declarations
Word_Array:
.DW 2137,984, 0 ; a wordwise list of labels
