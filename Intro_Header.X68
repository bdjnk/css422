*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
START   ORG     $1000

*-------Code for output------
        LEA     MESSAGE,A1      Loads MESSAGE into address register A1
        MOVE.B  #14,D0          Moves the number 14 into data register D0
        TRAP    #15             Displays Message
        
        MOVE.B  #9,D0
        TRAP    #15             Halt Simulator

CR      EQU     $0D             ASCII code for Carriage Return
LF      EQU     $0A             ASCII code for Line Feed
MESSAGE	DC.B	'            __    ______  __   __                                              ',CR,LF
		DC.B	'           / /   |\  __ \|\ \ |  |                                             ',CR,LF
		DC.B	'          |\ \___ \\ \_\ \\\ \/  /                                             ',CR,LF
		DC.B	'           \\  __ \\\  __ \\\  _ \_                                            ',CR,LF
		DC.B	'            \\ \_\ \\\ \_\ \\\ \\_ \_                                          ',CR,LF
		DC.B	'  __  __     \\_____\\\_____\\\_\\\__\               __     __                 ',CR,LF
		DC.B	' |\ \|\_\     \_____/ \_____/ \_/ \__/              |\ \   |\ \                ',CR,LF
		DC.B	' _\\ \\_/_  ____   _____  ____   ____   _____  ______\\ \___\\ \  _____  _ ___ ',CR,LF
		DC.B	'|\  _ \|\ \|\  _\_|\  _ \|\  _\_|\  _\_|\  _ \|\     \\\  _ \\\ \|\  _ \|\`  _\',CR,LF
		DC.B	' \\ \\ \\\ \\\___ \\\ \| \\\___ \\\___ \\\  _/_\\ \ \ \\\ \\ \\\ \\\  _/ \\ |  ',CR,LF
		DC.B	'  \\____\\\_\|\____\\\__  \|\____\\\____\\\____\\\_\_\_\\\____\\\_\\\____\\\_\ ',CR,LF
		DC.B	'   \____/ \_/ \____/ \__/\/ \____/ \____/ \____/ \_/\/\/ \____/ \_/ \____/ \_/ ',CR,LF,CR,LF
		DC.B    ' ____  _                                  _     _           ',CR,LF
        DC.B    '|  _ \(_)___  __ _ ___ ___  ___ _ __ ___ | |__ | | ___ _ __ ',CR,LF
        DC.B    '| | | | / __|/ _` / __/ __|/ _ \  _ ` _ \|  _ \| |/ _ \  __|',CR,LF
        DC.B    '| |_| | \__ \ (_| \__ \__ \  __/ | | | | | |_) | |  __/ |   ',CR,LF
        DC.B    '|____/|_|___/\__,_|___/___/\___|_| |_| |_|_.__/|_|\___|_|   ',CR,LF,CR,LF
        DC.B    'By: Joe Pennington, Michael Plotke, and Jacky Wong',CR,LF,0

        END     START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
