;
; Lab3_2a.asm
;
; Created: 9/24/2019 11:07:42 AM
; Author : campbellrobert
;


jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:
SER R17;
Out DDRB, r17;
ldi zl, low(2*char1)
ldi zh, high(2*char1)
lpm r16, z;
Out Portb, r16

loop1:
inc r16
out portb, r16
cpi r16, 0x5A ; compares with 'Z'
brne loop1
end: rjmp end

Char1: 
.DB 'A'
