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

START:	ORG			$7000		; first instruction

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
		
; tests for ADD.B
; ...when source is #<data>, sets the data for later ADDs
		ADD.B		#$12,D0
		ADD.B		#$24,(A0)
		ADD.B		#$36,-(A0)
		ADD.B		#$48,(A0)+
		ADD.B		#$5A,$7010
		ADD.B		#$6C,$00007014
; ...when source is Dn
		ADD.B		D0,D1
		ADD.B		D0,(A0)
		ADD.B		D0,-(A0)
		ADD.B		D0,(A0)+
		ADD.B		D0,$7010
		ADD.B		D0,$00007014
; ...when source is (An)
		ADD.B		(A0),D0
		ADD.B		(A1),(A2)
		ADD.B		(A2),-(A3)
		ADD.B		(A3),(A4)+
		ADD.B		(A4),$7010
		ADD.B		(A5),$00007014
; ...when source is -(An)
		ADD.B		-(A1),D0
		ADD.B		-(A2),(A1)
		ADD.B		-(A3),-(A2)
		ADD.B		-(A4),(A3)
		ADD.B		-(A5),$7010
		ADD.B		-(A6),$00007014
; ...when source is (An)+
		ADD.B		(A1)+,D0
		ADD.B		(A2)+,(A1)
		ADD.B		(A3)+,-(A2)
		ADD.B		(A4)+,(A3)+
		ADD.B		(A5)+,$7010
		ADD.B		(A6)+,$00007014
; ...when source is (xxx).W
		ADD.B		$1234,D0
		ADD.B		$2345,(A1)
		ADD.B		$3456,-(A2)
		ADD.B		$4567,(A3)+
		ADD.B		$5678,$7010
		ADD.B		$7890,$00007014
; ...when source is (xxx).L
		ADD.B		$12345678,D0
		ADD.B		$12345678,(An)
		ADD.B		$12345678,-(An)
		ADD.B		$12345678,(An)+
		ADD.B		$12345678,$7010
		ADD.B		$12345678,$00007014

; tests for ADD.W
; ...when source is #<data>, sets the data for later ADDs
		ADD.W		#$1234,D0
		ADD.W		#$2456,(A0)
		ADD.W		#$3678,-(A0)
		ADD.W		#$4890,(A0)+
		ADD.W		#$5ABC,$7010
		ADD.W		#$6CDE,$00007014
; ...when source is Dn
		ADD.W		D0,D1
		ADD.W		D0,(A0)
		ADD.W		D0,-(A0)
		ADD.W		D0,(A0)+
		ADD.W		D0,$7010
		ADD.W		D0,$00007014
; ...when source is (An)
		ADD.W		(A0),D0
		ADD.W		(A1),(A2)
		ADD.W		(A2),-(A3)
		ADD.W		(A3),(A4)+
		ADD.W		(A4),$7010
		ADD.W		(A5),$00007014
; ...when source is -(An)
		ADD.W		-(A1),D0
		ADD.W		-(A2),(A1)
		ADD.W		-(A3),-(A2)
		ADD.W		-(A4),(A3)
		ADD.W		-(A5),$7010
		ADD.W		-(A6),$00007014
; ...when source is (An)+
		ADD.W		(A1)+,D0
		ADD.W		(A2)+,(A1)
		ADD.W		(A3)+,-(A2)
		ADD.W		(A4)+,(A3)+
		ADD.W		(A5)+,$7010
		ADD.W		(A6)+,$00007014
; ...when source is (xxx).W
		ADD.W		$1234,D0
		ADD.W		$2345,(A1)
		ADD.W		$3456,-(A2)
		ADD.W		$4567,(A3)+
		ADD.W		$5678,$7010
		ADD.W		$7890,$00007014
; ...when source is (xxx).L
		ADD.W		$12345678,D0
		ADD.W		$12345678,(An)
		ADD.W		$12345678,-(An)
		ADD.W		$12345678,(An)+
		ADD.W		$12345678,$7010
		ADD.W		$12345678,$00007014
		
; tests for ADD.L
; ...when source is #<data>, sets the data for later ADDs
		ADD.L		#$12345678,D0
		ADD.L		#$12345678,(A0)
		ADD.L		#$12345678,-(A0)
		ADD.L		#$12345678,(A0)+
		ADD.L		#$12345678,$7010
		ADD.L		#$12345678,$00007014
; ...when source is Dn
		ADD.L		D0,D1
		ADD.L		D0,(A0)
		ADD.L		D0,-(A0)
		ADD.L		D0,(A0)+
		ADD.L		D0,$7010
		ADD.L		D0,$00007014
; ...when source is (An)
		ADD.L		(A0),D0
		ADD.L		(A1),(A2)
		ADD.L		(A2),-(A3)
		ADD.L		(A3),(A4)+
		ADD.L		(A4),$7010
		ADD.L		(A5),$00007014
; ...when source is -(An)
		ADD.L		-(A1),D0
		ADD.L		-(A2),(A1)
		ADD.L		-(A3),-(A2)
		ADD.L		-(A4),(A3)
		ADD.L		-(A5),$7010
		ADD.L		-(A6),$00007014
; ...when source is (An)+
		ADD.L		(A1)+,D0
		ADD.L		(A2)+,(A1)
		ADD.L		(A3)+,-(A2)
		ADD.L		(A4)+,(A3)+
		ADD.L		(A5)+,$7010
		ADD.L		(A6)+,$00007014
; ...when source is (xxx).W
		ADD.L		$1234,D0
		ADD.L		$2345,(A1)
		ADD.L		$3456,-(A2)
		ADD.L		$4567,(A3)+
		ADD.L		$5678,$7010
		ADD.L		$7890,$00007014
; ...when source is (xxx).L
		ADD.L		$12345678,D0
		ADD.L		$12345678,(An)
		ADD.L		$12345678,-(An)
		ADD.L		$12345678,(An)+
		ADD.L		$12345678,$7010
		ADD.L		$12345678,$00007014
		
; tests for ADDA.B
; ...when source is #<data>, sets the data for later ADDAs
		ADDA.B		#$12,D0
		ADDA.B		#$24,(A0)
		ADDA.B		#$36,-(A0)
		ADDA.B		#$48,(A0)+
		ADDA.B		#$5A,$7010
		ADDA.B		#$6C,$00007014
; ...when source is Dn
		ADDA.B		D0,D1
		ADDA.B		D0,(A0)
		ADDA.B		D0,-(A0)
		ADDA.B		D0,(A0)+
		ADDA.B		D0,$7010
		ADDA.B		D0,$00007014
; ...when source is (An)
		ADDA.B		(A0),D0
		ADDA.B		(A1),(A2)
		ADDA.B		(A2),-(A3)
		ADDA.B		(A3),(A4)+
		ADDA.B		(A4),$7010
		ADDA.B		(A5),$00007014
; ...when source is -(An)
		ADDA.B		-(A1),D0
		ADDA.B		-(A2),(A1)
		ADDA.B		-(A3),-(A2)
		ADDA.B		-(A4),(A3)
		ADDA.B		-(A5),$7010
		ADDA.B		-(A6),$00007014
; ...when source is (An)+
		ADDA.B		(A1)+,D0
		ADDA.B		(A2)+,(A1)
		ADDA.B		(A3)+,-(A2)
		ADDA.B		(A4)+,(A3)+
		ADDA.B		(A5)+,$7010
		ADDA.B		(A6)+,$00007014
; ...when source is (xxx).W
		ADDA.B		$1234,D0
		ADDA.B		$2345,(A1)
		ADDA.B		$3456,-(A2)
		ADDA.B		$4567,(A3)+
		ADDA.B		$5678,$7010
		ADDA.B		$7890,$00007014
