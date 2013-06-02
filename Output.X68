*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
			
			MOVE.B	#14,D0			*Set trap code
			MOVE.B	#16,D2			*value for Trap #15 - base to convert number to
			MOVE.W	#$0204,D7		*temp value for Instruction and Length
			MOVE.W	#$0101,D6		*temp value for both EA's
			MOVE.W	#$1111,D5		*temp value for first operand
			MOVE.W	#$2222,D4		*temp value for second operand
			
			JSR		INSTRUCT		*jump to instruct
			MOVE.L	D5,D1			*Move first operand into place
			LEA		MSG_SPACE,A1	*Move MSG_SPACE into place
			MOVE.B	#14,D0			*Set Trap
			TRAP	#15				*Print space
			JSR		EA				*Jump to EA
			MOVE.L	D4,D1			*Move second operand into place
			LEA		MSG_COMMA,A1	*Move MSG_COMMA into place
			MOVE.B	#14,D0			*Set Trap
			TRAP	#15				*Print comma
			JSR		EA				*jump to EA
			LEA		MSG_NEWL,A1		*Move New Line into place
			MOVE.B	#14,D0			*Set Trap
			TRAP	#15				*Print new line
			BRA		ENDPRINT		*End printing

*Print instruction
INSTRUCT    CMP.B   #$1,D7
            BEQ     PRINT_MOVE
            CMP.B   #$2,D7
            BEQ     PRINT_MOVEQ
            CMP.B   #$3,D7
            BEQ     PRINT_MOVEA
            CMP.B   #$4,D7
            BEQ     PRINT_ADD
            CMP.B   #$5,D7
            BEQ     PRINT_ADDA
            CMP.B   #$6,D7
            BEQ     PRINT_ADDI
            CMP.B   #$7,D7
            BEQ     PRINT_ADDQ
            CMP.B   #$8,D7
            BEQ     PRINT_SUB
            CMP.B   #$9,D7
            BEQ     PRINT_SUBA
            CMP.B   #$10,D7
            BEQ     PRINT_SUBI
            CMP.B   #$11,D7
            BEQ     PRINT_SUBQ
            CMP.B   #$12,D7
            BEQ     PRINT_LEA
            CMP.B   #$13,D7
            BEQ     PRINT_AND
            CMP.B   #$14,D7
            BEQ     PRINT_ANDI
            CMP.B   #$15,D7
            BEQ     PRINT_EOR
            CMP.B   #$16,D7
            BEQ     PRINT_EORI
            CMP.B   #$17,D7
            BEQ     PRINT_ASL
            CMP.B   #$18,D7
            BEQ     PRINT_ASR
            CMP.B   #$19,D7
            BEQ     PRINT_LSL
            CMP.B   #$20,D7
            BEQ     PRINT_LSR
            CMP.B   #$21,D7
            BEQ     PRINT_CMP
            CMP.B   #$22,D7
            BEQ     PRINT_CMPA
            CMP.B   #$23,D7
            BEQ     PRINT_CMPI
            CMP.B   #$24,D7
            BEQ     PRINT_BEQ
            CMP.B   #$25,D7
            BEQ     PRINT_BLS
            CMP.B   #$26,D7
            BEQ     PRINT_BLT
            CMP.B   #$27,D7
            BEQ     PRINT_BNE
            CMP.B   #$28,D7
            BEQ     PRINT_BHI
            CMP.B   #$29,D7
            BEQ     PRINT_RTS

*Print length            
LENGTH      
			LSR		#8,D7			*Shift Bits

			CMP.B   #$1,D7
			BEQ     PRINT_BYTE
			CMP.B   #$2,D7
			BEQ     PRINT_WORD
			CMP.B   #$3,D7
			BEQ     PRINT_LONG
			
*Print EA
EA			
			CMP.B   #$1,D6
			BEQ     PRINT_DN
			CMP.B   #$2,D6
			BEQ     PRINT_AN
			CMP.B   #$3,D6
			BEQ     PRINT_ARI
			CMP.B   #$4,D6
			BEQ     PRINT_ARIPOST
			CMP.B   #$5,D6
			BEQ     PRINT_ARIPRE
			CMP.B   #$6,D6
			BEQ     PRINT_ABSWORD
			CMP.B   #$7,D6
			BEQ		PRINT_ABSLONG
			CMP.B   #$8,D6
			BEQ		PRINT_ID
			
			LSR		#8,D6			*Shift Bits
			

PRINT_MOVE
			LEA		MSG_MOVE,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_MOVEQ
			LEA		MSG_MOVEQ,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_MOVEA
			LEA		MSG_MOVEA,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ADD
			LEA		MSG_ADD,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ADDA
			LEA		MSG_ADDA,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ADDI
			LEA		MSG_ADDI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ADDQ
			LEA		MSG_ADDQ,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_SUB
			LEA		MSG_SUB,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_SUBA
			LEA		MSG_SUBA,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_SUBI
			LEA		MSG_SUBI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_SUBQ
			LEA		MSG_SUBQ,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_LEA
			LEA		MSG_LEA,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_AND
			LEA		MSG_AND,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ANDI
			LEA		MSG_ANDI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_EOR
			LEA		MSG_EOR,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_EORI
			LEA		MSG_EORI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ASL
			LEA		MSG_ASL,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_ASR
			LEA		MSG_ASR,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_LSL
			LEA		MSG_LSL,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_LSR
			LEA		MSG_LSR,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_CMP
			LEA		MSG_CMP,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_CMPA
			LEA		MSG_CMPA,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_CMPI
			LEA		MSG_CMPI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BEQ
			LEA		MSG_BEQ,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BLS
			LEA		MSG_BLS,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BLT
			LEA		MSG_BLT,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BNE
			LEA		MSG_BNE,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BHI
			LEA		MSG_BHI,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_RTS
			LEA		MSG_RTS,A1
			TRAP 	#15
			BRA		LENGTH
