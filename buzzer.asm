 ;INCLUDE VICVPB.S
IO0SET EQU 0XE0028004
IO0CLR EQU 0XE002800C
IO0DIR	EQU 0XE0028008
	AREA BUZZ,CODE,READONLY
	EXPORT __main
__main
	ENTRY
		LDR R1,=IO0DIR
		LDR R0,=IO0CLR
		LDR R2,=IO0SET
		
S		LDR R3,=0X00000200
		STR R3,[R1]
		
		STR R3,[R2]
		LDR R4,=0X2FFF
		B DELAY
DELAY   SUBS R4,R4,#1
		CMP R4,#0
		BNE DELAY
		
		STR R3,[R0]
		B	S
		END