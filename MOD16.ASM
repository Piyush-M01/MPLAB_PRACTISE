IO0DIR EQU 0XE0028008
IO0CLR EQU 0XE002800C
IO0SET EQU 0XE0028004

	AREA MOD16,CODE,READONLY
	EXPORT __main
__main
	ENTRY
		LDR R0,=IO0DIR
		LDR R1,=IO0SET
		LDR R2,=IO0CLR
		
		LDR R3,=0XF0FF0000
		STR R3,[R0]
		STR R3,[R2]
		
		LDR R8,=SEQ0
		LDR R9,=SEQ1
		LDR R10,=SEQ2
		LDR R11,=SEQ3
S		LDR R3,[R8],#4
		LDR R4,[R9],#4
		LDR R5,[R10],#4
		LDR R6,[R11],#4
		STR R3,[R1]
		ldr R7,=0X2F
up1		subs r7,r7,#1
		bne up1
		str r3,[r2]
		STR R4,[R1]
		ldr R7,=0X2F
up2		subs r7,r7,#1
		bne up2
		str r4,[r2]
		STR R5,[R1]
		ldr R7,=0X2F
up3		subs r7,r7,#1
		bne up3
		str r5,[r2]
		STR R6,[R1]
		ldr R7,=0X2F
up4		subs r7,r7,#1
		bne up4
		str r5,[r2]
		B DELAY
		
DELAY	LDR R7,=0X2FFFF
		B UP
UP		SUBS R7,R7,#1
		BNE UP
		STR R3,[R2]
		STR R4,[R2]
		STR R5,[R2]
		STR R6,[R2]
		B	S

SEQ0 DCD 0X803F0000, 0X803F0000,0X803F0000,0X803F0000,0X803F0000,0X803F0000,0X803F0000,0X803F0000,0X80060000,0X80060000,0X80060000,0X80060000,0X80060000,0X80060000,0X80060000,0X80060000
SEQ1 DCD 0X403F0000, 0X403F0000,0X403F0000,0X403F0000,0X40060000,0X40060000,0X40060000,0X40060000,0X403F0000, 0X403F0000,0X403F0000,0X403F0000,0X40060000,0X40060000,0X40060000,0X40060000
SEQ2 DCD 0X203F0000,0X203F0000,0X20060000,0X20060000,0X203F0000,0X203F0000,0X20060000,0X20060000,0X203F0000,0X203F0000,0X20060000,0X20060000,0X203F0000,0X203F0000,0X20060000,0X20060000
SEQ3 DCD 0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000,0X103F0000,0X10060000