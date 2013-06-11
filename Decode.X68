* * -----------------------------------------------------------------------
* Title      : 68K Instruction Decoder
* Written by : Michael Plotke
* Date       :
* Description:
*	D0 holds the command immutably. D1 holds it mutably.
*	D2 is a temp holder for shifts.
*	speaking of bits, order is: first --> second --> ... --> last
* * -----------------------------------------------------------------------

* System equates
;test	EQU		%0100100111111001	; example LEA command
;test	EQU		%0000011000000111	; example ADDI command
;test	EQU		%0010011000000100	; example MOVE command
test	EQU		%0101011000000111	; example ADDQ command

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

byte1code0 * ========================================================= 0000
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		BTST	#8,D0				; test bit number 8 of D0
		BEQ		in0bit8is0			; if it's 0 jump to in0bit8is0
									; none of these are valid commands
		JMP		alldone
		
in0bit8is0
		JSR		getEA
		MOVE.L	#24,D2				; 24 = isTarget (second argument)
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		JSR		setSize				; work for normal size (bits 9 & 10)
		
		ADDI.L	#$80000,D7			; source is immediate data
		
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
		
byte1code1 * MOVE (or MOVEA) of size BYTE ============================ 0001
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		ADDI.L	#$100,D7
		JMP		isMOVE
		
byte1code2 * MOVE (or MOVEA) of size LONG ============================ 0010
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		ADDI.L	#$300,D7
		JMP		isMOVE
		
byte1code3 * MOVE (or MOVEA) of size WORD ============================ 0011
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		ADDI.L	#$200,D7
		JMP		isMOVE
		
isMOVE
		JSR		getEA
		MOVE.L	#16,D2				; 16 = isSource (first argument)
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		MOVE.L	#7,D2				; chop off the 7 first bits
		LSL.W	D2,D1				; shift command word left 7 bits
		MOVE.L	#13,D2				; so D1 holds only the third 3 bits
		LSR.L	D2,D1				; shift right 13 bits
		
		CMPI.B	#1,D1				; if D1 == 1 it's a MOVEA
		BEQ		isMOVEA				; otherwise it's just a MOVE
		
		ADDI.B	#1,D1				; 0 is meaningless, start from 1
		MOVE.L	#24,D2				; 24 = isTarget
		MOVE.L	#4,D3				; register number is middle 3 bits
		JSR		setEA
		
		ADDI.L	#$01,D7
		JMP		alldone				; done --------------------------> MOVE
		
isMOVEA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#4,D2				; chop off the 4 first bits
		LSL.W	D2,D1				; shift command word left 7 bits
		MOVE.L	#13,D2				; so D1 holds only the second 3 bits
		LSR.L	D2,D1				; shift right 13 bits
		
		MOVE.L	D1,D5				; stick An # in D5
		ADDI.L	#$2000000,D7		; add An to D7 as destination
		
		ADDI.L	#$03,D7
		JMP		alldone				; done -------------------------> MOVEA
		
byte1code4 * ========================================================= 0100
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
		MOVE.L	#16,D2				; 16 = isSource
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		JMP		alldone				; done ---------------------------> LEA
		
isRTS
		ADDI.B	#$1D,D7				; all zeros except 29 
		JMP		alldone				; done ---------------------------> RTS
		
byte1code5 * ========================================================= 0101
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		JSR		setSize
		
		JSR		getEA
		MOVE.L	#24,D2				; 24 = isTarget
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		ADDI.L	#$80000,D7			; source is immediate data
		
		BTST	#8,D0				; test bit number 8 of D0
		BEQ		isADDQ				; if it's 0 jump to isADDQ
		
		ADDI.L	#$B,D7
		JMP		alldone				; done --------------------------> SUBQ
		
isADDQ
		ADDI.L	#$7,D7
		JMP		alldone				; done --------------------------> ADDQ

byte1code6 * ========================================================= 0110
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		; TODO Bcc <-------------------------------------------------------
		
		CMPI.B	#$00,D1				; check the displacement
		;...
		
		MOVE.L	#4,D2				* keep only the condition
		LSL.L	D2,D1
		MOVE.L	#12,D2
		LSR.L	D2,D1
		
		CMPI.B	#2,D2
		BEQ		isHI
		CMPI.B	#3,D2
		BEQ		isLS
		CMPI.B	#6,D2
		BEQ		isNE
		CMPI.B	#7,D2
		BEQ		isEQ
		CMPI.B	#13,D2
		BEQ		isLT
		
		JMP		alldone

