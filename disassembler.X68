*-----------------------------------------------------------
* Title      : Dissassembler
* Written by : Joe Pennington, Michael Plotke, Jacky Wong
* Date       :
* Description:
*-----------------------------------------------------------

START:	ORG		$1000		; first instruction

		MOVE.B	#9,D0		; set task 9:
		TRAP	#15			; terminate program
		
		SIMHALT				; halt simulator
		
		END		START		; last line of source
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
