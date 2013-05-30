*-----------------------------------------------------------
* Title      : Tests
* Written by : Michael Plotke
* Date       : 
* Description: Various functionality tests
*-----------------------------------------------------------

START:	ORG			$1000		; first instruction
	
		MOVE.B		#$18,$00007000
		MOVE.W		#$0770,$00007002
		MOVE.L		#$0B640000,$00007004
		
		BSR			RESET
		MOVE.L		#$0B640000,(A0)
		MOVE.L		#$0B640000,(A1)+
		MOVE.L		#$0B640000,-(A0)

		MOVE.B		#9,D0		; set task 9:
		TRAP		#15			; terminate program
		
		SIMHALT					; halt simulator
		
RESET	MOVEA.W		#$7018,A0	; staging address 1
		MOVEA.W		#$7010,A1	; staging address 2
		RTS
		
		END			START		; last line of source
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
