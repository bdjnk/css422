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
;test	EQU		%0100100111111001	; example LEA command
;test	EQU		%0000011000000111	; example ADDI command
test	EQU		%0010111001000111	; example MOVEA command

* Program starts here
start	ORG     $400
				 
		CLR.L	D7					; clear D7 (just in case)
		CLR.L	D0					; clear D0 (in preperation)
		MOVE.W	#test,D0			; move our command into D0
			
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#12,D2				; shift left 12 bits
		LSR.L	D2,D1				; so D1 holds only the first 4 bits

		MULU	#6,D1				; ...
		LEA		byte1,A0			; give A0 our jump table's address
		JSR		00(A0,D1)			; jump indirect with index

byte1	JMP		byte1code0			; based on the first four bytes
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
		JSR		getEA
		MOVE.L	#24,D2				; 24 means this is the second argument
		JSR		setEA
		
		JSR		setSize
		
		ADDI.L	#$80000,D7
		
		MOVE.L	#8,D2				; so D1 holds only the second 4 bits
		LSR.L	D2,D1				; shift left 8 bits
		
		CMPI.B	#1,D1
		BEQ		isANDI
		CMPI.B	#2,D1
		BEQ		isSUBI
		CMPI.B	#3,D1
		BEQ		isADDI
		CMPI.B	#5,D1				
		BEQ		isEORI
		CMPI.B	#6,D1
		BEQ		isCMPI
		
		JMP		alldone				; anything else is not a valid command
		
isANDI
		ADDI.B	#$0E,D7
		JMP		alldone				; done --------------------------> ANDI
isSUBI
		ADDI.B	#$0A,D7
		JMP		alldone				; done --------------------------> SUBI
isADDI
		ADDI.B	#$06,D7
		JMP		alldone				; done --------------------------> ADDI
isEORI
		ADDI.B	#$10,D7
		JMP		alldone				; done --------------------------> EORI
isCMPI
		ADDI.B	#$17,D7
		JMP		alldone				; done --------------------------> CMPI
		
byte1code1							; MOVE (or MOVEA) of size BYTE
		ADDI.L	#$100,D7
		JMP		isMOVE
byte1code2							; MOVE (or MOVEA) of size LONG
		ADDI.L	#$300,D7
		JMP		isMOVE
byte1code3							; MOVE (or MOVEA) of size WORD
		ADDI.L	#$200,D7
		JMP		isMOVE
isMOVE
		JSR		getEA
		MOVE.L	#16,D2				; 16 means this is the second argument
		JSR		setEA
		
		MOVE.L	#7,D2				; chop off the 7 first bits
		LSL.W	D2,D1				; shift command word left 7 bits
		MOVE.L	#13,D2				; so D1 holds only the third 3 bits
		LSR.L	D2,D1				; shift right 13 bits
		
		CMPI.B	#1,D1				; if D1 == 1 it's a MOVEA
		BEQ		isMOVEA				; otherwise it's just a MOVE
		
		JMP		alldone
isMOVEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#4,D2				; chop off the 4 first bits
		LSL.W	D2,D1				; shift command word left 7 bits
		MOVE.L	#13,D2				; so D1 holds only the second 3 bits
		LSR.L	D2,D1				; shift right 13 bits
		
		MOVE.L	D1,D5
		
		JMP		alldone
		
byte1code4
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		CMPI.W	#%0100111001110101,D1
		BEQ		isRTS				; otherwise it's LEA
		
		ADDI.B	#$0C,D7				; LEA is 0x0C (12)
		
		MOVE.L	#4,D2				; to clear what we don't want
		LSL.W	D2,D1				; shift command word left 4 bits
		MOVE.L	#13,D2				; and then
		LSR.L	D2,D1				; shift entire long right 13 bits
		
		MOVE.L	D1,D6				; put the An # in D6
		ADDI.L	#$2000000,D7		; second EA is type An (2)
		
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
		
setSize
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#8,D2				; to clear what we don't want
		LSL.W	D2,D1				; shift left 10 bits
		MOVE.L	#13,D2				; so only the size remains
		LSR.L	D2,D1				; shift right 14 bits
		
		CMPI.B	#0,D1
		BEQ		isByte
		CMPI.B	#1,D1
		BEQ		isWord
		CMPI.B	#2,D1
		BEQ		isLong
		
		JMP		sizeSet				; else invalid size!
isByte
		ADDI.L	#$100,D7
		JMP		sizeSet
isWord
		ADDI.L	#$200,D7
		JMP		sizeSet
isLong
		ADDI.L	#$300,D7
		JMP		sizeSet	
sizeSet
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		RTS

* Puts the EA info into D1. Call setEA right after!
getEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#10,D2				; to clear what we don't want
		LSL.W	D2,D1				; shift left 10 bits
		MOVE.L	#13,D2				; so only the EA mode (M) remains
		LSR.L	D2,D1				; shift right 13 bits
		
		JMP		checkEA				; check if figuring is needed
		
checkEA
		CMPI.B	#4,D1				; greater than 4 requires consideration
		BGT		figureEA			; while 4 or less we can map directly
		
		ADDI.B	#1,D1				; 0 is meaningless, start from 1
		RTS
		
figureEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#10,D2				; to clear what we don't want
		LSL.W	D2,D1				; shift left 10 bits
		MOVE.L	#10,D2				; so the EA mode & "register" remains
		LSR.L	D2,D1				; shift right 10 bits
		
		CMPI.B	#$38,D1
		BEQ		isAbsWord
		CMPI.B	#$39,D1
		BEQ		isAbsLong			; else (42) is Immediate Data
		
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
		
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#13,D2				; to clear what we don't want
		LSL.W	D2,D1				; shift left 13 bits
		MOVE.L	#13,D2				; so only the "register" # remains
		LSR.L	D2,D1				; shift right 13 bits
		
		CMPI.L	#16,D2				; is it EA 1
		BEQ		isSource
		CMPI.L	#24,D2				;    or EA 2
		BEQ		isTarget
isSource
		MOVE.L	D1,D6				; set register #
		JMP		EAset
isTarget
		MOVE.L	D1,D5				; set register #
		JMP		EAset
EAset
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		RTS
		
alldone
		STOP	#$2700
		
CR		EQU		$0D			; ASCII code for Carriage Return
LF		EQU		$0A			; ASCII code for Line Feed
error	DC.B	'error at ',SP,CR,LF,0

		END		start

		

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~