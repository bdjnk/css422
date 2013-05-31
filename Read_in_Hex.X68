******************************************************
* Get_value
* Converts 4 ASCII values to a 4-digit hex number
* Input Parameters: None
* Assumptions: The buffer, ascii_val contains 4 valid ascii 
* characters in the range of 0...9, A...F, or a...f
******************************************************
*System equates

MASK		EQU		$00FF		* Isolates the byte value
STACK		EQU		$B000		* Location of stack pointer

* Program starts here
START		ORG		$1000		* Program runs here
			LEA		STACK,SP	* Set-up the stack pointer 
			
			LEA		MESSAGE,A1	* get message address
			MOVE	#14,D0
			TRAP	#15			* print the message
			
			MOVE.W	#2,D0		* 2 is read null terminated string
			TRAP	#15			* with max length 80 -> D1.W
			
			JSR		CONVERT
			MOVE.W	D7,D2
			LEA		MESSAGEA,A1
			MOVE	#14,D0
			TRAP	#15
			MOVE.W	#2,D0
			TRAP	#15
			JSR		CONVERT
		
CONVERT		CLR.W	D7 			* We'll need this register
			MOVE.B	(A1)+,D0 	* Get the first byte 
			ANDI.W	#MASK,D0 	* Isolate the byte
			JSR		STRIP_ASCII * Get rid of the ascii code
			ASL.W	#8,D0 		* Move left 8 bits
			ASL.W	#4,D0 		* Move left 4 bits
			OR.W	D0,D7 		* Load the bits into D7
			MOVE.B	(A1)+,D0 	* Get the next byte
			ANDI.W	#MASK,D0 	* Isolate the byte
			JSR		STRIP_ASCII * Get rid of the ASCII code
			ASL.W	#8,D0 		* Move left 8 bits
			OR.W	D0,D7 		* Add the next hex digit
			MOVE.B	(A1)+,D0	* Get the next byte
			ANDI.W	#MASK,D0 	* Isolate the byte
			JSR		STRIP_ASCII * Get rid of the ASCII code
			ASL.W	#4,D0 		* Move left 4 bits
			OR.W	D0,D7 		* Add the next hex digit
			MOVE.B	(A1)+,D0 	* Get next byte, point to con_val
			ANDI.W	#MASK,D0 	* Isolate the byte
			JSR		STRIP_ASCII * Get rid of the ASCII code
			OR.W	D0,D7 		* Add the last hex digit
			MOVE.W	D7,(A1)+ 	* Save the converted value
			RTS
		
STRIP_ASCII	CMP.B	#$39,D0		* if it's 0-9
			BLE		MINUS30		* goto subtract 30
			CMP.B	#$46,D0		* if it's an A-F
			BLE		MINUS37		* goto subtract 37
			SUB.B	#$57,D0		* else it's a...f, subtract 57
			BRA		SA_RETURN	* return from strip_ascii
MINUS37		SUB.B	#$37,D0		* subtract 37
			BRA		SA_RETURN	* return from strip_ascii
MINUS30 	SUB.B	#$30,D0		* subtract 30
			BRA		SA_RETURN	* return from strip_ascii
SA_RETURN	RTS

* Data 
con_val		DS.W	1			* Save it here

MESSAGE		DC.B	'Please enter 4-hex starting address:',0
MESSAGEA	DC.B	'Please enter 4-hex ending address:',0
			END		$1000

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
