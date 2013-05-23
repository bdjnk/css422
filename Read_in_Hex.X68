******************************************************
* Get_value
* Converts 4 ASCII values to a 4-digit hex number
* Input Parameters: None
* Assumptions: The buffer, ascii_val contains 4 valid ascii 
* characters in the range of 0...9, A...F, or a...f
******************************************************
*System equates

mask EQU $00FF * Isolates the byte value
stack EQU $B000 * Location of stack pointer

* Program starts here
		ORG $0400 			* Program runs here
start 	LEA stack,SP 		* Set-up the stack pointer 
		MOVE.W #2,D0		* TRAP #2
		TRAP #15			* Get Value
		CLR.W D7 			* We'll need this register
		MOVE.B (A1)+,D0 	* Get the first byte 
		ANDI.W #mask,D0 	* Isolate the byte
		jsr strip_ascii 	* Get rid of the ascii code
		ASL.W #8,D0 		* Move left 8 bits
		ASL.W #4,D0 		* Move left 4 bits
		OR.W D0,D7 			* Load the bits into D7
		MOVE.B (A1)+,D0 	* Get the next byte
		ANDI.W #mask,D0 	* Isolate the byte
		jsr strip_ascii 	* Get rid of the ASCII code
		ASL.W #8,D0 		* Move left 8 bits
		OR.W D0,D7 			* Add the next hex digit
		MOVE.B (A1)+,D0		* Get the next byte
		ANDI.W #mask,D0 	* Isolate the byte
		jsr strip_ascii 	* Get rid of the ASCII code
		ASL.W #4,D0 		* Move left 4 bits
		OR.W D0,D7 			* Add the next hex digit
		MOVE.B (A1)+,D0 	* Get next byte, point to con_val
		ANDI.W #mask,D0 	* Isolate the byte
		jsr strip_ascii 	* Get rid of the ASCII code
		OR.W D0,D7 			* Add the last hex digit
		MOVE.W D7,(A1)+ 	* Save the converted value
		STOP #$2700 		* Return to the simulator
		
strip_ascii CMP.B #$39,D0 	* Is it in range of 0-9?
			BLE sub30		* It's a number
			CMP.B #$46,D0 	* Is is A...F?
			BLE sub37 		* It's A...F
			SUB.B #$57,D0 	* It's a...f
			BRA ret_sa 		* Go back
sub37 		SUB.B #$37,D0 	* Strip 37
			BRA ret_sa 		* Go back
sub30 		SUB.B #$30,D0 	* Strip 30
ret_sa 		RTS 			* Go back
* Data 

con_val 	DS.W 1 				* Save it here
			END $400

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