byte1code7 * ========================================================= 0111
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#$1080302,D7		; byte (long) from immediate to Dn
		
		MOVE.L	#1,D1				; indicates a Dn
		MOVE.L	#24,D2				; 24 = isTarget
		MOVE.L	#4,D3				; register number is middle 3 bits
		JSR		setEA
		
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		MOVE.L	#8,D2				; get rid of everything but the data
		LSL.L	D2,D1
		MOVE.L	D1,D6				; the data goes in D6 (EA 1)
		
		JMP		alldone				; done -------------------------> MOVEQ

byte1code8 * no valid commands start with ============================ 1000
		JMP		alldone

byte1code9 * ========================================================= 1001
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#8,D2				* shift the bits
		LSL.L	D2,D1				* so only the two size bits 
		MOVE.L	#14,D2				* remain
		LSR.L	D2,D1
		
		CMPI.B	#3,D1
		BEQ		isSUBA				; else isSUB
		
		JSR		setSize
		ADDI.L	#$8,D7				; command is SUB
		
		MOVE.L	#1,D1				; indicates a Dn
		BTST	#8,D0				; if bit 8 of D0 is 1, EA is source
		BNE		doEAisSource		; else EA is target
		JSR		EAisTarget
		
		JMP		alldone				; done ---------------------------> SUB
		
isSUBA
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		ADDI.L	#$2000000,D7		; target is An (02)
		ADDI.L	#$9,D7				; command is SUBA
		
		MOVE.L	#2,D1				; indicates a An
		JSR		EAisSource			; EA is source
		
		JMP		alldone				; done --------------------------> SUBA

byte1code10 * no commands start with ================================= 1010
		JMP		alldone

byte1code11 * ======================================================== 1011
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#8,D2				* leave 2 bits
		LSL.L	D2,D1
		MOVE.L	#14,D2
		LSR.L	D2,D1
		
		CMPI.B	#3,D1
		BEQ		isCMPA				; else command is EOR or CMPA

		BTST	#8,D0				; if bit 8 is 1, command is EOR
		BNE		isEOR				; else command is CMP
		
		JSR		setSize
		
		ADDI.L	#$15,D7
		
		MOVE.L	#1,D1				; indicates a Dn
		JSR		EAisSource
		
		JMP		alldone				; done ---------------------------> CMP
		
isEOR
		JSR		setSize
		
		MOVE.L	#1,D1				; indicates a Dn
		JSR		EAisTarget
		
		ADDI.L	#$E,D7
		JMP		alldone				; done ---------------------------> EOR
		
isCMPA
		MOVE.L	#8,D2
		JSR		setBitSize
		
		ADDI.L	#$16,D7
		
		MOVE.L	#2,D1				; indicates a An
		JSR		EAisSource
		
		JMP		alldone				; done --------------------------> CMPA

byte1code12 * AND ===================================================== 1100
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		JSR		setSize
		
		ADDI.L	#$D,D7
		
		MOVE.L	#1,D1				; indicates a Dn
		BTST	#8,D0				; if bit 8 of D0 is 1, EA is source
		BNE		doEAisSource		; else EA is target
		JSR		EAisTarget
		
		JMP		alldone

byte1code13 * ======================================================== 1101
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#8,D2				* leave 2 bits
		LSL.L	D2,D1
		MOVE.L	#14,D2
		LSR.L	D2,D1
		
		CMPI.B	#3,D1
		BEQ		isADDA				; else command is ADD
		
		JSR		setSize
		
		ADDI.L	#$4,D7
		
		MOVE.L	#1,D1				; indicates a Dn
		BTST	#8,D0				; if bit 8 of D0 is 1, EA is source
		BNE		doEAisSource		; else EA is target
		JSR		EAisTarget
		
		JMP		alldone
		
isADDA
		MOVE.L	#8,D2
		JSR		setBitSize
		
		ADDI.L	#$5,D7
		
		MOVE.L	#2,D1				; indicates a An
		JSR		EAisSource
		
		JMP		alldone