; ...when source is (xxx).L
		ADDA.B		$12345678,D0
		ADDA.B		$12345678,(An)
		ADDA.B		$12345678,-(An)
		ADDA.B		$12345678,(An)+
		ADDA.B		$12345678,$7010
		ADDA.B		$12345678,$00007014

; tests for ADDA.W
; ...when source is #<data>, sets the data for later ADDAs
		ADDA.W		#$1234,D0
		ADDA.W		#$2456,(A0)
		ADDA.W		#$3678,-(A0)
		ADDA.W		#$4890,(A0)+
		ADDA.W		#$5ABC,$7010
		ADDA.W		#$6CDE,$00007014
; ...when source is Dn
		ADDA.W		D0,D1
		ADDA.W		D0,(A0)
		ADDA.W		D0,-(A0)
		ADDA.W		D0,(A0)+
		ADDA.W		D0,$7010
		ADDA.W		D0,$00007014
; ...when source is (An)
		ADDA.W		(A0),D0
		ADDA.W		(A1),(A2)
		ADDA.W		(A2),-(A3)
		ADDA.W		(A3),(A4)+
		ADDA.W		(A4),$7010
		ADDA.W		(A5),$00007014
; ...when source is -(An)
		ADDA.W		-(A1),D0
		ADDA.W		-(A2),(A1)
		ADDA.W		-(A3),-(A2)
		ADDA.W		-(A4),(A3)
		ADDA.W		-(A5),$7010
		ADDA.W		-(A6),$00007014
; ...when source is (An)+
		ADDA.W		(A1)+,D0
		ADDA.W		(A2)+,(A1)
		ADDA.W		(A3)+,-(A2)
		ADDA.W		(A4)+,(A3)+
		ADDA.W		(A5)+,$7010
		ADDA.W		(A6)+,$00007014
; ...when source is (xxx).W
		ADDA.W		$1234,D0
		ADDA.W		$2345,(A1)
		ADDA.W		$3456,-(A2)
		ADDA.W		$4567,(A3)+
		ADDA.W		$5678,$7010
		ADDA.W		$7890,$00007014
; ...when source is (xxx).L
		ADDA.W		$12345678,D0
		ADDA.W		$12345678,(An)
		ADDA.W		$12345678,-(An)
		ADDA.W		$12345678,(An)+
		ADDA.W		$12345678,$7010
		ADDA.W		$12345678,$00007014
		
; tests for ADDA.L
; ...when source is #<data>, sets the data for later ADDAs
		ADDA.L		#$12345678,D0
		ADDA.L		#$12345678,(A0)
		ADDA.L		#$12345678,-(A0)
		ADDA.L		#$12345678,(A0)+
		ADDA.L		#$12345678,$7010
		ADDA.L		#$12345678,$00007014
; ...when source is Dn
		ADDA.L		D0,D1
		ADDA.L		D0,(A0)
		ADDA.L		D0,-(A0)
		ADDA.L		D0,(A0)+
		ADDA.L		D0,$7010
		ADDA.L		D0,$00007014
; ...when source is (An)
		ADDA.L		(A0),D0
		ADDA.L		(A1),(A2)
		ADDA.L		(A2),-(A3)
		ADDA.L		(A3),(A4)+
		ADDA.L		(A4),$7010
		ADDA.L		(A5),$00007014
; ...when source is -(An)
		ADDA.L		-(A1),D0
		ADDA.L		-(A2),(A1)
		ADDA.L		-(A3),-(A2)
		ADDA.L		-(A4),(A3)
		ADDA.L		-(A5),$7010
		ADDA.L		-(A6),$00007014
; ...when source is (An)+
		ADDA.L		(A1)+,D0
		ADDA.L		(A2)+,(A1)
		ADDA.L		(A3)+,-(A2)
		ADDA.L		(A4)+,(A3)+
		ADDA.L		(A5)+,$7010
		ADDA.L		(A6)+,$00007014
; ...when source is (xxx).W
		ADDA.L		$1234,D0
		ADDA.L		$2345,(A1)
		ADDA.L		$3456,-(A2)
		ADDA.L		$4567,(A3)+
		ADDA.L		$5678,$7010
		ADDA.L		$7890,$00007014
; ...when source is (xxx).L
		ADDA.L		$12345678,D0
		ADDA.L		$12345678,(An)
		ADDA.L		$12345678,-(An)
		ADDA.L		$12345678,(An)+
		ADDA.L		$12345678,$7010
		ADDA.L		$12345678,$00007014

; tests for ADDI.B
; ...when source is #<data>, sets the data for later ADDIs
		ADDI.B		#$12,D0
		ADDI.B		#$24,(A0)
		ADDI.B		#$36,-(A0)
		ADDI.B		#$48,(A0)+
		ADDI.B		#$5A,$7010
		ADDI.B		#$6C,$00007014
; ...when source is Dn
		ADDI.B		D0,D1
		ADDI.B		D0,(A0)
		ADDI.B		D0,-(A0)
		ADDI.B		D0,(A0)+
		ADDI.B		D0,$7010
		ADDI.B		D0,$00007014
; ...when source is (An)
		ADDI.B		(A0),D0
		ADDI.B		(A1),(A2)
		ADDI.B		(A2),-(A3)
		ADDI.B		(A3),(A4)+
		ADDI.B		(A4),$7010
		ADDI.B		(A5),$00007014
; ...when source is -(An)
		ADDI.B		-(A1),D0
		ADDI.B		-(A2),(A1)
		ADDI.B		-(A3),-(A2)
		ADDI.B		-(A4),(A3)
		ADDI.B		-(A5),$7010
		ADDI.B		-(A6),$00007014
; ...when source is (An)+
		ADDI.B		(A1)+,D0
		ADDI.B		(A2)+,(A1)
		ADDI.B		(A3)+,-(A2)
		ADDI.B		(A4)+,(A3)+
		ADDI.B		(A5)+,$7010
		ADDI.B		(A6)+,$00007014
; ...when source is (xxx).W
		ADDI.B		$1234,D0
		ADDI.B		$2345,(A1)
		ADDI.B		$3456,-(A2)
		ADDI.B		$4567,(A3)+
		ADDI.B		$5678,$7010
		ADDI.B		$7890,$00007014
; ...when source is (xxx).L
		ADDI.B		$12345678,D0
		ADDI.B		$12345678,(An)
		ADDI.B		$12345678,-(An)
		ADDI.B		$12345678,(An)+
		ADDI.B		$12345678,$7010
		ADDI.B		$12345678,$00007014

; tests for ADDI.W
; ...when source is #<data>, sets the data for later ADDIs
		ADDI.W		#$1234,D0
		ADDI.W		#$2456,(A0)
		ADDI.W		#$3678,-(A0)
		ADDI.W		#$4890,(A0)+
		ADDI.W		#$5ABC,$7010
		ADDI.W		#$6CDE,$00007014
; ...when source is Dn
		ADDI.W		D0,D1
		ADDI.W		D0,(A0)
		ADDI.W		D0,-(A0)
		ADDI.W		D0,(A0)+
		ADDI.W		D0,$7010
		ADDI.W		D0,$00007014
; ...when source is (An)
		ADDI.W		(A0),D0
		ADDI.W		(A1),(A2)
		ADDI.W		(A2),-(A3)
		ADDI.W		(A3),(A4)+
		ADDI.W		(A4),$7010
		ADDI.W		(A5),$00007014
; ...when source is -(An)
		ADDI.W		-(A1),D0
		ADDI.W		-(A2),(A1)
		ADDI.W		-(A3),-(A2)
		ADDI.W		-(A4),(A3)
		ADDI.W		-(A5),$7010
		ADDI.W		-(A6),$00007014
