;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string

	;
	; Write your program here
	;

STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0

	END
