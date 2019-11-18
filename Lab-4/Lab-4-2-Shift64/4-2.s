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

	CMP R2,#0 ;if(shiftCount <0
	BLT shiftLeft
	BGT shiftRight
	BEQ STOP
	
shiftLeft
    CMP R2,#0 ;while(shiftCount <0
	BGE STOP
	MOV R1,R1,LSL #1; MSB >>1
	MOVS R0,R0,LSL #1;check carry flag
	BCC addingOne
	ADD R1,R1,#0x00000001
addingOne 
	ADD R2,R2,#1
	B shiftLeft
shiftRight
	CMP R2,#0;while(shiftCount >0
	BLE STOP
	MOV R0,R0,LSR #1
	MOVS R1,R1,LSR #1
	BCC minusOne
	ADD R0,R0,#0x80000000
minusOne
	SUB R2,R2,#1
	B shiftRight
STOP	B	STOP

	END