; ...when source is (An)+
		ADDI.W		(A1)+,D0
		ADDI.W		(A2)+,(A1)
		ADDI.W		(A3)+,-(A2)
		ADDI.W		(A4)+,(A3)+
		ADDI.W		(A5)+,$7010
		ADDI.W		(A6)+,$00007014
; ...when source is (xxx).W
		ADDI.W		$1234,D0
		ADDI.W		$2345,(A1)
		ADDI.W		$3456,-(A2)
		ADDI.W		$4567,(A3)+
		ADDI.W		$5678,$7010
		ADDI.W		$7890,$00007014
; ...when source is (xxx).L
		ADDI.W		$12345678,D0
		ADDI.W		$12345678,(An)
		ADDI.W		$12345678,-(An)
		ADDI.W		$12345678,(An)+
		ADDI.W		$12345678,$7010
		ADDI.W		$12345678,$00007014
		
; tests for ADDI.L
; ...when source is #<data>, sets the data for later ADDIs
		ADDI.L		#$12345678,D0
		ADDI.L		#$12345678,(A0)
		ADDI.L		#$12345678,-(A0)
		ADDI.L		#$12345678,(A0)+
		ADDI.L		#$12345678,$7010
		ADDI.L		#$12345678,$00007014
; ...when source is Dn
		ADDI.L		D0,D1
		ADDI.L		D0,(A0)
		ADDI.L		D0,-(A0)
		ADDI.L		D0,(A0)+
		ADDI.L		D0,$7010
		ADDI.L		D0,$00007014
; ...when source is (An)
		ADDI.L		(A0),D0
		ADDI.L		(A1),(A2)
		ADDI.L		(A2),-(A3)
		ADDI.L		(A3),(A4)+
		ADDI.L		(A4),$7010
		ADDI.L		(A5),$00007014
; ...when source is -(An)
		ADDI.L		-(A1),D0
		ADDI.L		-(A2),(A1)
		ADDI.L		-(A3),-(A2)
		ADDI.L		-(A4),(A3)
		ADDI.L		-(A5),$7010
		ADDI.L		-(A6),$00007014
; ...when source is (An)+
		ADDI.L		(A1)+,D0
		ADDI.L		(A2)+,(A1)
		ADDI.L		(A3)+,-(A2)
		ADDI.L		(A4)+,(A3)+
		ADDI.L		(A5)+,$7010
		ADDI.L		(A6)+,$00007014
; ...when source is (xxx).W
		ADDI.L		$1234,D0
		ADDI.L		$2345,(A1)
		ADDI.L		$3456,-(A2)
		ADDI.L		$4567,(A3)+
		ADDI.L		$5678,$7010
		ADDI.L		$7890,$00007014
; ...when source is (xxx).L
		ADDI.L		$12345678,D0
		ADDI.L		$12345678,(An)
		ADDI.L		$12345678,-(An)
		ADDI.L		$12345678,(An)+
		ADDI.L		$12345678,$7010
		ADDI.L		$12345678,$00007014
		
; tests for ADDQ.B
; ...when source is #<data>, sets the data for later ADDQs
		ADDQ.B		#$12,D0
		ADDQ.B		#$24,(A0)
		ADDQ.B		#$36,-(A0)
		ADDQ.B		#$48,(A0)+
		ADDQ.B		#$5A,$7010
		ADDQ.B		#$6C,$00007014
; ...when source is Dn
		ADDQ.B		D0,D1
		ADDQ.B		D0,(A0)
		ADDQ.B		D0,-(A0)
		ADDQ.B		D0,(A0)+
		ADDQ.B		D0,$7010
		ADDQ.B		D0,$00007014
; ...when source is (An)
		ADDQ.B		(A0),D0
		ADDQ.B		(A1),(A2)
		ADDQ.B		(A2),-(A3)
		ADDQ.B		(A3),(A4)+
		ADDQ.B		(A4),$7010
		ADDQ.B		(A5),$00007014
; ...when source is -(An)
		ADDQ.B		-(A1),D0
		ADDQ.B		-(A2),(A1)
		ADDQ.B		-(A3),-(A2)
		ADDQ.B		-(A4),(A3)
		ADDQ.B		-(A5),$7010
		ADDQ.B		-(A6),$00007014
; ...when source is (An)+
		ADDQ.B		(A1)+,D0
		ADDQ.B		(A2)+,(A1)
		ADDQ.B		(A3)+,-(A2)
		ADDQ.B		(A4)+,(A3)+
		ADDQ.B		(A5)+,$7010
		ADDQ.B		(A6)+,$00007014
; ...when source is (xxx).W
		ADDQ.B		$1234,D0
		ADDQ.B		$2345,(A1)
		ADDQ.B		$3456,-(A2)
		ADDQ.B		$4567,(A3)+
		ADDQ.B		$5678,$7010
		ADDQ.B		$7890,$00007014
; ...when source is (xxx).L
		ADDQ.B		$12345678,D0
		ADDQ.B		$12345678,(An)
		ADDQ.B		$12345678,-(An)
		ADDQ.B		$12345678,(An)+
		ADDQ.B		$12345678,$7010
		ADDQ.B		$12345678,$00007014

; tests for ADDQ.W
; ...when source is #<data>, sets the data for later ADDQs
		ADDQ.W		#$1234,D0
		ADDQ.W		#$2456,(A0)
		ADDQ.W		#$3678,-(A0)
		ADDQ.W		#$4890,(A0)+
		ADDQ.W		#$5ABC,$7010
		ADDQ.W		#$6CDE,$00007014
; ...when source is Dn
		ADDQ.W		D0,D1
		ADDQ.W		D0,(A0)
		ADDQ.W		D0,-(A0)
		ADDQ.W		D0,(A0)+
		ADDQ.W		D0,$7010
		ADDQ.W		D0,$00007014
; ...when source is (An)
		ADDQ.W		(A0),D0
		ADDQ.W		(A1),(A2)
		ADDQ.W		(A2),-(A3)
		ADDQ.W		(A3),(A4)+
		ADDQ.W		(A4),$7010
		ADDQ.W		(A5),$00007014
; ...when source is -(An)
		ADDQ.W		-(A1),D0
		ADDQ.W		-(A2),(A1)
		ADDQ.W		-(A3),-(A2)
		ADDQ.W		-(A4),(A3)
		ADDQ.W		-(A5),$7010
		ADDQ.W		-(A6),$00007014
; ...when source is (An)+
		ADDQ.W		(A1)+,D0
		ADDQ.W		(A2)+,(A1)
		ADDQ.W		(A3)+,-(A2)
		ADDQ.W		(A4)+,(A3)+
		ADDQ.W		(A5)+,$7010
		ADDQ.W		(A6)+,$00007014
; ...when source is (xxx).W
		ADDQ.W		$1234,D0
		ADDQ.W		$2345,(A1)
		ADDQ.W		$3456,-(A2)
		ADDQ.W		$4567,(A3)+
		ADDQ.W		$5678,$7010
		ADDQ.W		$7890,$00007014
; ...when source is (xxx).L
		ADDQ.W		$12345678,D0
		ADDQ.W		$12345678,(An)
		ADDQ.W		$12345678,-(An)
		ADDQ.W		$12345678,(An)+
		ADDQ.W		$12345678,$7010
		ADDQ.W		$12345678,$00007014
		
; tests for ADDQ.L
; ...when source is #<data>, sets the data for later ADDQs
		ADDQ.L		#$12345678,D0
		ADDQ.L		#$12345678,(A0)
		ADDQ.L		#$12345678,-(A0)
		ADDQ.L		#$12345678,(A0)+
		ADDQ.L		#$12345678,$7010
		ADDQ.L		#$12345678,$00007014
; ...when source is Dn
		ADDQ.L		D0,D1
		ADDQ.L		D0,(A0)
		ADDQ.L		D0,-(A0)
		ADDQ.L		D0,(A0)+
		ADDQ.L		D0,$7010
		ADDQ.L		D0,$00007014
