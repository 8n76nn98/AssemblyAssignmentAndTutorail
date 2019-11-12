
	;r0 is for the sum rememeber!
	LDRB R1,=testWord
	LDRB R2,=values
	LDRB R3 =0x40000000;wordCount 
while
	LDR R4,[R1] ;load value
	CMP R4,#'\0' ;end of string
	BEQ endwhile
	SUB R5,R4,#'A' ; computing related position
	LDR R6,[R3+R5] ; //the value of related position
	MOV R7,R6; count = Memory.count[R3+distance]
	ADD R7,R7,#1
	STRB R7,[R7+R3]
	ADD R1,R1,#1 ;adding the address of str
	B while
endwhile 
	LDR R8,=0 ;for index
	LDR R9,=0; for value
while2
	CMP R8,#26
	BHS endwhile2
	LDR R10,[R3+R8]
	CMP R10,#0
	BLS else
	ADD R2,R2,R8 ;address of values += index
	LDR R11,[R2] ; load value of spefic element
	LDR R12,[R3+R8] ;time for spefic letter
	MUL R9,R12,R11
	ADD R0,R0,R9
	SUB R2,R2,R8
else
	ADD R8,R8,#1
	
endwhile2

testWord DCB    "BANANA",0
values  DCB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26

















testWord DCB	"BANANA",0
values	DCB	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26