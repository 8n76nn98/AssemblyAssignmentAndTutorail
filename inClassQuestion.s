;1 clear (it chenge to zero) the middle two bytes of the value in R1
	LDR R1,=0x12345678
	LDR R2,=0xFF0000FF
	AND R1,R1,R2
;or 
	LDR R2,0x00FFFF00
	BIC R1,R1,R2
;2 set(ie.change to one )the four most significant bits of the value in R2
	LDR R2,=0x12345678
	LDR R3,=0xF0000000
	ORR R2,R2,R3
;invert every second bit of the value in R3,starting with the least significant bit
	LDR R3,=0x12345678
	;101010101010101011
	LDR R5,=0x555555555
;swap the position of middle two bytes of the value in R4
	LDR R4,=0x12345678
	AND R5,R4,0x0000FF00
	AND R6,R4,0x00FF0000

	MOV R5,R5,LSL,#8
	MOV R6,R6,LSR,#8

	LDR R7,=0xFF0000FF
	ADD R4,R4,R7

	ORR R4,R4,R5
	OEE R4,R4,R6
;computing the number of contingues of 1 
//time compxity of my algorithm is linear 
psedo code for computing the number of continge of number 
void function
{
	int flagOnforZero = 1; ;use a register for button as tag for start for 0 
	int x = 0b11101111000000000100001100000111
	int count = 0;
	int mask = 0xb0000000000000001; //mask for pick up the leas significant bit 
	while(x!=0)
	{
		int last digit = x &mask; //picking up the last digit AND operation in assembly 
		if(lastDigit ==0)
		{
			flagOnforZero =0;

		}

		if(flagOnforZero =0)
		{
			//do nothing 
		}
		else
		{
			count ++;
			flagOnforZero =1
		}
		x =x LSR #1 ;x/2

	}
}
；function for computing the the number of continge of number 
	LDR R1,=1 ;use a register ofr btton as tage for start for 0
	LDR R2,=0x12345678 ; test data
	LDR R3,=1			;mask for picking up the less signficant bit
	LDR R6 =0;for counter 
while
	CMP R2,#0
	BEQ endwhile
	AND R4,R2,R3 ; int lastDigit =R2&last digit 
	CMP R4,#0
	BNE endif1
	LDR R1,=0
endif1
	CMP R1,#0
	BNE elseif2
	B endif2
elseif2
	ADD R6,R6,#1
	LDR R1,=0
endif2
	MOV R2,R2,LSR,#1
	B while 
endwhile



//my version
void function
{
	int flagOnforZero = 1; ;use a register for button as tag for start for 0 
	int x = 0b11101111000000000100001100000111
	int count = 0;
	int mask = 0xb0000000000000001; //mask for pick up the leas significant bit 
	while(x!=0)
	{
		int last digit = x &mask; //picking up the last digit AND operation in assembly 
		if(lastDigit ==0)
		{
			flagOnforZero =0;

		}

		if(flagOnforZero =0)
		{
			//do nothing 
		}
		else
		{
			count ++;
			flagOnforZero =1
		}
		x =x LSR #1 ;x/2

	}
}
；function for computing the the number of continge of number 
	LDR R1,=1 ;use a register ofr btton as tage for start for 0
	LDR R2,=0x12345678 ; test data
	LDR R3,=1			;mask for picking up the less signficant bit
	LDR R6 =0;for counter 
while
	CMP R2,#0
	BEQ endwhile
	AND R4,R2,R3 ; int lastDigit =R2&last digit 
	CMP R4,#0
	BNE endif1
	LDR R1,=0
endif1
	CMP R1,#0
	BNE elseif2
	B endif2
elseif2
	ADD R6,R6,#1
	LDR R1,=0
endif2
	MOV R2,R2,LSR,#1
	B while 
endwhile


	LDR R2,=1
	LDR R1,=0x0F0F0F0F;
	LDR R0,=0 ;count =0
	LDR R2,=1;lastBit
	LDR R3,=0;i = 0	

for
	CMP R3,#32
	BHS endfor					;for(i = 0 ;i<32;i++){
	AND R4,R1,#1
	CMP R4,#0
	BNE endIf
	CMP R2,#1
	BNE endIf
	ADD R0,R0,#1
endIf
	MOV R2,R4	;lastBit = value&1;
	MOV R1,R1,LSR #1
	B for
endfor
						;	if(value &=1==0 &&lastBit == 1)
						;	{
						;		count++;
						;	}
						;	lastBit = value&1;
						;	value = value>>1;
						;}


Bouns challenge 
  set MSB Parity 
