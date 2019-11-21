;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string
	LDR R2,=0x40000000 ;for channing tstr2
	MOV R3,R2;start address of r1
	LDR R8,=1 ;flag
whileLoad  ;transforming string to array
	LDRB R4,[R1] ;load data for str2
	CMP R4,#'\0'
	BEQ endwhileLoad
	STRB R4,[R2]
	ADD R2,R2,#1
	ADD R1,R1,#1
	B whileLoad
endwhileLoad	
	
	MOV R5,R3
outerFor
	LDRB R4,[R0]
	CMP R4,#'\0'
	BEQ endOuterLoop

while		;while(
	LDRB R6,[R5]
	CMP R4,R6 ;(char A !=char B
	BEQ endwhile;&&
	CMP R6,#0	;char B !=0x00)
	BEQ endwhile
	ADD R5,R5,#1
	B while
endwhile
	CMP R4,R6; char A = char B
	BNE notAn
	LDR R7,=1
	STRB R7,[R5]
	B endifA
notAn
	MOV R8,#0
	B finalResultNotA	
endifA
	ADD R0,R0,#1
	MOV	R5,R3
	B outerFor
endOuterLoop

finalResultNotA
	CMP R8,#0
	BEQ  notAnar ;result !=0   
	LDR R0,=1
	B endifF
notAnar
	LDR R0,=0
endifF	

STOP	B	STOP

tststr1	DCB	"stapas",0
tststr2	DCB	"pasta",0

	END
