;
; Lab3_1c.asm
;
; Created: 9/24/2019 10:51:28 AM
; Author : campbellrobert
;


; Replace with your application code
;=================
; Start of Program
jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:
ldi zl, LOW(2*Byte_Array)
ldi zh, HIGH(2*Byte_Array)
clr r10
clr r11
clr r1
ldi r16, 4
Loop1:
lpm r0, z+
add r10, r0
adc r11, r1
dec r16
brne Loop1

End:
rjmp End
;=============
; Declarations
Byte_Array:
.DB 123,45,67,89 ; a list of four bytes
