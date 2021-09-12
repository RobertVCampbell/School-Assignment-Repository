;
; Lab3_2b.asm
;
; Created: 9/24/2019 11:14:23 AM
; Author : campbellrobert
;


jmp Init ; first line executed
;=========
Init:
; <insert code here to initialize ports, as needed>
;=====================
; Main body of program
Start:
ldi zl, low(2*Array)
ldi zh, high(2*Array)
ldi r18, 17;
clr r0
clr r1
clr r2 ; null register for cpc

loop1:
lpm r16, z+
lpm r17, z+

cpi r16, 101
cpc r17, r2
brlo skipadd; jump to skipadd if less than 100

add r0, r16;
adc r1, r17;

skipadd:
dec r18
cpi r18, 0
brne loop1;

end: rjmp end

Array:
.DW 573, 16, 8, 39, 8192, 483, 1602, 198, 2607, 215, 101, 33, 598, 63, 882, 100, 120
