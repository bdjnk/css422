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
; -(An)		Address Register Indirect with Post incrementing
; (An)+		Address Register Indirect with Pre decrementing
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

START:	ORG			$1000		; first instruction

		MOVEA.W		#$7004,A0	; staging address

; tests for MOVE.B
; ...when source is #<data>, sets the data for later MOVEs
		MOVE.B		#$12,D0
		MOVE.B		#$24,(A0)
		MOVE.B		#$36,-(A0)
		MOVE.B		#$48,(A0)+
		MOVE.B		#$5A,$7010
		MOVE.B		#$6C,$00007014
; ...when source is Dn
		MOVE.B		D0,D1
		MOVE.B		D0,(A0)
		MOVE.B		D0,-(A0)
		MOVE.B		D0,(A0)+
		MOVE.B		D0,$7010
		MOVE.B		D0,$00007014
; ...when source is (An)
		MOVE.B		(A0),D0
		MOVE.B		(A1),(A2)
		MOVE.B		(A2),-(A3)
		MOVE.B		(A3),(A4)+
		MOVE.B		(A4),$7010
		MOVE.B		(A5),$00007014
; ...when source is -(An)
		MOVE.B		-(A1),D0
		MOVE.B		-(A2),(A1)
		MOVE.B		-(A3),-(A2)
		MOVE.B		-(A4),(A3)
		MOVE.B		-(A5),$7010
		MOVE.B		-(A6),$00007014
; ...when source is (An)+
		MOVE.B		(A1)+,D0
		MOVE.B		(A2)+,(A1)
		MOVE.B		(A3)+,-(A2)
		MOVE.B		(A4)+,(A3)+
		MOVE.B		(A5)+,$7010
		MOVE.B		(A6)+,$00007014
; ...when source is (xxx).W
		MOVE.B		$1234,D0
		MOVE.B		$2345,(A1)
		MOVE.B		$3456,-(A2)
		MOVE.B		$4567,(A3)+
		MOVE.B		$5678,$7010
		MOVE.B		$7890,$00007014
; ...when source is (xxx).L
		MOVE.B		$12345678,D0
		MOVE.B		$12345678,(An)
		MOVE.B		$12345678,-(An)
		MOVE.B		$12345678,(An)+
		MOVE.B		$12345678,$7010
		MOVE.B		$12345678,$00007014

; tests for MOVE.W
; ...when source is #<data>, sets the data for later MOVEs
		MOVE.W		#$1234,D0
		MOVE.W		#$2456,(A0)
		MOVE.W		#$3678,-(A0)
		MOVE.W		#$4890,(A0)+
		MOVE.W		#$5ABC,$7010
		MOVE.W		#$6CDE,$00007014
; ...when source is Dn
		MOVE.W		D0,D1
		MOVE.W		D0,(A0)
		MOVE.W		D0,-(A0)
		MOVE.W		D0,(A0)+
		MOVE.W		D0,$7010
		MOVE.W		D0,$00007014
; ...when source is (An)
		MOVE.W		(A0),D0
		MOVE.W		(A1),(A2)
		MOVE.W		(A2),-(A3)
		MOVE.W		(A3),(A4)+
		MOVE.W		(A4),$7010
		MOVE.W		(A5),$00007014
; ...when source is -(An)
		MOVE.W		-(A1),D0
		MOVE.W		-(A2),(A1)
		MOVE.W		-(A3),-(A2)
		MOVE.W		-(A4),(A3)
		MOVE.W		-(A5),$7010
		MOVE.W		-(A6),$00007014
; ...when source is (An)+
		MOVE.W		(A1)+,D0
		MOVE.W		(A2)+,(A1)
		MOVE.W		(A3)+,-(A2)
		MOVE.W		(A4)+,(A3)+
		MOVE.W		(A5)+,$7010
		MOVE.W		(A6)+,$00007014
; ...when source is (xxx).W
		MOVE.W		$1234,D0
		MOVE.W		$2345,(A1)
		MOVE.W		$3456,-(A2)
		MOVE.W		$4567,(A3)+
		MOVE.W		$5678,$7010
		MOVE.W		$7890,$00007014
