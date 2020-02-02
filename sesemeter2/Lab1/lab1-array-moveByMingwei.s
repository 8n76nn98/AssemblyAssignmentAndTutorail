;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =6 ; index move from
	LDR	R2, =3 ; index move to
	LDR	R3, =N

	; your program goes here
;moving  from right to left
	;firstly swaping the number moveing to and moving from 
	MOV R10,#4; for byte mul since Loading bye
	MUL R9,R1,R10; R9 = number of bytes from start of array for x to move (Start)
	MOV R4,R0 ; copy the start address to r4
	ADD R4,R4,R9 ; R4 = memory location of x to move (destiation location)
	MUL R9,R2,R10 ; R9 = the number of bytes from start of ary for where the x moves to (End)
	MOV R5,R0 ; Copy the start address to R5;
	ADD R5,R5,R9 ;The location of where to  move x to (start) 
	LDR R6,[R4] ; loading starting number to register
	CMP R1,R2 
	BLT LESS ;
	
	;if R1 is greater than r2
	SUB R4,R4,#4
DN 
	LDR R7,[R4]; load value before 
	STR R7,[R4,#4] ;store value in previous register
	SUB R4,R4,#4
	CMP R4,R5 ;while(r4 <r5)
	BGE DN
	STR R6,[R4,#4]
	B EXIT
	;if r1 is less than 
LESS
	ADD R4,R4,#4
UP 
	LDR R7,[R4];load value after;
	STR R7,[R4,#-4]; store value in afer reigeter
	ADD R4,R4,#4
	CMP R4,R5  ;while(r4>r5)
	BLE UP
	STR R6,[R4,#-4]
	B EXIT


EXIT

STOP	B	STOP

	END