; ...when source is (An)
		ADDQ.L		(A0),D0
		ADDQ.L		(A1),(A2)
		ADDQ.L		(A2),-(A3)
		ADDQ.L		(A3),(A4)+
		ADDQ.L		(A4),$7010
		ADDQ.L		(A5),$00007014
; ...when source is -(An)
		ADDQ.L		-(A1),D0
		ADDQ.L		-(A2),(A1)
		ADDQ.L		-(A3),-(A2)
		ADDQ.L		-(A4),(A3)
		ADDQ.L		-(A5),$7010
		ADDQ.L		-(A6),$00007014
; ...when source is (An)+
		ADDQ.L		(A1)+,D0
		ADDQ.L		(A2)+,(A1)
		ADDQ.L		(A3)+,-(A2)
		ADDQ.L		(A4)+,(A3)+
		ADDQ.L		(A5)+,$7010
		ADDQ.L		(A6)+,$00007014
; ...when source is (xxx).W
		ADDQ.L		$1234,D0
		ADDQ.L		$2345,(A1)
		ADDQ.L		$3456,-(A2)
		ADDQ.L		$4567,(A3)+
		ADDQ.L		$5678,$7010
		ADDQ.L		$7890,$00007014
; ...when source is (xxx).L
		ADDQ.L		$12345678,D0
		ADDQ.L		$12345678,(An)
		ADDQ.L		$12345678,-(An)
		ADDQ.L		$12345678,(An)+
		ADDQ.L		$12345678,$7010
		ADDQ.L		$12345678,$00007014

; tests for SUB.B
; ...when source is #<data>, sets the data for later SUBs
		SUB.B		#$12,D0
		SUB.B		#$24,(A0)
		SUB.B		#$36,-(A0)
		SUB.B		#$48,(A0)+
		SUB.B		#$5A,$7010
		SUB.B		#$6C,$00007014
; ...when source is Dn
		SUB.B		D0,D1
		SUB.B		D0,(A0)
		SUB.B		D0,-(A0)
		SUB.B		D0,(A0)+
		SUB.B		D0,$7010
		SUB.B		D0,$00007014
; ...when source is (An)
		SUB.B		(A0),D0
		SUB.B		(A1),(A2)
		SUB.B		(A2),-(A3)
		SUB.B		(A3),(A4)+
		SUB.B		(A4),$7010
		SUB.B		(A5),$00007014
; ...when source is -(An)
		SUB.B		-(A1),D0
		SUB.B		-(A2),(A1)
		SUB.B		-(A3),-(A2)
		SUB.B		-(A4),(A3)
		SUB.B		-(A5),$7010
		SUB.B		-(A6),$00007014
; ...when source is (An)+
		SUB.B		(A1)+,D0
		SUB.B		(A2)+,(A1)
		SUB.B		(A3)+,-(A2)
		SUB.B		(A4)+,(A3)+
		SUB.B		(A5)+,$7010
		SUB.B		(A6)+,$00007014
; ...when source is (xxx).W
		SUB.B		$1234,D0
		SUB.B		$2345,(A1)
		SUB.B		$3456,-(A2)
		SUB.B		$4567,(A3)+
		SUB.B		$5678,$7010
		SUB.B		$7890,$00007014
; ...when source is (xxx).L
		SUB.B		$12345678,D0
		SUB.B		$12345678,(An)
		SUB.B		$12345678,-(An)
		SUB.B		$12345678,(An)+
		SUB.B		$12345678,$7010
		SUB.B		$12345678,$00007014

; tests for SUB.W
; ...when source is #<data>, sets the data for later SUBs
		SUB.W		#$1234,D0
		SUB.W		#$2456,(A0)
		SUB.W		#$3678,-(A0)
		SUB.W		#$4890,(A0)+
		SUB.W		#$5ABC,$7010
		SUB.W		#$6CDE,$00007014
; ...when source is Dn
		SUB.W		D0,D1
		SUB.W		D0,(A0)
		SUB.W		D0,-(A0)
		SUB.W		D0,(A0)+
		SUB.W		D0,$7010
		SUB.W		D0,$00007014
; ...when source is (An)
		SUB.W		(A0),D0
		SUB.W		(A1),(A2)
		SUB.W		(A2),-(A3)
		SUB.W		(A3),(A4)+
		SUB.W		(A4),$7010
		SUB.W		(A5),$00007014
; ...when source is -(An)
		SUB.W		-(A1),D0
		SUB.W		-(A2),(A1)
		SUB.W		-(A3),-(A2)
		SUB.W		-(A4),(A3)
		SUB.W		-(A5),$7010
		SUB.W		-(A6),$00007014
; ...when source is (An)+
		SUB.W		(A1)+,D0
		SUB.W		(A2)+,(A1)
		SUB.W		(A3)+,-(A2)
		SUB.W		(A4)+,(A3)+
		SUB.W		(A5)+,$7010
		SUB.W		(A6)+,$00007014
; ...when source is (xxx).W
		SUB.W		$1234,D0
		SUB.W		$2345,(A1)
		SUB.W		$3456,-(A2)
		SUB.W		$4567,(A3)+
		SUB.W		$5678,$7010
		SUB.W		$7890,$00007014
; ...when source is (xxx).L
		SUB.W		$12345678,D0
		SUB.W		$12345678,(An)
		SUB.W		$12345678,-(An)
		SUB.W		$12345678,(An)+
		SUB.W		$12345678,$7010
		SUB.W		$12345678,$00007014
		
; tests for SUB.L
; ...when source is #<data>, sets the data for later SUBs
		SUB.L		#$12345678,D0
		SUB.L		#$12345678,(A0)
		SUB.L		#$12345678,-(A0)
		SUB.L		#$12345678,(A0)+
		SUB.L		#$12345678,$7010
		SUB.L		#$12345678,$00007014
; ...when source is Dn
		SUB.L		D0,D1
		SUB.L		D0,(A0)
		SUB.L		D0,-(A0)
		SUB.L		D0,(A0)+
		SUB.L		D0,$7010
		SUB.L		D0,$00007014
; ...when source is (An)
		SUB.L		(A0),D0
		SUB.L		(A1),(A2)
		SUB.L		(A2),-(A3)
		SUB.L		(A3),(A4)+
		SUB.L		(A4),$7010
		SUB.L		(A5),$00007014
; ...when source is -(An)
		SUB.L		-(A1),D0
		SUB.L		-(A2),(A1)
		SUB.L		-(A3),-(A2)
		SUB.L		-(A4),(A3)
		SUB.L		-(A5),$7010
		SUB.L		-(A6),$00007014
; ...when source is (An)+
		SUB.L		(A1)+,D0
		SUB.L		(A2)+,(A1)
		SUB.L		(A3)+,-(A2)
		SUB.L		(A4)+,(A3)+
		SUB.L		(A5)+,$7010
		SUB.L		(A6)+,$00007014
; ...when source is (xxx).W
		SUB.L		$1234,D0
		SUB.L		$2345,(A1)
		SUB.L		$3456,-(A2)
		SUB.L		$4567,(A3)+
		SUB.L		$5678,$7010
		SUB.L		$7890,$00007014
; ...when source is (xxx).L
		SUB.L		$12345678,D0
		SUB.L		$12345678,(An)
		SUB.L		$12345678,-(An)
		SUB.L		$12345678,(An)+
		SUB.L		$12345678,$7010
		SUB.L		$12345678,$00007014
		
; tests for SUBA.B
; ...when source is #<data>, sets the data for later SUBAs
		SUBA.B		#$12,D0
		SUBA.B		#$24,(A0)
		SUBA.B		#$36,-(A0)
		SUBA.B		#$48,(A0)+
		SUBA.B		#$5A,$7010
		SUBA.B		#$6C,$00007014
