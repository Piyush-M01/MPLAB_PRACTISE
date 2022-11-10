PINSEL1 EQU 0XE002C004
DACR	EQU 0XE006C000

	AREA STAIRCASE,CODE,READONLY
	EXPORT __main
__main
	ENTRY
		LDR R0,=PINSEL1
		LDR R1,=DACR
		
		LDR R2,=0X00080000
		STR R2,[R0]
		
repeat	LDR R5,=sin_wave
		mov r6,#36
		
BACK	ldr r3,[r5],#4
		MOV R4,R3,LSL #6
		STR R4,[R1]
		subs r6,r6,#1
		cmp r6,#0
		bne BACK
		beq repeat
		
sin_wave DCD 512, 601, 687, 768, 841, 904, 955, 993, 1016, 1024, 1016, 993, 955, 904, 841, 768, 687, 601, 512, 423, 337, 256, 183, 120, 69, 31, 8, 0, 8, 31, 69, 120, 183, 256, 337, 423
		END
		