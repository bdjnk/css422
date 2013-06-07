*-----------------------------------------------------------
* Title      : 68K Instruction Decoder
* Written by : Michael Plotke
* Date       :
* Description:
*	D0 holds the command immutably. D1 holds it mutably.
*	D2 is a temp holder for shifts.
*	speaking of bits, order is: first --> second --> ... --> last
*-----------------------------------------------------------

* System equates
test	EQU		%0100100111111001	; example command
;test	EQU		%0001111001110101	; example command

* Program starts here
		ORG     $400
				 
start:	CLR.L	D7					; clear D7 (just in case)
		CLR.L	D0					; clear D0 (in preperation)
		MOVE.W	#test,D0			; move our command into D0
			
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#12,D2				; shift left 12 bits
		LSR.L	D2,D1				; so D1 holds only the first 4 bits

		MULU	#6,D1				; ...
		LEA		byte1,A0			; give A0 our jump table's address
		JSR		00(A0,D1)			; jump indirect with index

byte1	JMP		byte1code0
		JMP		byte1code1
		JMP		byte1code2
		JMP		byte1code3
		JMP		byte1code4
		JMP		byte1code5
		JMP		byte1code6
		JMP		byte1code7
		JMP		byte1code8
		JMP		byte1code9
		JMP		byte1code10
		JMP		byte1code11
		JMP		byte1code12
		JMP		byte1code13
		JMP		byte1code14
		JMP		byte1code15

byte1code0
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		BTST	#8,D1				; test bit number 8 of D0
		BEQ		in0bit8is0			; if it's 0 jump to in0bit8is0
									; none of these are valid commands
		JMP		alldone
in0bit8is0
		LSL.W	#4,D1				; shift by word, chops 4 highest bits
		MOVE.L	#12,D2				; shift left 12 bits
		LSR.L	D2,D1				; so D1 holds only the second 4 bits
		
		CMPI.B	#1,D1				; 
		BEQ		isANDI
		CMPI.B	#2,D1
		BEQ		isSUBI
		CMPI.B	#3,D1
		BEQ		isADDI
		CMPI.B	#5,D1				
		BEQ		isEORI				; else it's a CMPI
		
		ADDI.B	#$17,D7				; 
		
		JMP		alldone
		
isANDI
		ADDI.B	#$0E,D7
		
		JMP		alldone
isSUBI
		ADDI.B	#$0A,D7
		
		JMP		alldone
isADDI
		ADDI.B	#$06,D7
		
		JMP		alldone
isEORI
		ADDI.B	#$10,D7
		
		JMP		alldone
		
byte1code1							; MOVE (or MOVEA) of size BYTE
		
		
byte1code2							; MOVE (or MOVEA) of size LONG
		
		JMP		alldone
		
byte1code3							; MOVE (or MOVEA) of size WORD
		
		JMP		alldone
		
isMOVE
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		LSL.W	#7,D1				; shift by word, chops 7 highest bits
		MOVE.L	#15,D2				; shift left 15 bits
		LSR.L	D2,D1				; so D1 holds only the third 3 bits
		CMPI.B	#1,D1				; if D1 == 1 it's a MOVEA
		BEQ		isMOVEA				; otherwise it's just a MOVE
		
		JMP		alldone
isMOVEA
		
		JMP		alldone
		
byte1code4
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		CMPI.W	#%0100111001110101,D1
		BEQ		isRTS				; otherwise it's LEA
		
		ADDI.B	#$0C,D7
		
		* todo : add LEA's EA stuff
		MOVE.L	#4,D2				; shift left 4 bits
		LSL.W	D2,D1				; to clear what we don't want
		MOVE.L	#13,D2
		LSR.L	D2,D1
		
		MOVE.L	D1,D6
		ADDI.L	#$2000000,D7
		
		JSR		getEA
		MOVE.L	#16,D2
		JSR		setEA
		
		JMP		alldone				; done ---------------------------> LEA
isRTS
		ADDI.B	#$1D,D7				; all zeros except 29 
		JMP		alldone				; done ---------------------------> RTS
		
byte1code5
		JMP		alldone

byte1code6
		JMP		alldone

byte1code7
		JMP		alldone

byte1code8							; no valid commands start with 1000
		JMP		alldone

byte1code9
		JMP		alldone

byte1code10							; no commands start with 1010 (?)
		JMP		alldone

byte1code11
		JMP		alldone

byte1code12
		JMP		alldone

byte1code13
		JMP		alldone

byte1code14
		JMP		alldone

byte1code15
		JMP		alldone

* Puts the EA info into D1. Call setEA right after!
getEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#10,D2				; shift left 10 bits
		LSL.W	D2,D1				; to clear what we don't want
		MOVE.L	#13,D2				; shift right 13 bits
		LSR.L	D2,D1				; so only the EA mode (M) remains
		
		JMP		checkEA
		
checkEA
		CMPI.B	#4,D1				; greater than 4 requires consideration
		BGT		figureEA			; while 4 or less we can map directly
		
		ADDI.B	#1,D1				; 0 is meaningless, start from 1
		RTS
		
figureEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#10,D2				; shift left 10 bits
		LSL.W	D2,D1				; to clear what we don't want
		MOVE.L	#10,D2				; shift right 13 bits
		LSR.L	D2,D1				; so the EA mode & "register" remains
		
		CMPI.B	#$38,D1
		BEQ		isAbsWord
		CMPI.B	#$39,D1
		BEQ		isAbsLong			; else is Immediate Data
		
		MOVE.L	#8,D1
		RTS
		
isAbsWord
		MOVE.L	#6,D1
		RTS
isAbsLong
		MOVE.L	#7,D1
		RTS
		
* Make sure to set D2 correctly (to 16 or 24) before calling setEA!
setEA
		LSL.L	D2,D1				; don't overwrite our command byte
		ADD.L	D1,D7				; add the EA to our info register
		
		CMPI.L	#$FF0000,D1			; figure out which position
		;BGT		isTarget			; else isSource
		
		RTS
		
alldone
		STOP	#$2700

		END		$400

		

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~