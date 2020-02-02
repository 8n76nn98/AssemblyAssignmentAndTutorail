;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size value

s

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit

	LDR	R4, =SORTED
	LDR	R5, =UNSORT

	;
	; your sort subroutine goes here
	;
	LDR R0 ,= 0x40000000; for start address
whileLoop				; do
						;{
	LDR R6,=0			; swaped = false;
	LDR R2,=1			; outerIndex index from 1 
forLoop
	CMP R2,#N 			;for(int i = 1 ; i++; i!=N
	BEQ endForLoop	
	SUB R1,R2,#1        ; j = i -1 innnerIndex 
	LDR R9,[R0,R2,LSL #2]   ; load array[i] into R9
	LDR R10,[R0,R1,LSL#2]   ;load array[j] into R10;
	CMP R9,R10				;if array[j] >=array[i] do not swap
	BLS dontSwap
	BL swapSubroutine 		; else swap array[i] array[j]
	LDR R6,=1;				;boolean swapped = true;
dontSwap
	ADD R2,R2,#1		;i++
	B 	forLoop
endForLoop
	CMP R6,#1 ;while(swapped)
	BEQ whileLoop
	

;swapSub subtroutine
;Swap two elements at index i and j in a one dimensional array of word-size integers
;;
;Parameters:
;R0 =arrayStartsAddrss;
;R1 = J(element index mainly for innerIndex
;R2 = I (elemment index mainly for outerIndex
;return void ; need to an empty stack
swapSubroutine
	STMFD SP!,{R3-R4,LR}		; passing parameters in reigster  saving reigster
	LDR R3,[R0,R1,LSL #2]  ; loading j index to local varibale
	LDR R4,[R0,R2,LSL #2]   ;loading i index to local variable
	STR R3,[R0,R2,LSL #2]  ; store  i, j index
    STR R4,[R0,R1,LSL #2]  ; store j ,i to 
	LDMFD SP!,{R6-R7,PC}   ;restore and restore

	

UNSORT	DCD	9,3,0,1,6,2,4,7,8,5

	END