; ...when source is Dn
		SUBA.B		D0,D1
		SUBA.B		D0,(A0)
		SUBA.B		D0,-(A0)
		SUBA.B		D0,(A0)+
		SUBA.B		D0,$7010
		SUBA.B		D0,$00007014
; ...when source is (An)
		SUBA.B		(A0),D0
		SUBA.B		(A1),(A2)
		SUBA.B		(A2),-(A3)
		SUBA.B		(A3),(A4)+
		SUBA.B		(A4),$7010
		SUBA.B		(A5),$00007014
; ...when source is -(An)
		SUBA.B		-(A1),D0
		SUBA.B		-(A2),(A1)
		SUBA.B		-(A3),-(A2)
		SUBA.B		-(A4),(A3)
		SUBA.B		-(A5),$7010
		SUBA.B		-(A6),$00007014
; ...when source is (An)+
		SUBA.B		(A1)+,D0
		SUBA.B		(A2)+,(A1)
		SUBA.B		(A3)+,-(A2)
		SUBA.B		(A4)+,(A3)+
		SUBA.B		(A5)+,$7010
		SUBA.B		(A6)+,$00007014
; ...when source is (xxx).W
		SUBA.B		$1234,D0
		SUBA.B		$2345,(A1)
		SUBA.B		$3456,-(A2)
		SUBA.B		$4567,(A3)+
		SUBA.B		$5678,$7010
		SUBA.B		$7890,$00007014
; ...when source is (xxx).L
		SUBA.B		$12345678,D0
		SUBA.B		$12345678,(An)
		SUBA.B		$12345678,-(An)
		SUBA.B		$12345678,(An)+
		SUBA.B		$12345678,$7010
		SUBA.B		$12345678,$00007014

; tests for SUBA.W
; ...when source is #<data>, sets the data for later SUBAs
		SUBA.W		#$1234,D0
		SUBA.W		#$2456,(A0)
		SUBA.W		#$3678,-(A0)
		SUBA.W		#$4890,(A0)+
		SUBA.W		#$5ABC,$7010
		SUBA.W		#$6CDE,$00007014
; ...when source is Dn
		SUBA.W		D0,D1
		SUBA.W		D0,(A0)
		SUBA.W		D0,-(A0)
		SUBA.W		D0,(A0)+
		SUBA.W		D0,$7010
		SUBA.W		D0,$00007014
; ...when source is (An)
		SUBA.W		(A0),D0
		SUBA.W		(A1),(A2)
		SUBA.W		(A2),-(A3)
		SUBA.W		(A3),(A4)+
		SUBA.W		(A4),$7010
		SUBA.W		(A5),$00007014
; ...when source is -(An)
		SUBA.W		-(A1),D0
		SUBA.W		-(A2),(A1)
		SUBA.W		-(A3),-(A2)
		SUBA.W		-(A4),(A3)
		SUBA.W		-(A5),$7010
		SUBA.W		-(A6),$00007014
; ...when source is (An)+
		SUBA.W		(A1)+,D0
		SUBA.W		(A2)+,(A1)
		SUBA.W		(A3)+,-(A2)
		SUBA.W		(A4)+,(A3)+
		SUBA.W		(A5)+,$7010
		SUBA.W		(A6)+,$00007014
; ...when source is (xxx).W
		SUBA.W		$1234,D0
		SUBA.W		$2345,(A1)
		SUBA.W		$3456,-(A2)
		SUBA.W		$4567,(A3)+
		SUBA.W		$5678,$7010
		SUBA.W		$7890,$00007014
; ...when source is (xxx).L
		SUBA.W		$12345678,D0
		SUBA.W		$12345678,(An)
		SUBA.W		$12345678,-(An)
		SUBA.W		$12345678,(An)+
		SUBA.W		$12345678,$7010
		SUBA.W		$12345678,$00007014
		
; tests for SUBA.L
; ...when source is #<data>, sets the data for later SUBAs
		SUBA.L		#$12345678,D0
		SUBA.L		#$12345678,(A0)
		SUBA.L		#$12345678,-(A0)
		SUBA.L		#$12345678,(A0)+
		SUBA.L		#$12345678,$7010
		SUBA.L		#$12345678,$00007014
; ...when source is Dn
		SUBA.L		D0,D1
		SUBA.L		D0,(A0)
		SUBA.L		D0,-(A0)
		SUBA.L		D0,(A0)+
		SUBA.L		D0,$7010
		SUBA.L		D0,$00007014
; ...when source is (An)
		SUBA.L		(A0),D0
		SUBA.L		(A1),(A2)
		SUBA.L		(A2),-(A3)
		SUBA.L		(A3),(A4)+
		SUBA.L		(A4),$7010
		SUBA.L		(A5),$00007014
; ...when source is -(An)
		SUBA.L		-(A1),D0
		SUBA.L		-(A2),(A1)
		SUBA.L		-(A3),-(A2)
		SUBA.L		-(A4),(A3)
		SUBA.L		-(A5),$7010
		SUBA.L		-(A6),$00007014
; ...when source is (An)+
		SUBA.L		(A1)+,D0
		SUBA.L		(A2)+,(A1)
		SUBA.L		(A3)+,-(A2)
		SUBA.L		(A4)+,(A3)+
		SUBA.L		(A5)+,$7010
		SUBA.L		(A6)+,$00007014
; ...when source is (xxx).W
		SUBA.L		$1234,D0
		SUBA.L		$2345,(A1)
		SUBA.L		$3456,-(A2)
		SUBA.L		$4567,(A3)+
		SUBA.L		$5678,$7010
		SUBA.L		$7890,$00007014
; ...when source is (xxx).L
		SUBA.L		$12345678,D0
		SUBA.L		$12345678,(An)
		SUBA.L		$12345678,-(An)
		SUBA.L		$12345678,(An)+
		SUBA.L		$12345678,$7010
		SUBA.L		$12345678,$00007014

; tests for SUBI.B
; ...when source is #<data>, sets the data for later SUBIs
		SUBI.B		#$12,D0
		SUBI.B		#$24,(A0)
		SUBI.B		#$36,-(A0)
		SUBI.B		#$48,(A0)+
		SUBI.B		#$5A,$7010
		SUBI.B		#$6C,$00007014
; ...when source is Dn
		SUBI.B		D0,D1
		SUBI.B		D0,(A0)
		SUBI.B		D0,-(A0)
		SUBI.B		D0,(A0)+
		SUBI.B		D0,$7010
		SUBI.B		D0,$00007014
; ...when source is (An)
		SUBI.B		(A0),D0
		SUBI.B		(A1),(A2)
		SUBI.B		(A2),-(A3)
		SUBI.B		(A3),(A4)+
		SUBI.B		(A4),$7010
		SUBI.B		(A5),$00007014
; ...when source is -(An)
		SUBI.B		-(A1),D0
		SUBI.B		-(A2),(A1)
		SUBI.B		-(A3),-(A2)
		SUBI.B		-(A4),(A3)
		SUBI.B		-(A5),$7010
		SUBI.B		-(A6),$00007014
; ...when source is (An)+
		SUBI.B		(A1)+,D0
		SUBI.B		(A2)+,(A1)
		SUBI.B		(A3)+,-(A2)
		SUBI.B		(A4)+,(A3)+
		SUBI.B		(A5)+,$7010
		SUBI.B		(A6)+,$00007014
; ...when source is (xxx).W
		SUBI.B		$1234,D0
		SUBI.B		$2345,(A1)
		SUBI.B		$3456,-(A2)
		SUBI.B		$4567,(A3)+
		SUBI.B		$5678,$7010
		SUBI.B		$7890,$00007014