PRINT_BYTE
			LEA		MSG_BYTE,A1
			TRAP 	#15
			RTS
PRINT_WORD
			LEA		MSG_WORD,A1
			TRAP 	#15
			RTS
PRINT_LONG
			LEA		MSG_LONG,A1
			TRAP 	#15
			RTS
PRINT_DN
			LEA		MSG_DN,A1
			TRAP 	#15
			MOVE.B	#15,D0
			TRAP	#15
			RTS
PRINT_AN
			LEA		MSG_AN,A1
			TRAP 	#15
			RTS
PRINT_ARI
			LEA		MSG_ABS1,A1
			TRAP 	#15
			MOVE.B	#3,D0
			TRAP	#15
			LEA 	MSG_ABS2,A1
			MOVE.B	#14,D0
			TRAP	#15
			RTS
PRINT_ARIPOST
			LEA		MSG_ARIPOST,A1
			TRAP 	#15
			LEA		MSG_ABS1,A1
			TRAP	#15
			MOVE.B	#3,D0
			TRAP	#15
			LEA 	MSG_ABS2,A1
			MOVE.B	#14,D0
			TRAP	#15
			RTS
PRINT_ARIPRE
			LEA		MSG_ABS1,A1
			TRAP	#15
			MOVE.B	#3,D0
			TRAP	#15
			LEA 	MSG_ABS2,A1
			MOVE.B	#14,D0
			TRAP	#15
			LEA		MSG_ARIPRE,A1
			TRAP 	#15
			RTS
PRINT_ABSWORD
			LEA		MSG_ABS1,A1
			TRAP	#15
			MOVE.B	#3,D0
			TRAP	#15
			LEA 	MSG_ABS2,A1
			MOVE.B	#14,D0
			TRAP	#15
			LEA		MSG_WORD,A1
			TRAP 	#15
			RTS
PRINT_ABSLONG
			LEA		MSG_ABS1,A1
			TRAP	#15
			MOVE.B	#3,D0
			TRAP	#15
			LEA 	MSG_ABS2,A1
			MOVE.B	#14,D0
			TRAP	#15
			LEA		MSG_LONG,A1
			TRAP 	#15
			RTS
PRINT_ID
			LEA		MSG_ID1,A1
			TRAP	#15
			MOVE.B	#3,D0
			TRAP	#15
			RTS
			

CR          EQU     $0D     		*Carriage Return
LF          EQU     $0A     		*Line Feed

MSG_MOVE    DC.B    'MOVE',0
MSG_MOVEQ   DC.B    'MOVEQ',0
MSG_MOVEA   DC.B    'MOVEA',0
MSG_ADD     DC.B    'ADD',0
MSG_ADDA    DC.B    'ADDA',0
MSG_ADDI    DC.B    'ADDI',0
MSG_ADDQ    DC.B    'ADDQ',0
MSG_SUB     DC.B    'SUB',0
MSG_SUBA    DC.B    'SUBA',0
MSG_SUBI    DC.B    'SUBI',0
MSG_SUBQ    DC.B    'SUBQ',0
MSG_LEA     DC.B    'LEA',0
MSG_AND     DC.B    'AND',0
MSG_ANDI    DC.B    'ANDI',0
MSG_EOR     DC.B    'EOR',0
MSG_EORI    DC.B    'EORI',0
MSG_ASL     DC.B    'ASL',0
MSG_ASR     DC.B    'ASR',0
MSG_LSL     DC.B    'LSL',0
MSG_LSR     DC.B    'LSR',0
MSG_CMP     DC.B    'CMP',0
MSG_CMPA    DC.B    'CMPA',0
MSG_CMPI    DC.B    'CMPI',0
MSG_BEQ     DC.B    'BEQ',0
MSG_BLS     DC.B    'BLS',0
MSG_BLT     DC.B    'BLT',0
MSG_BNE     DC.B    'BNE',0
MSG_BHI     DC.B    'BHI',0
MSG_RTS     DC.B    'RTS',0
MSG_BYTE    DC.B    '.B',0
MSG_WORD    DC.B    '.W',0
MSG_LONG    DC.B    '.L',0
MSG_DN      DC.B    'D',0
MSG_AN      DC.B    'A',0
MSG_ABS1    DC.B    '(',0
MSG_ABS2    DC.B    ')',0
MSG_ARIPOST DC.B    '-',0
MSG_ARIPRE  DC.B    '+',0
MSG_ID1     DC.B    '#',0
MSG_COMMA	DC.B	',',0
MSG_SPACE	DC.B	' ',0
MSG_NEWL	DC.B	'',CR,LF,0
    



ENDPRINT




    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
