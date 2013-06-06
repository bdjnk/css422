*-----------------------------------------------------------
* Title      : 68K Instruction Decoder
* Written by : Michael Plotke
* Date       :
* Description:
*-----------------------------------------------------------

* System equates
STACK		EQU		$A000				; ...
TEST		EQU		%1101111001100001	; example command
SHIFT		EQU		$000C				; = 12

* Program starts here
			ORG     $400
				 
START:		LEA		STACK,SP			; ...
			LEA		BYTE1,A0			; give A1 our jump table's address
			CLR.L	D0					; clear D0
			MOVE.W	#TEST,D0			; move our command into D0
			LSR.L	#8,D0				; shift left 12 bits so D0
            LSR.L	#4,D0				;   holds the 4 highest bits

			MULU	#6,D0				; ...
			JSR		00(A0,D0)			; Jump indirect with index

BYTE1		JMP		@0000
			JMP		@0001
			JMP		@0010
			JMP		@0011
			JMP		@0100
			JMP		@0101
			JMP		@0110
			JMP		@0111
			JMP		@1000
			JMP		@1001
			JMP		@1010
			JMP		@1011
			JMP		@1100
			JMP		@1101
			JMP		@1110
			JMP		@1111

@0000		STOP	#$2700
@0001		STOP	#$2700
@0010		STOP	#$2700
@0011		STOP	#$2700
@0100		STOP	#$2700
@0101		STOP	#$2700
@0110		STOP	#$2700
@0111		STOP	#$2700
@1000		STOP	#$2700
@1001		STOP	#$2700
@1010		STOP	#$2700
@1011		STOP	#$2700
@1100		STOP	#$2700
@1101		STOP	#$2700
@1110		STOP	#$2700
@1111		STOP	#$2700

			END		$400

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
