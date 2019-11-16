;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string

    LDR R2,=1 ;tempoary boolean reasult = 1
	LDR R5,=0;innerCount
	LDR R6,=0;outerCount
	LDR R10,=1;constant one
	
outerLoop
	LDRB R3,[R0];
	LDRB R4,[R1];
	CMP R3,#0
	BEQ checkIfFinished
innerLoop
	CMP R4,#0
	BEQ notAnagram;until the end of loop 
	CMP R4,R3
	BEQ reOuterLoop
	ADD R1,R1,#1
	LDRB R4,[R1]
	B innerLoop
reOuterLoop
	STRB R10,[R1];replace the same character with 1 for convience
	LDR R1,=tststr2
	ADD R1,R1,#1
	B outerLoop
notAnagram
	LDR R2,=0
	B finalDealing
checkIfFinished
	CMP R4,#0
	BEQ finalDealing
	CMP R4,#1
	BNE notAnagram
	ADD R1,R1,#1;next Addres for test B
	LDRB R4,[R1]
	B checkIfFinished
finalDealing
	MOV R0,R2
STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0

END