; ...when source is (xxx).L
		MOVE.W		$12345678,D0
		MOVE.W		$12345678,(An)
		MOVE.W		$12345678,-(An)
		MOVE.W		$12345678,(An)+
		MOVE.W		$12345678,$7010
		MOVE.W		$12345678,$00007014
		
; tests for MOVE.L
; ...when source is #<data>, sets the data for later MOVEs
		MOVE.L		#$12345678,D0
		MOVE.L		#$12345678,(A0)
		MOVE.L		#$12345678,-(A0)
		MOVE.L		#$12345678,(A0)+
		MOVE.L		#$12345678,$7010
		MOVE.L		#$12345678,$00007014
; ...when source is Dn
		MOVE.L		D0,D1
		MOVE.L		D0,(A0)
		MOVE.L		D0,-(A0)
		MOVE.L		D0,(A0)+
		MOVE.L		D0,$7010
		MOVE.L		D0,$00007014
; ...when source is (An)
		MOVE.L		(A0),D0
		MOVE.L		(A1),(A2)
		MOVE.L		(A2),-(A3)
		MOVE.L		(A3),(A4)+
		MOVE.L		(A4),$7010
		MOVE.L		(A5),$00007014
; ...when source is -(An)
		MOVE.L		-(A1),D0
		MOVE.L		-(A2),(A1)
		MOVE.L		-(A3),-(A2)
		MOVE.L		-(A4),(A3)
		MOVE.L		-(A5),$7010
		MOVE.L		-(A6),$00007014
; ...when source is (An)+
		MOVE.L		(A1)+,D0
		MOVE.L		(A2)+,(A1)
		MOVE.L		(A3)+,-(A2)
		MOVE.L		(A4)+,(A3)+
		MOVE.L		(A5)+,$7010
		MOVE.L		(A6)+,$00007014
; ...when source is (xxx).W
		MOVE.L		$1234,D0
		MOVE.L		$2345,(A1)
		MOVE.L		$3456,-(A2)
		MOVE.L		$4567,(A3)+
		MOVE.L		$5678,$7010
		MOVE.L		$7890,$00007014
; ...when source is (xxx).L
		MOVE.L		$12345678,D0
		MOVE.L		$12345678,(An)
		MOVE.L		$12345678,-(An)
		MOVE.L		$12345678,(An)+
		MOVE.L		$12345678,$7010
		MOVE.L		$12345678,$00007014
		
; tests for MOVEQ.B
; ...when source is #<data>, sets the data for later MOVEQs
		MOVEQ.B		#$12,D0
		MOVEQ.B		#$24,(A0)
		MOVEQ.B		#$36,-(A0)
		MOVEQ.B		#$48,(A0)+
		MOVEQ.B		#$5A,$7010
		MOVEQ.B		#$6C,$00007014
; ...when source is Dn
		MOVEQ.B		D0,D1
		MOVEQ.B		D0,(A0)
		MOVEQ.B		D0,-(A0)
		MOVEQ.B		D0,(A0)+
		MOVEQ.B		D0,$7010
		MOVEQ.B		D0,$00007014
; ...when source is (An)
		MOVEQ.B		(A0),D0
		MOVEQ.B		(A1),(A2)
		MOVEQ.B		(A2),-(A3)
		MOVEQ.B		(A3),(A4)+
		MOVEQ.B		(A4),$7010
		MOVEQ.B		(A5),$00007014
; ...when source is -(An)
		MOVEQ.B		-(A1),D0
		MOVEQ.B		-(A2),(A1)
		MOVEQ.B		-(A3),-(A2)
		MOVEQ.B		-(A4),(A3)
		MOVEQ.B		-(A5),$7010
		MOVEQ.B		-(A6),$00007014
