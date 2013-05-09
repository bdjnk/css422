;-----------------------------------------------------------
; Title      : Dissassembler Test Data
; Written by : Joe Pennington, Michael Plotke, Jacky Wong
; Date       :
; Description:
;
; HERE IS WHAT WE NEED TO TEST
;
; Effective Addressing Modes:
; Dn		Data Register Direct
; An		Address Register Direct
; (An)		Address Register Indirect
; (An)+		Address Register Indirect with Post incrementing
; -(An)		Address Register Indirect with Pre decrementing
; (xxx).W	Absolute Word Address
; (xxx).L	Absolute Long Address
; #<data>	Immediate Data
;
; Instructions:
;    MOVE, MOVEQ, MOVEA
;    ADD, ADDA, ADDI, ADDQ
;    SUB, SUBA, SUBI, SUBQ
;    LEA
;    AND, ANDI
;    EOR, EORI
;    ASL, ASR
;    LSL, LSR
;    CMP, CMPA, CMPI
;    Bcc (BEQ, BLS, BLT, BNE, BHI)
;    RTS
;-----------------------------------------------------------

START:	ORG		$1000		; first instruction

; tests for MOVE.B
; ...when source is Dn
		MOVE.B		Dn,Dn
		MOVE.B		Dn,(An)
		MOVE.B		Dn,(An)+
		MOVE.B		Dn,-(An)
		MOVE.B		Dn,$
		MOVE.B		Dn,$
; ...when source is (An)
		MOVE.B		(An),Dn
		MOVE.B		(An),(An)
		MOVE.B		(An),(An)+
		MOVE.B		(An),-(An)
		MOVE.B		(An),$
		MOVE.B		(An),$
; ...when source is (An)+
		MOVE.B		(An)+,Dn
		MOVE.B		(An)+,(An)
		MOVE.B		(An)+,(An)+
		MOVE.B		(An)+,(An)
		MOVE.B		(An)+,$
		MOVE.B		(An)+,$
; ...when source is -(An)
		MOVE.B		-(An),Dn
		MOVE.B		-(An),(An)
		MOVE.B		-(An),(An)+
		MOVE.B		-(An),-(An)
		MOVE.B		-(An),$
		MOVE.B		-(An),$
; ...when source is (xxx).W
		MOVE.B		$,Dn
		MOVE.B		$,(An)
		MOVE.B		$,(An)+
		MOVE.B		$,-(An)
		MOVE.B		$,$
		MOVE.B		$,$
; ...when source is (xxx).L
		MOVE.B		$,Dn
		MOVE.B		$,(An)
		MOVE.B		$,(An)+
		MOVE.B		$,-(An)
		MOVE.B		$,$
		MOVE.B		$,$
; ...when source is #<data>
		MOVE.B		#$,Dn
		MOVE.B		#$,(An)
		MOVE.B		#$,(An)+
		MOVE.B		#$,-(An)
		MOVE.B		#$,$
		MOVE.B		#$,$

; tests for MOVE.W
; ...when source is Dn
		MOVE.W		Dn,Dn
		MOVE.W		Dn,(An)
		MOVE.W		Dn,(An)+
		MOVE.W		Dn,-(An)
		MOVE.W		Dn,$
		MOVE.W		Dn,$
; ...when source is (An)
		MOVE.W		(An),Dn
		MOVE.W		(An),(An)
		MOVE.W		(An),(An)+
		MOVE.W		(An),-(An)
		MOVE.W		(An),$
		MOVE.W		(An),$
; ...when source is (An)+
		MOVE.W		(An)+,Dn
		MOVE.W		(An)+,(An)
		MOVE.W		(An)+,(An)+
		MOVE.W		(An)+,-(An)
		MOVE.W		(An)+,
		MOVE.W		(An)+,
; ...when source is -(An)
		MOVE.W		-(An),Dn
		MOVE.W		-(An),(An)
		MOVE.W		-(An),(An)+
		MOVE.W		-(An),-(An)
		MOVE.W		-(An),$
		MOVE.W		-(An),$
; ...when source is (xxx).W
		MOVE.W		$,Dn
		MOVE.W		$,(An)
		MOVE.W		$,(An)+
		MOVE.W		$,-(An)
		MOVE.W		$,$
		MOVE.W		$,$
; ...when source is (xxx).L
		MOVE.W		$,Dn
		MOVE.W		$,(An)
		MOVE.W		$,(An)+
		MOVE.W		$,-(An)
		MOVE.W		$,$
		MOVE.W		$,$
; ...when source is #<data>
		MOVE.W		#$,Dn
		MOVE.W		#$,(An)
		MOVE.W		#$,(An)+
		MOVE.W		#$,-(An)
		MOVE.W		#$,$
		MOVE.W		#$,$

; tests for MOVE.L
; ...when source is Dn
		MOVE.L		Dn,Dn
		MOVE.L		Dn,(An)
		MOVE.L		Dn,(An)+
		MOVE.L		Dn,-(An)
		MOVE.L		Dn,$
		MOVE.L		Dn,$
; ...when source is (An)
		MOVE.L		(An),Dn
		MOVE.L		(An),(An)
		MOVE.L		(An),(An)+
		MOVE.L		(An),-(An)
		MOVE.L		(An),$
		MOVE.L		(An),$
; ...when source is (An)+
		MOVE.L		(An)+,Dn
		MOVE.L		(An)+,(An)
		MOVE.L		(An)+,(An)+
		MOVE.L		(An)+,-(An)
		MOVE.L		(An)+,$
		MOVE.L		(An)+,$
; ...when source is -(An)
		MOVE.L		-(An),Dn
		MOVE.L		-(An),(An)
		MOVE.L		-(An),(An)+
		MOVE.L		-(An),-(An)
		MOVE.L		-(An),$
		MOVE.L		-(An),$
; ...when source is (xxx).W
		MOVE.L		$,Dn
		MOVE.L		$,(An)
		MOVE.L		$,(An)+
		MOVE.L		$,-(An)
		MOVE.L		$,$
		MOVE.L		$,$
; ...when source is (xxx).L
		MOVE.L		$,Dn
		MOVE.L		$,(An)
		MOVE.L		$,(An)+
		MOVE.L		$,-(An)
		MOVE.L		$,$
		MOVE.L		$,$
; ...when source is #<data>
		MOVE.L		#$,Dn
		MOVE.L		#$,(An)
		MOVE.L		#$,(An)+
		MOVE.L		#$,-(An)
		MOVE.L		#$,$
		MOVE.L		#$,$

		MOVE.B	#9,D0		; set task 9:
		TRAP	#15			; terminate program
		
		SIMHALT				; halt simulator
		
		END		START		; last line of source

;~Font name~Courier New~
;~Font size~10~
;~Tab type~1~
;~Tab size~4~
