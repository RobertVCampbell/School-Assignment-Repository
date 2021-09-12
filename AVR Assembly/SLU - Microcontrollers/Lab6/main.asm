;1A 
Jmp start
Jmp InterRout0
Jmp InterRout1
Jmp InterRout2
.org 0x0030

Start:
	Ldi r16, low(ramend)
	Out spl, r16
	Ldi r16, high(ramend)
	Out sph, r16

		;Set INT0,1,2 as inputs
	CBI DDRB, 2; PB2 as input (INT2)
	CBI DDRD, 2; PD2 as input (INT0)
	CBI DDRD, 3; PD3 as input (INT1)

		;Set PORTA as output
	LDI r16, 0xff
	Out DDRA, r16
	Out PORTA, r16 ; Initialize active low output to all 0s (0xff)

	SBI PortB, 2 ; INT2 pullup resistor
	SBI PortD, 2 ; INT0 pullup resistor
	SBI PortD, 3 ; INT1 pullup resistor

	Ldi R16, 0x0A ; Load 0000 1010
	Out MCUCR, R16 ; Sets INT0,1 to negative edge

	Clr R16 ; 0x00 to write to MCUCSR
	Out MCUCSR, r16 ; Sets bit 6 to 0 for negative edge for INT2

	LDI R16, 0xE0; 1110 0000 for GICR
	Out GICR, R16; Activates INT0,1,2

	SEI ; Enables global interrupt
	
	LDI R17, 0xff; counter register
Counter:
	Out PORTA, r17 ; Initialize active low output to all 0s (0xff)
	; Then write the new output each loop
	Dec r17;
	Call delay
	Rjmp counter

end: rjmp end

Delay:
	push r0
	Push r18;
	Push r19;
	Push r20;
	clr r0
	Ldi r18, 0x40; 0x030D40
	Ldi r19, 0x0d; is 200,000
	Ldi r20, 0x03;
DelayLoop:
	Subi r18, 1;
	Sbc r19, r0;
	Sbc r20, r0;
	Brne DelayLoop; delays 5microseconds * value of r20:r18
	; 5 * 200000 = 1000000microsec or 1 second
	Pop r20;
	Pop r19;
	Pop r18;
	pop r0;
	Ret

;1B
InterRout0:
	Push r21
	Push r22
	Push r23
	In r21, sreg
	Push r21
	ldi r22, 0xff
	
	Ldi r23, 5;
	Ldi r21, 0xFC ;0x03 with active low
Flash0:
	Out PortA, r21
	call delay; flash on 1sec

	Out PortA, r22;
	call delay; flash off 1 sec

	Dec r23
	Brne Flash0
	
		;Restore output to previous value
	Out PortA, r17;
		;Restore registers
	Pop r21
	Out sreg, r21 
	Pop r23
	Pop r22
	Pop r21
	Reti;
;1C
InterRout1:
	Push r21
	Push r22
	Push r23
	In r21, sreg
	Push r21
	ldi r22, 0xff
	
	Ldi r23, 5;
	Ldi r21, 0x3f ; 0xc0 active low
Flash1:
	Out PortA, r21
	call delay; flash on 1sec

	Out PortA, r22;
	call delay; flash off 1 sec

	Dec r23
	Brne Flash1
	
		;Restore output to previous value
	Out PortA, r17;
		;Restore registers
	Pop r21
	Out sreg, r21
	Pop r23
	Pop r22
	Pop r21
	Reti;
;1D
InterRout2:
	Push r21
	Push r22
	Push r23
	In r21, sreg
	Push r21
	ldi r22, 0xff
	
	Ldi r23, 5;
	Ldi r21, 0x55 ;0xAA active low
Flash2:
	Out PortA, r21
	call delay; flash on 1sec

	Out PortA, r22;
	call delay; flash off 1 sec

	Dec r23
	Brne Flash2
	
		;Restore output to previous value
	Out PortA, r17;
		;Restore registers
	Pop r21
	Out sreg, r21
	Pop r23
	Pop r22
	Pop r21
	Reti;


