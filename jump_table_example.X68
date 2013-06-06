*****************************************
* Example of using a jump table to decode an instruction
*
****************************************

* System equates
stack		EQU		$A000
example		EQU		%0000111001100001	* I made up bits 0 to 11
shift		EQU		12					* Shift 12 bits

* Program starts here
			ORG     $400
				 
start		LEA		stack,SP			* Load the SP
			LEA		jmp_table,A0		* Index into the table
			CLR.L	D0					* Zero it
			MOVE.W	#example,D0			* We'll play with it here
			MOVE.B	#shift,D1			* Shift 12 bits to the right  
			LSR.W	D1,D0				* Move the bits

* Consider the next instruction. Why do we have to multiply the index 
* by 6? How many bytes does a single jump table entry require?

			MULU	#6,D0				* Form offset
			JSR		00(A0,D0)			* Jump indirect with index

jmp_table	JMP		code0000
			JMP		code0001
			JMP		code0010
			JMP		code0011
			JMP		code0100
			JMP		code0101
			JMP		code0110
			JMP		code0111
			JMP		code1000
			JMP		code1001
			JMP		code1010
			JMP		code1011
			JMP		code1100
			JMP		code1101
			JMP		code1110
			JMP		code1111

* The following subroutines will get filled in as you decode the
* instructions. For now, just exit gracefully.

code0000	STOP	#$2700
code0001	STOP	#$2700
code0010	STOP	#$2700
code0011	STOP	#$2700
code0100	STOP	#$2700
code0101	STOP	#$2700
code0110	STOP	#$2700
code0111	STOP	#$2700
code1000	STOP	#$2700
code1001	STOP	#$2700
code1010	STOP	#$2700

* Next we put in the next level of decoding. I just stuck this BRA
* instruction here so it would look different. If this was your real
* code, you would decode to the next level. Perhaps this would be
* another jump table to the 8 possible op-codes at the next level.

code1011	BRA		code1011

code1100	STOP	#$2700
code1101	STOP	#$2700
code1110	STOP	#$2700
code1111	STOP	#$2700

			END		$400 

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