byte1code14 * ======================================================== 1110
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		
		MOVE.L	#8,D2				* leave the 2 "size" bits
		LSL.L	D2,D1
		MOVE.L	#14,D2
		LSR.L	D2,D1
		
		CMPI.B	#3,D1				; if "size" is 3
		BEQ		isWAT				; else command is ASd or LSd
		
		JSR		setSize
		
		MOVE.L	#4,D2				* leave the 3 "rotation" bits
		LSL.L	D2,D1
		MOVE.L	#13,D2
		LSR.L	D2,D1
		
		BTST	#11,D0				; if bit 11 of D0 is 0, uses immediate
		BEQ		isImmediate			; else uses a register
		
		ADDI.L	#$10000,D7
		
continueXSd1
		MOVE.L	D1,D6
		
		MOVE.L	#11,D2				* leave the 2 bits before the 3 last
		LSL.L	D2,D1
		MOVE.L	#14,D2
		LSR.L	D2,D1
		
		CMPI.B	#0,D1				; if 0, shift is arithmatic
		BEQ		isASd				; else shift is logical
		
		JMP		alldone
		
isImmediate
		ADDI.L	#$80000,D7
		JMP		continueXSd1
		
isASd
		BTST	#8,D0				; if bit 8 of D0 is 1, shift left
		BNE		isLeftShift			; else shift right
		
isLeftShift

byte1code15 * no commands start with ================================= 1111
		JMP		alldone
		
doEAisSource
		JSR		EAisSource
		JMP		alldone
		
* * -----------------------------------------------------------------------
* name: Set Size
* parameters:
*	none
* returns:
*	D7 - Set with the size (according to our template)
* notes:
*	Only works for the standard size format and command bit position
* * -----------------------------------------------------------------------
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

* * -----------------------------------------------------------------------
* name: Set Bit Size
* parameters:
*	D2 - the size bit's position
* returns:
*	D7 - Set with the size (according to our template)
* notes:
*	Only works for the single bit size format
* * -----------------------------------------------------------------------
setBitSize
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		BTST	D2,D0				; if bit 8 is 0, size is Word
		BEQ		bitSizeWord			; else size is Long
		ADDI.L	#$200,D7
		RTS
bitSizeWord
		ADDI.L	#$200,D7
		RTS
		
* * -----------------------------------------------------------------------
* name: Set EA as Source
* parameters:
*	D1 - The EA mode (according to our template)
* returns:
*	none
* notes:
*	
* * -----------------------------------------------------------------------
EAisSource
		MOVE.L	#24,D2				; 24 = isTarget
		MOVE.L	#4,D3				; register number is middle 3 bits
		JSR		setEA
		
		JSR		getEA
		MOVE.L	#16,D2				; 16 = isSource
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		RTS

* * -----------------------------------------------------------------------
* name: Set EA as Target (destination)
* parameters:
*	D1 - The EA mode (according to our template)
* returns:
*	none
* notes:
*	
* * -----------------------------------------------------------------------
EAisTarget
		MOVE.L	#16,D2				; 16 = isSource
		MOVE.L	#4,D3				; register number is middle 3 bits
		JSR		setEA
		
		JSR		getEA
		MOVE.L	#24,D2				; 24 = isTarget
		MOVE.L	#13,D3				; register number is last 3 bits
		JSR		setEA
		
		RTS
		
* * -----------------------------------------------------------------------
* name: Get Effective Address Mode
* parameters:
*	none
* returns:
*	D1 - Set to the EA mode (according to our template)
* notes:
*	Call setEA right after!
* * -----------------------------------------------------------------------
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
		
* * -----------------------------------------------------------------------
* name: Set Effective Address
* parameters:
*	D1 - The EA mode (according to our template)
*	D2 - Whether it's the source (16) or destination / target (24)
*	D3 - Which command bit position the register number is at
* returns:
*	D5 - Set with the target register number
*	D6 - Set with the source register number
* notes:
*	Call right after getEA
* * -----------------------------------------------------------------------
setEA
		LSL.L	D2,D1				; don't overwrite our command byte
		ADD.L	D1,D7				; add the EA to our info register
		
		CMPI.B	#5,D1				; if it uses a register
		BLE		setRegisterNumber	; set the correct number
		JMP		EAset				; otherwise we're done here
setRegisterNumber
		MOVE.L	D0,D1				; reset D1 to D0 (full command)
		LSL.W	D3,D1				; shift back and forth to leave only
		MOVE.L	#13,D3
		LSR.L	D3,D1				; the correct 3 bit register number
		
		CMPI.L	#16,D2				; is it EA 1 (source)
		BEQ		isSource
		CMPI.L	#24,D2				;    or EA 2 (target)
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
error	DC.B	'error',CR,LF,0

		END		start

		

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~