; ...when source is (An)+
		MOVEQ.B		(A1)+,D0
		MOVEQ.B		(A2)+,(A1)
		MOVEQ.B		(A3)+,-(A2)
		MOVEQ.B		(A4)+,(A3)+
		MOVEQ.B		(A5)+,$7010
		MOVEQ.B		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEQ.B		$1234,D0
		MOVEQ.B		$2345,(A1)
		MOVEQ.B		$3456,-(A2)
		MOVEQ.B		$4567,(A3)+
		MOVEQ.B		$5678,$7010
		MOVEQ.B		$7890,$00007014
; ...when source is (xxx).L
		MOVEQ.B		$12345678,D0
		MOVEQ.B		$12345678,(An)
		MOVEQ.B		$12345678,-(An)
		MOVEQ.B		$12345678,(An)+
		MOVEQ.B		$12345678,$7010
		MOVEQ.B		$12345678,$00007014

; tests for MOVEQ.W
; ...when source is #<data>, sets the data for later MOVEQs
		MOVEQ.W		#$1234,D0
		MOVEQ.W		#$2456,(A0)
		MOVEQ.W		#$3678,-(A0)
		MOVEQ.W		#$4890,(A0)+
		MOVEQ.W		#$5ABC,$7010
		MOVEQ.W		#$6CDE,$00007014
; ...when source is Dn
		MOVEQ.W		D0,D1
		MOVEQ.W		D0,(A0)
		MOVEQ.W		D0,-(A0)
		MOVEQ.W		D0,(A0)+
		MOVEQ.W		D0,$7010
		MOVEQ.W		D0,$00007014
; ...when source is (An)
		MOVEQ.W		(A0),D0
		MOVEQ.W		(A1),(A2)
		MOVEQ.W		(A2),-(A3)
		MOVEQ.W		(A3),(A4)+
		MOVEQ.W		(A4),$7010
		MOVEQ.W		(A5),$00007014
; ...when source is -(An)
		MOVEQ.W		-(A1),D0
		MOVEQ.W		-(A2),(A1)
		MOVEQ.W		-(A3),-(A2)
		MOVEQ.W		-(A4),(A3)
		MOVEQ.W		-(A5),$7010
		MOVEQ.W		-(A6),$00007014
; ...when source is (An)+
		MOVEQ.W		(A1)+,D0
		MOVEQ.W		(A2)+,(A1)
		MOVEQ.W		(A3)+,-(A2)
		MOVEQ.W		(A4)+,(A3)+
		MOVEQ.W		(A5)+,$7010
		MOVEQ.W		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEQ.W		$1234,D0
		MOVEQ.W		$2345,(A1)
		MOVEQ.W		$3456,-(A2)
		MOVEQ.W		$4567,(A3)+
		MOVEQ.W		$5678,$7010
		MOVEQ.W		$7890,$00007014
; ...when source is (xxx).L
		MOVEQ.W		$12345678,D0
		MOVEQ.W		$12345678,(An)
		MOVEQ.W		$12345678,-(An)
		MOVEQ.W		$12345678,(An)+
		MOVEQ.W		$12345678,$7010
		MOVEQ.W		$12345678,$00007014
		
; tests for MOVEQ.L
; ...when source is #<data>, sets the data for later MOVEQs
		MOVEQ.L		#$12345678,D0
		MOVEQ.L		#$12345678,(A0)
		MOVEQ.L		#$12345678,-(A0)
		MOVEQ.L		#$12345678,(A0)+
		MOVEQ.L		#$12345678,$7010
		MOVEQ.L		#$12345678,$00007014
; ...when source is Dn
		MOVEQ.L		D0,D1
		MOVEQ.L		D0,(A0)
		MOVEQ.L		D0,-(A0)
		MOVEQ.L		D0,(A0)+
		MOVEQ.L		D0,$7010
		MOVEQ.L		D0,$00007014
; ...when source is (An)
		MOVEQ.L		(A0),D0
		MOVEQ.L		(A1),(A2)
		MOVEQ.L		(A2),-(A3)
		MOVEQ.L		(A3),(A4)+
		MOVEQ.L		(A4),$7010
		MOVEQ.L		(A5),$00007014
