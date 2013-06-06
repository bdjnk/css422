*-----------------------------------------------------------
* Title      : 68K Instruction Decoder
* Written by : Michael Plotke
* Date       :
* Description:
*-----------------------------------------------------------

* System equates
STACK		EQU		$A000				; ...
TEST		EQU		%0000111101100001	; example command
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
			JSR		00(A0,D0)			; jump indirect with index

BYTE1		JMP		C0000
			JMP		C0001
			JMP		C0010
			JMP		C0011
			JMP		C0100
			JMP		C0101
			JMP		C0110
			JMP		C0111
			JMP		C1000
			JMP		C1001
			JMP		C1010
			JMP		C1011
			JMP		C1100
			JMP		C1101
			JMP		C1110
			JMP		C1111

C0000
			CLR.L	D0					; clear D0
			MOVE.W	#TEST,D0			; move our command into D0
			
			BTST	#8,D0
			BEQ		
			
			STOP	#$2700
			
C0001		STOP	#$2700				; MOVE (or MOVEA) of size BYTE
C0010		STOP	#$2700				; MOVE (or MOVEA) of size LONG
C0011		STOP	#$2700				; MOVE (or MOVEA) of size WORD
C0100		STOP	#$2700
C0101		STOP	#$2700
C0110		STOP	#$2700
C0111		STOP	#$2700
C1000		STOP	#$2700
C1001		STOP	#$2700
C1010		STOP	#$2700
C1011		STOP	#$2700
C1100		STOP	#$2700
C1101		STOP	#$2700
C1110		STOP	#$2700
C1111		STOP	#$2700

			END		$400

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
