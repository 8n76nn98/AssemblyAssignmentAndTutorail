;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;
;; linear feedback shifter register
	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000; 
	; start address for pseudo-random sequence
	LDR	R1, =64		; number of pseudo-random values to generate
	LDR R2,=0x5578F7F5; seed for random number
	
	LDR R7,=0; for counter
	LDR R9,=64;ending count
	LDR R8,[R0]
while
	LDR R8,[R0]
	CMP R7,R9
	BGT endwhile
	;linear feedback shifter reigsiter
	TST R1,R1,LSR #1
	MOVS R6,R1,RRX
	ADC R5,R5,R5
	EOR R6,R6,R2,LSL #12
	EOR R2,R6,R6,LSL #20
	
	MOV R8,R2;
	STR R8,[R0]
	ADD R0,R0,#4
	ADD R7,R7,#1
	B while
endwhile
	;
	; Write your program here
	;	

STOP	B	STOP

	END
