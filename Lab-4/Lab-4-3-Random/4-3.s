;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;https://aaronschlegel.me/linear-congruential-generator-r.html
; i have changed the original method mod to use multiple it more convinece
;; linear contriguner generator
	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000; 
	; start address for pseudo-random sequence
	LDR	R1, =64		; number of pseudo-random values to generate
	LDR R2,=1; seed srandx
	LDR R3,=0x0019660D;SRAND K
	LDR R4,=0x3C6EF35F;SRAND B
	
	LDR R7,=0; for counter
	LDR R9,=64;ending count
	;LDRB R8,[R0]
while
	LDRB R8,[R0]
	CMP R7,R9
	BGT endwhile
	;linear feedback shifter reigsiter
	MUL R2,R3,R2
	ADD R2,R2,R4
	
	MOV R2,R2 ,ROR #1
	
	MOV R8,R2;
	STRB R8,[R0]
	ADD R0,R0,#1
	ADD R7,R7,#1
	B while
endwhile
	;
	; Write your program here
	;	

STOP	B	STOP

	END
