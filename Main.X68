*-----------------------------------------------------------
* Title      :
* Written by : Hall7790
* Date       :
* Description: 
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

INTERPRET
    MOVE.B  #18,D0
    LEA     PRMPT,A1
    TRAP    #15
    
    CMP     #1,D1
    BEQ     ADDDATA
    CMP     #2,D1
    BEQ     REMOVEDATA
    CMP     #3,D1
    BEQ     QUIT
    BRA     INTERPRET
    
ADDDATA
    LEA     ADDPT,A1
    TRAP    #15
    MOVE.B  D1,(SP)
    JSR     PUSH
    BRA     INTERPRET
    
REMOVEDATA
    JSR     POP
    CMP     #255,D2
    BEQ     EMPTY
    MOVE.B  D2,D1
    MOVE.B  #3,D0
    TRAP    #15
    BRA     INTERPRET
    
EMPTY
    LEA EMPST,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     INTERPRET 
     
QUIT
    SIMHALT             ; halt simulator
    INCLUDE 'Stack.X68'

PRMPT   DC.B    $0A,$0D,'Action? (push 1, pop 2, quit 3): ',0
ADDPT   DC.B    'INPUT DATA TO ADD: ',0
EMPST   DC.B    'STACK EMPTY',0

    END    START        ; last line of source


*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~4~
