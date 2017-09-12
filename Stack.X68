*-----------------------------------------------------------
* Title      :
* Written by : Hall7790
* Date       :
* Description: 
*-----------------------------------------------------------
POP
    MOVEM   D0/A1,-(SP)
    MOVE.L  LENGTH,D0
    CMP     #0,D0
    BEQ     FULL_POP
    MOVE.L  STACKA,A1
    ADDA    D0,A1
    MOVE.B  (A1),D2
    SUB.L   #1,D0
    MOVE.L  D0,LENGTH
    MOVEM   (SP)+,D0/A1
    RTS
    
FULL_POP
    MOVE.B  #-1,D2
    MOVEM   (SP)+,D0/A1
    RTS
    
    
PUSH
    MOVEM   D0/A1,-(SP)
    MOVE.L  LENGTH,D0
    ADD.L   #1,D0
    MOVE.L  D0,LENGTH
    MOVE.L  STACKA,A1
    ADDA    D0,A1
    MOVE.B  8(SP),(A1)
    MOVEM   (SP)+,D0/A1
    RTS
    
    ORG     $2000

STACKA  DC.L    $3000
LENGTH  DC.L    0
    

    

*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~4~
