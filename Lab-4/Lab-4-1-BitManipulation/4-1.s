;
; CSU11021 Introduction to Computing I 2019/2020
; Bit Manipulation
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =137	; a = 137
	LDR	R1, =6		; b = 6

	;
	; Write your program here
	; 
	LDR R3,=0 ; as quotient
	LDR R4,=0 ;as remainder
	LDR R5,=0x80000000; as mask
while
	CMP R5,#0 ;while( mask!=0
	BEQ endwhile
	MOV R4,R4,LSL #1 ;reminder <<1
	AND R6,R0,R5
	
	CMP R6,#0
	BEQ if1
	ORR R4,R4,#1

if1
	CMP R4,R1
	BLO if2
	SUB R4,R4,R1
	ORR R3,R3,R5
if2
	MOV R5,R5,LSL #1
	B while
endwhile
STOP	B	STOP

	END