; ...when source is -(An)
		MOVEQ.L		-(A1),D0
		MOVEQ.L		-(A2),(A1)
		MOVEQ.L		-(A3),-(A2)
		MOVEQ.L		-(A4),(A3)
		MOVEQ.L		-(A5),$7010
		MOVEQ.L		-(A6),$00007014
; ...when source is (An)+
		MOVEQ.L		(A1)+,D0
		MOVEQ.L		(A2)+,(A1)
		MOVEQ.L		(A3)+,-(A2)
		MOVEQ.L		(A4)+,(A3)+
		MOVEQ.L		(A5)+,$7010
		MOVEQ.L		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEQ.L		$1234,D0
		MOVEQ.L		$2345,(A1)
		MOVEQ.L		$3456,-(A2)
		MOVEQ.L		$4567,(A3)+
		MOVEQ.L		$5678,$7010
		MOVEQ.L		$7890,$00007014
; ...when source is (xxx).L
		MOVEQ.L		$12345678,D0
		MOVEQ.L		$12345678,(An)
		MOVEQ.L		$12345678,-(An)
		MOVEQ.L		$12345678,(An)+
		MOVEQ.L		$12345678,$7010
		MOVEQ.L		$12345678,$00007014
		
; tests for MOVE.B
; ...when source is #<data>, sets the data for later MOVEAs
		MOVEA.B		#$12,D0
		MOVEA.B		#$24,(A0)
		MOVEA.B		#$36,-(A0)
		MOVEA.B		#$48,(A0)+
		MOVEA.B		#$5A,$7010
		MOVEA.B		#$6C,$00007014
; ...when source is Dn
		MOVEA.B		D0,D1
		MOVEA.B		D0,(A0)
		MOVEA.B		D0,-(A0)
		MOVEA.B		D0,(A0)+
		MOVEA.B		D0,$7010
		MOVEA.B		D0,$00007014
; ...when source is (An)
		MOVEA.B		(A0),D0
		MOVEA.B		(A1),(A2)
		MOVEA.B		(A2),-(A3)
		MOVEA.B		(A3),(A4)+
		MOVEA.B		(A4),$7010
		MOVEA.B		(A5),$00007014
; ...when source is -(An)
		MOVEA.B		-(A1),D0
		MOVEA.B		-(A2),(A1)
		MOVEA.B		-(A3),-(A2)
		MOVEA.B		-(A4),(A3)
		MOVEA.B		-(A5),$7010
		MOVEA.B		-(A6),$00007014
; ...when source is (An)+
		MOVEA.B		(A1)+,D0
		MOVEA.B		(A2)+,(A1)
		MOVEA.B		(A3)+,-(A2)
		MOVEA.B		(A4)+,(A3)+
		MOVEA.B		(A5)+,$7010
		MOVEA.B		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEA.B		$1234,D0
		MOVEA.B		$2345,(A1)
		MOVEA.B		$3456,-(A2)
		MOVEA.B		$4567,(A3)+
		MOVEA.B		$5678,$7010
		MOVEA.B		$7890,$00007014
; ...when source is (xxx).L
		MOVEA.B		$12345678,D0
		MOVEA.B		$12345678,(An)
		MOVEA.B		$12345678,-(An)
		MOVEA.B		$12345678,(An)+
		MOVEA.B		$12345678,$7010
		MOVEA.B		$12345678,$00007014

; tests for MOVEA.W
; ...when source is #<data>, sets the data for later MOVEAs
		MOVEA.W		#$1234,D0
		MOVEA.W		#$2456,(A0)
		MOVEA.W		#$3678,-(A0)
		MOVEA.W		#$4890,(A0)+
		MOVEA.W		#$5ABC,$7010
		MOVEA.W		#$6CDE,$00007014
; ...when source is Dn
		MOVEA.W		D0,D1
		MOVEA.W		D0,(A0)
		MOVEA.W		D0,-(A0)
		MOVEA.W		D0,(A0)+
		MOVEA.W		D0,$7010
		MOVEA.W		D0,$00007014
