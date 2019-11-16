;
; CSU11021 Introduction to Computing I 2019/2020
; 64-bit Shift
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =0xD9448A9B		; most significaint 32 bits (63 ... 32)
	LDR	R0, =0xB8AA9D3B		; least significant 32 bits (31 ... 0)
	LDR	R2, =-2			; shift count

	;
	; Write your program here
	;

STOP	B	STOP

	END
