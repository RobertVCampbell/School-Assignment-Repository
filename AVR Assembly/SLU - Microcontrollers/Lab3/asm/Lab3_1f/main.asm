;
; Lab3_1f.asm
;
; Created: 9/24/2019 11:03:14 AM
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
; Iterating through an ASCII string
ldi zl, LOW(2*String1)
ldi zh, HIGH(2*String1)
ldi r17, 0;
Loop2:
Inc r17;
lpm r16, z+
cpi r16, 0
brne Loop2
subi r17, 1;

End:
rjmp End
;=============
; Declarations
String1:
.DB "This is a text.", 0 ; a list of byte characters