; ...when source is (An)
		MOVEA.W		(A0),D0
		MOVEA.W		(A1),(A2)
		MOVEA.W		(A2),-(A3)
		MOVEA.W		(A3),(A4)+
		MOVEA.W		(A4),$7010
		MOVEA.W		(A5),$00007014
; ...when source is -(An)
		MOVEA.W		-(A1),D0
		MOVEA.W		-(A2),(A1)
		MOVEA.W		-(A3),-(A2)
		MOVEA.W		-(A4),(A3)
		MOVEA.W		-(A5),$7010
		MOVEA.W		-(A6),$00007014
; ...when source is (An)+
		MOVEA.W		(A1)+,D0
		MOVEA.W		(A2)+,(A1)
		MOVEA.W		(A3)+,-(A2)
		MOVEA.W		(A4)+,(A3)+
		MOVEA.W		(A5)+,$7010
		MOVEA.W		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEA.W		$1234,D0
		MOVEA.W		$2345,(A1)
		MOVEA.W		$3456,-(A2)
		MOVEA.W		$4567,(A3)+
		MOVEA.W		$5678,$7010
		MOVEA.W		$7890,$00007014
; ...when source is (xxx).L
		MOVEA.W		$12345678,D0
		MOVEA.W		$12345678,(An)
		MOVEA.W		$12345678,-(An)
		MOVEA.W		$12345678,(An)+
		MOVEA.W		$12345678,$7010
		MOVEA.W		$12345678,$00007014
		
; tests for MOVEA.L
; ...when source is #<data>, sets the data for later MOVEAs
		MOVEA.L		#$12345678,D0
		MOVEA.L		#$12345678,(A0)
		MOVEA.L		#$12345678,-(A0)
		MOVEA.L		#$12345678,(A0)+
		MOVEA.L		#$12345678,$7010
		MOVEA.L		#$12345678,$00007014
; ...when source is Dn
		MOVEA.L		D0,D1
		MOVEA.L		D0,(A0)
		MOVEA.L		D0,-(A0)
		MOVEA.L		D0,(A0)+
		MOVEA.L		D0,$7010
		MOVEA.L		D0,$00007014
; ...when source is (An)
		MOVEA.L		(A0),D0
		MOVEA.L		(A1),(A2)
		MOVEA.L		(A2),-(A3)
		MOVEA.L		(A3),(A4)+
		MOVEA.L		(A4),$7010
		MOVEA.L		(A5),$00007014
; ...when source is -(An)
		MOVEA.L		-(A1),D0
		MOVEA.L		-(A2),(A1)
		MOVEA.L		-(A3),-(A2)
		MOVEA.L		-(A4),(A3)
		MOVEA.L		-(A5),$7010
		MOVEA.L		-(A6),$00007014
; ...when source is (An)+
		MOVEA.L		(A1)+,D0
		MOVEA.L		(A2)+,(A1)
		MOVEA.L		(A3)+,-(A2)
		MOVEA.L		(A4)+,(A3)+
		MOVEA.L		(A5)+,$7010
		MOVEA.L		(A6)+,$00007014
; ...when source is (xxx).W
		MOVEA.L		$1234,D0
		MOVEA.L		$2345,(A1)
		MOVEA.L		$3456,-(A2)
		MOVEA.L		$4567,(A3)+
		MOVEA.L		$5678,$7010
		MOVEA.L		$7890,$00007014
; ...when source is (xxx).L
		MOVEA.L		$12345678,D0
		MOVEA.L		$12345678,(An)
		MOVEA.L		$12345678,-(An)
		MOVEA.L		$12345678,(An)+
		MOVEA.L		$12345678,$7010
		MOVEA.L		$12345678,$00007014
		



		MOVE.W	#9,D0		; set task 9:
		TRAP	#15			; terminate program
		
		SIMHALT				; halt simulator
		
		END		START		; last line of source

;~Font name~Courier New~
;~Font size~10~
;~Tab type~1~
;~Tab size~4~