; ...when source is (xxx).L
		SUBI.B		$12345678,D0
		SUBI.B		$12345678,(An)
		SUBI.B		$12345678,-(An)
		SUBI.B		$12345678,(An)+
		SUBI.B		$12345678,$7010
		SUBI.B		$12345678,$00007014

; tests for SUBI.W
; ...when source is #<data>, sets the data for later SUBIs
		SUBI.W		#$1234,D0
		SUBI.W		#$2456,(A0)
		SUBI.W		#$3678,-(A0)
		SUBI.W		#$4890,(A0)+
		SUBI.W		#$5ABC,$7010
		SUBI.W		#$6CDE,$00007014
; ...when source is Dn
		SUBI.W		D0,D1
		SUBI.W		D0,(A0)
		SUBI.W		D0,-(A0)
		SUBI.W		D0,(A0)+
		SUBI.W		D0,$7010
		SUBI.W		D0,$00007014
; ...when source is (An)
		SUBI.W		(A0),D0
		SUBI.W		(A1),(A2)
		SUBI.W		(A2),-(A3)
		SUBI.W		(A3),(A4)+
		SUBI.W		(A4),$7010
		SUBI.W		(A5),$00007014
; ...when source is -(An)
		SUBI.W		-(A1),D0
		SUBI.W		-(A2),(A1)
		SUBI.W		-(A3),-(A2)
		SUBI.W		-(A4),(A3)
		SUBI.W		-(A5),$7010
		SUBI.W		-(A6),$00007014
; ...when source is (An)+
		SUBI.W		(A1)+,D0
		SUBI.W		(A2)+,(A1)
		SUBI.W		(A3)+,-(A2)
		SUBI.W		(A4)+,(A3)+
		SUBI.W		(A5)+,$7010
		SUBI.W		(A6)+,$00007014
; ...when source is (xxx).W
		SUBI.W		$1234,D0
		SUBI.W		$2345,(A1)
		SUBI.W		$3456,-(A2)
		SUBI.W		$4567,(A3)+
		SUBI.W		$5678,$7010
		SUBI.W		$7890,$00007014
; ...when source is (xxx).L
		SUBI.W		$12345678,D0
		SUBI.W		$12345678,(An)
		SUBI.W		$12345678,-(An)
		SUBI.W		$12345678,(An)+
		SUBI.W		$12345678,$7010
		SUBI.W		$12345678,$00007014
		
; tests for SUBI.L
; ...when source is #<data>, sets the data for later SUBIs
		SUBI.L		#$12345678,D0
		SUBI.L		#$12345678,(A0)
		SUBI.L		#$12345678,-(A0)
		SUBI.L		#$12345678,(A0)+
		SUBI.L		#$12345678,$7010
		SUBI.L		#$12345678,$00007014
; ...when source is Dn
		SUBI.L		D0,D1
		SUBI.L		D0,(A0)
		SUBI.L		D0,-(A0)
		SUBI.L		D0,(A0)+
		SUBI.L		D0,$7010
		SUBI.L		D0,$00007014
; ...when source is (An)
		SUBI.L		(A0),D0
		SUBI.L		(A1),(A2)
		SUBI.L		(A2),-(A3)
		SUBI.L		(A3),(A4)+
		SUBI.L		(A4),$7010
		SUBI.L		(A5),$00007014
; ...when source is -(An)
		SUBI.L		-(A1),D0
		SUBI.L		-(A2),(A1)
		SUBI.L		-(A3),-(A2)
		SUBI.L		-(A4),(A3)
		SUBI.L		-(A5),$7010
		SUBI.L		-(A6),$00007014
; ...when source is (An)+
		SUBI.L		(A1)+,D0
		SUBI.L		(A2)+,(A1)
		SUBI.L		(A3)+,-(A2)
		SUBI.L		(A4)+,(A3)+
		SUBI.L		(A5)+,$7010
		SUBI.L		(A6)+,$00007014
; ...when source is (xxx).W
		SUBI.L		$1234,D0
		SUBI.L		$2345,(A1)
		SUBI.L		$3456,-(A2)
		SUBI.L		$4567,(A3)+
		SUBI.L		$5678,$7010
		SUBI.L		$7890,$00007014
; ...when source is (xxx).L
		SUBI.L		$12345678,D0
		SUBI.L		$12345678,(An)
		SUBI.L		$12345678,-(An)
		SUBI.L		$12345678,(An)+
		SUBI.L		$12345678,$7010
		SUBI.L		$12345678,$00007014
		
; tests for SUBQ.B
; ...when source is #<data>, sets the data for later SUBQs
		SUBQ.B		#$12,D0
		SUBQ.B		#$24,(A0)
		SUBQ.B		#$36,-(A0)
		SUBQ.B		#$48,(A0)+
		SUBQ.B		#$5A,$7010
		SUBQ.B		#$6C,$00007014
; ...when source is Dn
		SUBQ.B		D0,D1
		SUBQ.B		D0,(A0)
		SUBQ.B		D0,-(A0)
		SUBQ.B		D0,(A0)+
		SUBQ.B		D0,$7010
		SUBQ.B		D0,$00007014
; ...when source is (An)
		SUBQ.B		(A0),D0
		SUBQ.B		(A1),(A2)
		SUBQ.B		(A2),-(A3)
		SUBQ.B		(A3),(A4)+
		SUBQ.B		(A4),$7010
		SUBQ.B		(A5),$00007014
; ...when source is -(An)
		SUBQ.B		-(A1),D0
		SUBQ.B		-(A2),(A1)
		SUBQ.B		-(A3),-(A2)
		SUBQ.B		-(A4),(A3)
		SUBQ.B		-(A5),$7010
		SUBQ.B		-(A6),$00007014
; ...when source is (An)+
		SUBQ.B		(A1)+,D0
		SUBQ.B		(A2)+,(A1)
		SUBQ.B		(A3)+,-(A2)
		SUBQ.B		(A4)+,(A3)+
		SUBQ.B		(A5)+,$7010
		SUBQ.B		(A6)+,$00007014
; ...when source is (xxx).W
		SUBQ.B		$1234,D0
		SUBQ.B		$2345,(A1)
		SUBQ.B		$3456,-(A2)
		SUBQ.B		$4567,(A3)+
		SUBQ.B		$5678,$7010
		SUBQ.B		$7890,$00007014
; ...when source is (xxx).L
		SUBQ.B		$12345678,D0
		SUBQ.B		$12345678,(An)
		SUBQ.B		$12345678,-(An)
		SUBQ.B		$12345678,(An)+
		SUBQ.B		$12345678,$7010
		SUBQ.B		$12345678,$00007014

; tests for SUBQ.W
; ...when source is #<data>, sets the data for later SUBQs
		SUBQ.W		#$1234,D0
		SUBQ.W		#$2456,(A0)
		SUBQ.W		#$3678,-(A0)
		SUBQ.W		#$4890,(A0)+
		SUBQ.W		#$5ABC,$7010
		SUBQ.W		#$6CDE,$00007014
; ...when source is Dn
		SUBQ.W		D0,D1
		SUBQ.W		D0,(A0)
		SUBQ.W		D0,-(A0)
		SUBQ.W		D0,(A0)+
		SUBQ.W		D0,$7010
		SUBQ.W		D0,$00007014
; ...when source is (An)
		SUBQ.W		(A0),D0
		SUBQ.W		(A1),(A2)
		SUBQ.W		(A2),-(A3)
		SUBQ.W		(A3),(A4)+
		SUBQ.W		(A4),$7010
		SUBQ.W		(A5),$00007014
; ...when source is -(An)
		SUBQ.W		-(A1),D0
		SUBQ.W		-(A2),(A1)
		SUBQ.W		-(A3),-(A2)
		SUBQ.W		-(A4),(A3)
		SUBQ.W		-(A5),$7010
		SUBQ.W		-(A6),$00007014
