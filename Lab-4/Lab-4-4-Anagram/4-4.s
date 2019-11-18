;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string
	LDR R3,=0x40000000 ;for channing tstr2
	;
	; Write your program here
	;
while1
	LDRB R4,[R1] ;load data for str2
	CMP R4,#'\0'
	BEQ endwhile1
	STRB R4,[R3]
	ADD R3,R3,#1
	ADD R1,R1,#1
	B while1
endwhile1
	LDR R7,=0x40000000;start point
	MOV R8,R7

outerLoop
	LDRB R4,[R0];R6 is copy of r0
	CMP R4,#0
	BEQ endOuterLoop
innerLoop
	LDRB R5,[R7]
	CMP R5,#0
	BEQ endinnerLoop
	CMP R4,R5
	BNE notequal
	LDR R5,=1
	STRB R5,[R7]
notequal
	ADD R7,R7,#1
	B innerLoop
endinnerLoop
	ADD R0,R0,#1
	MOV R7,R8;from start
	B outerLoop
endOuterLoop
	
	LDR R7,=0x40000000;start point
	LDR R5,=0
forLoop
	LDRB R4,[R7]
	CMP R4,#0
	BEQ endfor
	ADD R5,R5,R4
	ADD R7,R7,#1
	B forLoop
endfor
	
	LDR R0,=0     
	CMP R5,#5
	BNE finalE
	MOV R0,#1
finalE
STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0

	END
