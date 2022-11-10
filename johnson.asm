IO0SET EQU 0XE0028004
IO0CLR EQU 0XE002800C
IO0DIR	EQU 0XE0028008

	AREA ringCounter, CODE, READONLY
	EXPORT __main
__main
	ENTRY
			LDR R1,=IO0DIR
			LDR R2,=0X00FF0000
			STR R2,[R1]
			
			LDR R6,=0XffFF8000
			ldr r7,=0xff00f000
			;TURN ON 23RD LED
			LDR R1,=IO0SET
			LDR R2,=0X00000000
			STR R2,[R1]
			ldr r3,=0x2fffff
			BL DELAY1
			
			LDR R2,=0Xff800000
			STR R2,[R1]
			ldr r3,=0x2fffff
			BL DELAY1
			
			LDR R0,=IO0CLR
			b ARIGHT
			
			;SHIFT RIGHT UNTIL 0.16 NOT EQUALS 1, OTHERWISE 0.23 =1 
ARIGHT
			STR R2,[R0]
			MOV R2,R2,ASR #1
			STR R2,[R1]
			LDR R3,=0X2fffff
			BL DELAY1
			CMP R2,R6
			BNE ARIGHT
			BEQ	SET

SET
			LDR R2,=0X00FF0000
			STR R2,[R0]
			B LRIGHT

LRIGHT	
			str r2,[r0]
			MOV R2,R2,LSR #1
			STR R2,[R1]
			LDR R3,=0X2fffff
			BL DELAY1
			CMP R2,r7
			BNE LRIGHT
			BEQ RESET
			
RESET	
			STR R2,[R0]
			LDR R2,=0Xff800000
			STR R2,[R1]
			LDR R3,=0X2fffff
			BL DELAY1
			b ARIGHT

DELAY1 
			SUBS R3,R3,#1
			BNE DELAY1
			bx lr
			END


			
			