; ...when source is (An)+
		SUBQ.W		(A1)+,D0
		SUBQ.W		(A2)+,(A1)
		SUBQ.W		(A3)+,-(A2)
		SUBQ.W		(A4)+,(A3)+
		SUBQ.W		(A5)+,$7010
		SUBQ.W		(A6)+,$00007014
; ...when source is (xxx).W
		SUBQ.W		$1234,D0
		SUBQ.W		$2345,(A1)
		SUBQ.W		$3456,-(A2)
		SUBQ.W		$4567,(A3)+
		SUBQ.W		$5678,$7010
		SUBQ.W		$7890,$00007014
; ...when source is (xxx).L
		SUBQ.W		$12345678,D0
		SUBQ.W		$12345678,(An)
		SUBQ.W		$12345678,-(An)
		SUBQ.W		$12345678,(An)+
		SUBQ.W		$12345678,$7010
		SUBQ.W		$12345678,$00007014
		
; tests for SUBQ.L
; ...when source is #<data>, sets the data for later SUBQs
		SUBQ.L		#$12345678,D0
		SUBQ.L		#$12345678,(A0)
		SUBQ.L		#$12345678,-(A0)
		SUBQ.L		#$12345678,(A0)+
		SUBQ.L		#$12345678,$7010
		SUBQ.L		#$12345678,$00007014
; ...when source is Dn
		SUBQ.L		D0,D1
		SUBQ.L		D0,(A0)
		SUBQ.L		D0,-(A0)
		SUBQ.L		D0,(A0)+
		SUBQ.L		D0,$7010
		SUBQ.L		D0,$00007014
; ...when source is (An)
		SUBQ.L		(A0),D0
		SUBQ.L		(A1),(A2)
		SUBQ.L		(A2),-(A3)
		SUBQ.L		(A3),(A4)+
		SUBQ.L		(A4),$7010
		SUBQ.L		(A5),$00007014
; ...when source is -(An)
		SUBQ.L		-(A1),D0
		SUBQ.L		-(A2),(A1)
		SUBQ.L		-(A3),-(A2)
		SUBQ.L		-(A4),(A3)
		SUBQ.L		-(A5),$7010
		SUBQ.L		-(A6),$00007014
; ...when source is (An)+
		SUBQ.L		(A1)+,D0
		SUBQ.L		(A2)+,(A1)
		SUBQ.L		(A3)+,-(A2)
		SUBQ.L		(A4)+,(A3)+
		SUBQ.L		(A5)+,$7010
		SUBQ.L		(A6)+,$00007014
; ...when source is (xxx).W
		SUBQ.L		$1234,D0
		SUBQ.L		$2345,(A1)
		SUBQ.L		$3456,-(A2)
		SUBQ.L		$4567,(A3)+
		SUBQ.L		$5678,$7010
		SUBQ.L		$7890,$00007014
; ...when source is (xxx).L
		SUBQ.L		$12345678,D0
		SUBQ.L		$12345678,(An)
		SUBQ.L		$12345678,-(An)
		SUBQ.L		$12345678,(An)+
		SUBQ.L		$12345678,$7010
		SUBQ.L		$12345678,$00007014
		
; tests for LEA
		LEA			MESSAGE,A1
		LEA			MESSAGE2,A2
		LEA			MESSAGE3,A3
		
; tests for AND.B
; ...when source is #<data>, sets the data for later ANDs
		AND.B		#$12,D0
		AND.B		#$24,(A0)
		AND.B		#$36,-(A0)
		AND.B		#$48,(A0)+
		AND.B		#$5A,$7010
		AND.B		#$6C,$00007014
; ...when source is Dn
		AND.B		D0,D1
		AND.B		D0,(A0)
		AND.B		D0,-(A0)
		AND.B		D0,(A0)+
		AND.B		D0,$7010
		AND.B		D0,$00007014
; ...when source is (An)
		AND.B		(A0),D0
		AND.B		(A1),(A2)
		AND.B		(A2),-(A3)
		AND.B		(A3),(A4)+
		AND.B		(A4),$7010
		AND.B		(A5),$00007014
; ...when source is -(An)
		AND.B		-(A1),D0
		AND.B		-(A2),(A1)
		AND.B		-(A3),-(A2)
		AND.B		-(A4),(A3)
		AND.B		-(A5),$7010
		AND.B		-(A6),$00007014
; ...when source is (An)+
		AND.B		(A1)+,D0
		AND.B		(A2)+,(A1)
		AND.B		(A3)+,-(A2)
		AND.B		(A4)+,(A3)+
		AND.B		(A5)+,$7010
		AND.B		(A6)+,$00007014
; ...when source is (xxx).W
		AND.B		$1234,D0
		AND.B		$2345,(A1)
		AND.B		$3456,-(A2)
		AND.B		$4567,(A3)+
		AND.B		$5678,$7010
		AND.B		$7890,$00007014
; ...when source is (xxx).L
		AND.B		$12345678,D0
		AND.B		$12345678,(An)
		AND.B		$12345678,-(An)
		AND.B		$12345678,(An)+
		AND.B		$12345678,$7010
		AND.B		$12345678,$00007014

; tests for AND.W
; ...when source is #<data>, sets the data for later ANDs
		AND.W		#$1234,D0
		AND.W		#$2456,(A0)
		AND.W		#$3678,-(A0)
		AND.W		#$4890,(A0)+
		AND.W		#$5ABC,$7010
		AND.W		#$6CDE,$00007014
; ...when source is Dn
		AND.W		D0,D1
		AND.W		D0,(A0)
		AND.W		D0,-(A0)
		AND.W		D0,(A0)+
		AND.W		D0,$7010
		AND.W		D0,$00007014
; ...when source is (An)
		AND.W		(A0),D0
		AND.W		(A1),(A2)
		AND.W		(A2),-(A3)
		AND.W		(A3),(A4)+
		AND.W		(A4),$7010
		AND.W		(A5),$00007014
; ...when source is -(An)
		AND.W		-(A1),D0
		AND.W		-(A2),(A1)
		AND.W		-(A3),-(A2)
		AND.W		-(A4),(A3)
		AND.W		-(A5),$7010
		AND.W		-(A6),$00007014
; ...when source is (An)+
		AND.W		(A1)+,D0
		AND.W		(A2)+,(A1)
		AND.W		(A3)+,-(A2)
		AND.W		(A4)+,(A3)+
		AND.W		(A5)+,$7010
		AND.W		(A6)+,$00007014
; ...when source is (xxx).W
		AND.W		$1234,D0
		AND.W		$2345,(A1)
		AND.W		$3456,-(A2)
		AND.W		$4567,(A3)+
		AND.W		$5678,$7010
		AND.W		$7890,$00007014
; ...when source is (xxx).L
		AND.W		$12345678,D0
		AND.W		$12345678,(An)
		AND.W		$12345678,-(An)
		AND.W		$12345678,(An)+
		AND.W		$12345678,$7010
		AND.W		$12345678,$00007014
		
; tests for AND.L
; ...when source is #<data>, sets the data for later ANDs
		AND.L		#$12345678,D0
		AND.L		#$12345678,(A0)
		AND.L		#$12345678,-(A0)
		AND.L		#$12345678,(A0)+
		AND.L		#$12345678,$7010
		AND.L		#$12345678,$00007014
; ...when source is Dn
		AND.L		D0,D1
		AND.L		D0,(A0)
		AND.L		D0,-(A0)
		AND.L		D0,(A0)+
		AND.L		D0,$7010
		AND.L		D0,$00007014
; ...when source is (An)
		AND.L		(A0),D0
		AND.L		(A1),(A2)
		AND.L		(A2),-(A3)
		AND.L		(A3),(A4)+
		AND.L		(A4),$7010
		AND.L		(A5),$00007014
