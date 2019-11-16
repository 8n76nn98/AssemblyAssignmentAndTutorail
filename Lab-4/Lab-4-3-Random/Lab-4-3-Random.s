;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; start address for pseudo-random sequence
	LDR	R1, =64		; number of pseudo-random values to generate

	;
	; Write your program here
	;	

STOP	B	STOP

	END
