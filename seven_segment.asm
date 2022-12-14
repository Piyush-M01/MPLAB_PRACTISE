IO0DIR EQU 0XE0028008
IO0CLR EQU 0XE002800C
IO0SET EQU 0XE0028004
	AREA SEVEN,CODE,READONLY
	EXPORT __main
__main
	ENTRY
	LDR R0,=IO0DIR
	LDR R1,=IO0SET
	LDR R2,=IO0CLR
	
	;SET PINS 0.16-0.23 AND 0.28-0.31 HIGH
	LDR R3,=0XF0FF0000
	STR R3,[R0]
	STR R3,[R2]
	
	; OUTPUT 0 1 2 3
S	LDR R3,=0X803F0000
	STR R3,[R1]
	BL DELAY
	
	STR R3,[R2]
	LDR R3,=0X40060000
	STR R3,[R1]
	BL DELAY
	
	STR R3,[R2]
	LDR R3,=0X205B0000
	STR R3,[R1]
	BL DELAY
	
	STR R3,[R2]
	LDR R3,=0X104F0000
	STR R3,[R1]
	BL DELAY
	
DELAY
	LDR R5,=0X2FFFFF
SS	SUBS R5,R5,#1
	CMP R5,#0
	BNE SS
	STR R3,[R2]
	LDR R6,=0X104F0000
	CMP R3,R6
	BEQ S
	BNE BRANCH
BRANCH
	BX LR
	END