; ...when source is -(An)
		AND.L		-(A1),D0
		AND.L		-(A2),(A1)
		AND.L		-(A3),-(A2)
		AND.L		-(A4),(A3)
		AND.L		-(A5),$7010
		AND.L		-(A6),$00007014
; ...when source is (An)+
		AND.L		(A1)+,D0
		AND.L		(A2)+,(A1)
		AND.L		(A3)+,-(A2)
		AND.L		(A4)+,(A3)+
		AND.L		(A5)+,$7010
		AND.L		(A6)+,$00007014
; ...when source is (xxx).W
		AND.L		$1234,D0
		AND.L		$2345,(A1)
		AND.L		$3456,-(A2)
		AND.L		$4567,(A3)+
		AND.L		$5678,$7010
		AND.L		$7890,$00007014
; ...when source is (xxx).L
		AND.L		$12345678,D0
		AND.L		$12345678,(An)
		AND.L		$12345678,-(An)
		AND.L		$12345678,(An)+
		AND.L		$12345678,$7010
		AND.L		$12345678,$00007014
		
; tests for ANDI.B
; ...when source is #<data>, sets the data for later ANDIs
		ANDI.B		#$12,D0
		ANDI.B		#$24,(A0)
		ANDI.B		#$36,-(A0)
		ANDI.B		#$48,(A0)+
		ANDI.B		#$5A,$7010
		ANDI.B		#$6C,$00007014
; ...when source is Dn
		ANDI.B		D0,D1
		ANDI.B		D0,(A0)
		ANDI.B		D0,-(A0)
		ANDI.B		D0,(A0)+
		ANDI.B		D0,$7010
		ANDI.B		D0,$00007014
; ...when source is (An)
		ANDI.B		(A0),D0
		ANDI.B		(A1),(A2)
		ANDI.B		(A2),-(A3)
		ANDI.B		(A3),(A4)+
		ANDI.B		(A4),$7010
		ANDI.B		(A5),$00007014
; ...when source is -(An)
		ANDI.B		-(A1),D0
		ANDI.B		-(A2),(A1)
		ANDI.B		-(A3),-(A2)
		ANDI.B		-(A4),(A3)
		ANDI.B		-(A5),$7010
		ANDI.B		-(A6),$00007014
; ...when source is (An)+
		ANDI.B		(A1)+,D0
		ANDI.B		(A2)+,(A1)
		ANDI.B		(A3)+,-(A2)
		ANDI.B		(A4)+,(A3)+
		ANDI.B		(A5)+,$7010
		ANDI.B		(A6)+,$00007014
; ...when source is (xxx).W
		ANDI.B		$1234,D0
		ANDI.B		$2345,(A1)
		ANDI.B		$3456,-(A2)
		ANDI.B		$4567,(A3)+
		ANDI.B		$5678,$7010
		ANDI.B		$7890,$00007014
; ...when source is (xxx).L
		ANDI.B		$12345678,D0
		ANDI.B		$12345678,(An)
		ANDI.B		$12345678,-(An)
		ANDI.B		$12345678,(An)+
		ANDI.B		$12345678,$7010
		ANDI.B		$12345678,$00007014

; tests for ANDI.W
; ...when source is #<data>, sets the data for later ANDIs
		ANDI.W		#$1234,D0
		ANDI.W		#$2456,(A0)
		ANDI.W		#$3678,-(A0)
		ANDI.W		#$4890,(A0)+
		ANDI.W		#$5ABC,$7010
		ANDI.W		#$6CDE,$00007014
; ...when source is Dn
		ANDI.W		D0,D1
		ANDI.W		D0,(A0)
		ANDI.W		D0,-(A0)
		ANDI.W		D0,(A0)+
		ANDI.W		D0,$7010
		ANDI.W		D0,$00007014
; ...when source is (An)
		ANDI.W		(A0),D0
		ANDI.W		(A1),(A2)
		ANDI.W		(A2),-(A3)
		ANDI.W		(A3),(A4)+
		ANDI.W		(A4),$7010
		ANDI.W		(A5),$00007014
; ...when source is -(An)
		ANDI.W		-(A1),D0
		ANDI.W		-(A2),(A1)
		ANDI.W		-(A3),-(A2)
		ANDI.W		-(A4),(A3)
		ANDI.W		-(A5),$7010
		ANDI.W		-(A6),$00007014
; ...when source is (An)+
		ANDI.W		(A1)+,D0
		ANDI.W		(A2)+,(A1)
		ANDI.W		(A3)+,-(A2)
		ANDI.W		(A4)+,(A3)+
		ANDI.W		(A5)+,$7010
		ANDI.W		(A6)+,$00007014
; ...when source is (xxx).W
		ANDI.W		$1234,D0
		ANDI.W		$2345,(A1)
		ANDI.W		$3456,-(A2)
		ANDI.W		$4567,(A3)+
		ANDI.W		$5678,$7010
		ANDI.W		$7890,$00007014
; ...when source is (xxx).L
		ANDI.W		$12345678,D0
		ANDI.W		$12345678,(An)
		ANDI.W		$12345678,-(An)
		ANDI.W		$12345678,(An)+
		ANDI.W		$12345678,$7010
		ANDI.W		$12345678,$00007014
		
; tests for ANDI.L
; ...when source is #<data>, sets the data for later ANDIs
		ANDI.L		#$12345678,D0
		ANDI.L		#$12345678,(A0)
		ANDI.L		#$12345678,-(A0)
		ANDI.L		#$12345678,(A0)+
		ANDI.L		#$12345678,$7010
		ANDI.L		#$12345678,$00007014
; ...when source is Dn
		ANDI.L		D0,D1
		ANDI.L		D0,(A0)
		ANDI.L		D0,-(A0)
		ANDI.L		D0,(A0)+
		ANDI.L		D0,$7010
		ANDI.L		D0,$00007014
; ...when source is (An)
		ANDI.L		(A0),D0
		ANDI.L		(A1),(A2)
		ANDI.L		(A2),-(A3)
		ANDI.L		(A3),(A4)+
		ANDI.L		(A4),$7010
		ANDI.L		(A5),$00007014
; ...when source is -(An)
		ANDI.L		-(A1),D0
		ANDI.L		-(A2),(A1)
		ANDI.L		-(A3),-(A2)
		ANDI.L		-(A4),(A3)
		ANDI.L		-(A5),$7010
		ANDI.L		-(A6),$00007014
; ...when source is (An)+
		ANDI.L		(A1)+,D0
		ANDI.L		(A2)+,(A1)
		ANDI.L		(A3)+,-(A2)
		ANDI.L		(A4)+,(A3)+
		ANDI.L		(A5)+,$7010
		ANDI.L		(A6)+,$00007014
; ...when source is (xxx).W
		ANDI.L		$1234,D0
		ANDI.L		$2345,(A1)
		ANDI.L		$3456,-(A2)
		ANDI.L		$4567,(A3)+
		ANDI.L		$5678,$7010
		ANDI.L		$7890,$00007014
; ...when source is (xxx).L
		ANDI.L		$12345678,D0
		ANDI.L		$12345678,(An)
		ANDI.L		$12345678,-(An)
		ANDI.L		$12345678,(An)+
		ANDI.L		$12345678,$7010
		ANDI.L		$12345678,$00007014






MESSAGE
		DC.B	'TestStuff',0
MESSAGE2
		DC.B	'TestStuff 1',0
MESSAGE3
		DC.B	'TestStuff 2',0
		
		
		MOVE.W	#9,D0		; set task 9:
		TRAP	#15			; terminate program
		
		SIMHALT				; halt simulator
		
		END		START		; last line of source

;~Font name~Courier New~
;~Font size~10~
;~Tab type~1~
;~Tab size~4~
