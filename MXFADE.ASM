ORG 256
 MOV FS,AX                   ; FS: segment of BIOS variables
 MOV AL,13H
 INT 10H
 PUSH BX
 MOV AX,3508H
 INT 21H
 PUSH ES
 PUSH BX
 MOV DX,IRQ
 MOV AX,2508H
 INT 21H
 MOV DX,331H
 MOV AL,3FH
 OUT DX,AL
 DEC DX
 MOV SI,MSGS
 MOV CX,SFX-MSGS
 REP OUTSB
 JMP TIMER

MAIN:
 MOV AH,01H                  ; check keyboard buffer
 INT 16H
 JZ PRINT
 MOV AH,00H
 INT 16H
 CMP AH,1                    ; key ESC
 JE RESET                    ; exit

 CMP AL,9                    ; key TAB
 JNE @F
 MOV AL,[BANK+19]
 XCHG [BANK+15],AL
 MOV [BANK+19],AL
 MOV AL,[BANK+17]
 XCHG [BANK+13],AL
 MOV [BANK+17],AL
 MOV AL,[BANK+11]
 XCHG [BANK+5],AL
 MOV [BANK+11],AL
 MOV AL,[BANK+8]
 XCHG [BANK+2],AL
 MOV [BANK+8],AL
 MOV AL,[NON+10]
 XCHG [NON+4],AL
 MOV [NON+10],AL
 MOV AL,[NON+7]
 XCHG [NON+1],AL
 MOV [NON+7],AL
 MOV AL,[NON2+11]
 XCHG [NON2+5],AL
 MOV [NON2+11],AL
 MOV AL,[NON2+8]
 XCHG [NON2+2],AL
 MOV [NON2+8],AL
@@:

 CMP AH,57                   ; key SPACE
 JNE @F
 MOV AL,[BANK+19]
 MOV [BANK+15],AL
 MOV AL,[BANK+17]
 MOV [BANK+13],AL
 MOV AL,[BANK+11]
 MOV [BANK+5],AL
 MOV AL,[BANK+8]
 MOV [BANK+2],AL
 MOV AL,[NON+10]
 MOV [NON+4],AL
 MOV AL,[NON+7]
 MOV [NON+1],AL
 MOV AL,[NON2+11]
 MOV [NON2+5],AL
 MOV AL,[NON2+8]
 MOV [NON2+2],AL
@@:

 CMP AH,2                    ; key 1
 JNE @F
 CMP BYTE [BANK+19],0
 JE @F
 DEC BYTE [BANK+19]
@@:
 CMP AH,3                    ; key 2
 JNE @F
 CMP BYTE [BANK+19],127
 JE @F
 INC BYTE [BANK+19]
@@:
 CMP AH,4                    ; key 3
 JNE @F
 CMP BYTE [BANK+11],0
 JE @F
 DEC BYTE [BANK+11]
@@:
 CMP AH,5                    ; key 4
 JNE @F
 CMP BYTE [BANK+11],9
 JE @F
 INC BYTE [BANK+11]
@@:
 CMP AH,6                    ; key 5
 JNE @F
 CMP BYTE [NON+10],0
 JE @F
 DEC BYTE [NON+10]
@@:
 CMP AH,7                    ; key 6
 JNE @F
 CMP BYTE [NON+10],127
 JE @F
 INC BYTE [NON+10]
@@:
 CMP AH,8                    ; key 7
 JNE @F
 CMP BYTE [NON2+11],0
 JE @F
 SHR BYTE [NON2+11],1
@@:
 CMP AH,9                    ; key 8
 JNE @F
 CMP BYTE [NON2+11],127
 JE @F
 SHL BYTE [NON2+11],1
 INC BYTE [NON2+11]
@@:

 CMP AH,16                   ; key q
 JNE @F
 CMP BYTE [BANK+17],0
 JE @F
 DEC BYTE [BANK+17]
@@:
 CMP AH,17                   ; key w
 JNE @F
 CMP BYTE [BANK+17],127
 JE @F
 INC BYTE [BANK+17]
@@:
 CMP AH,18                   ; key e
 JNE @F
 CMP BYTE [BANK+8],0
 JE @F
 DEC BYTE [BANK+8]
@@:
 CMP AH,19                   ; key r
 JNE @F
 CMP BYTE [BANK+8],9
 JE @F
 INC BYTE [BANK+8]
@@:
 CMP AH,20                   ; key t
 JNE @F
 CMP BYTE [NON+7],0
 JE @F
 DEC BYTE [NON+7]
@@:
 CMP AH,44                   ; key z
 JNE @F
 CMP BYTE [NON+7],127
 JE @F
 INC BYTE [NON+7]
@@:
 CMP AH,22                   ; key u
 JNE @F
 CMP BYTE [NON2+8],0
 JE @F
 SHR BYTE [NON2+8],1
@@:
 CMP AH,23                   ; key i
 JNE @F
 CMP BYTE [NON2+8],127
 JE @F
 SHL BYTE [NON2+8],1
 INC BYTE [NON2+8]
@@:

 CMP AH,30                   ; key a
 JNE @F
 CMP BYTE [BANK+15],0
 JE @F
 DEC BYTE [BANK+15]
@@:
 CMP AH,31                   ; key s
 JNE @F
 CMP BYTE [BANK+15],127
 JE @F
 INC BYTE [BANK+15]
@@:
 CMP AH,32                   ; key d
 JNE @F
 CMP BYTE [BANK+5],0
 JE @F
 DEC BYTE [BANK+5]
@@:
 CMP AH,33                   ; key f
 JNE @F
 CMP BYTE [BANK+5],9
 JE @F
 INC BYTE [BANK+5]
@@:
 CMP AH,34                   ; key g
 JNE @F
 CMP BYTE [NON+4],0
 JE @F
 DEC BYTE [NON+4]
@@:
 CMP AH,35                   ; key h
 JNE @F
 CMP BYTE [NON+4],127
 JE @F
 INC BYTE [NON+4]
@@:
 CMP AH,36                   ; key j
 JNE @F
 CMP BYTE [NON2+5],0
 JE @F
 SHR BYTE [NON2+5],1
@@:
 CMP AH,37                   ; key k
 JNE @F
 CMP BYTE [NON2+5],127
 JE @F
 SHL BYTE [NON2+5],1
 INC BYTE [NON2+5]
@@:

 CMP AH,21                   ; key y
 JNE @F
 CMP BYTE [BANK+13],0
 JE @F
 DEC BYTE [BANK+13]
@@:
 CMP AH,45                   ; key x
 JNE @F
 CMP BYTE [BANK+13],127
 JE @F
 INC BYTE [BANK+13]
@@:
 CMP AH,46                   ; key c
 JNE @F
 CMP BYTE [BANK+2],0
 JE @F
 DEC BYTE [BANK+2]
@@:
 CMP AH,47                   ; key v
 JNE @F
 CMP BYTE [BANK+2],9
 JE @F
 INC BYTE [BANK+2]
@@:
 CMP AH,48                   ; key b
 JNE @F
 CMP BYTE [NON+1],0
 JE @F
 DEC BYTE [NON+1]
@@:
 CMP AH,49                   ; key n
 JNE @F
 CMP BYTE [NON+1],127
 JE @F
 INC BYTE [NON+1]
@@:
 CMP AH,50                   ; key m
 JNE @F
 CMP BYTE [NON2+2],0
 JE @F
 SHR BYTE [NON2+2],1
@@:
 CMP AH,51                   ; key ,
 JNE @F
 CMP BYTE [NON2+2],127
 JE @F
 SHL BYTE [NON2+2],1
 INC BYTE [NON2+2]
@@:

 CMP AH,77
 JNE @F
 CMP BYTE [TIMER+5],10
 JE @F
 DEC BYTE [TIMER+5]
@@:
 CMP AH,75
 JNE PRINT
 CMP BYTE [TIMER+5],0
 JE PRINT
 INC BYTE [TIMER+5]
TIMER:
 MOV AL,93H;168
 OUT 40H,AL
 MOV AL,13
 OUT 40H,AL

PRINT:
 TEST BYTE [FS:417H],64      ; test caps-lock state
 JZ @F
 MOV SI,[COUNTER]
 SHR SI,7
 AND SI,6
 ADD SI,NOTES
 LODSB
 MOV [NON+1],AL
 MOV [NON+4],AL
 MOV [NON+7],AL
 MOV [NON+10],AL
 LODSB
 MOV [NON2+2],AL
 MOV [NON2+5],AL
 MOV [NON2+8],AL
 MOV [NON2+11],AL
@@:

 MOV BH,0
 MOV AH,2
 CWD
 INT 10H                     ; set cursor pos to the topleft corner

 MOV SI,infotxt
 CALL PRINTSTRLN.1
 MOV BL,2                    ; color green
 TEST BYTE [FS:417H],64      ; test caps-lock state
 JZ @F
 MOV BL,4                    ; color red
@@:
 MOV AX,[COUNTER+1]          ; pattern
 SHR AX,9
 CALL PRINTNUM8
 MOV AX,[COUNTER]            ; counter
 CALL PRINTNUM16
 MOV AL,' '
 INT 10H
 INT 10H

 CALL NEWLINE
 MOV SI,timertxt
 CALL PRINTSTR
 MOV AL,[TIMER+5]
 CALL PRINTNUM8

 MOV SI,freqtxt
 CALL PRINTSTR
 MOV CL,[TIMER+1]
 MOV CH,[TIMER+5]
 MOV AX,0012H
 MOV DX,34DDH
 JCXZ @F
 XCHG AX,DX
 DIV CX
@@:
 CALL PRINTNUM16

 MOV DI,BANK+19
 MOV BP,11
CHANELS:
 CALL NEWLINE
 MOV SI,channeltxt
 CALL PRINTSTR
 MOV AL,[DI-1]
 AND AL,15
 INC AX
 CALL PRINTNUM8
 MOV SI,instrumenttxt
 CALL PRINTSTR
 MOV AL,[DI]
 CALL PRINTNUM8
 MOV SI,banktxt
 CALL PRINTSTR
 MOV AL,[BANK+BP]
 CALL PRINTNUM8
 MOV SI,notetxt
 CALL PRINTSTR
 MOV AL,[NON-1+BP]
 CALL PRINTNUM8
 MOV SI,velocitytxt
 CALL PRINTSTR
 MOV AL,[NON2+BP]
 CALL PRINTNUM8
 MOV AL,' '
 INT 10H
 INT 10H
 DEC DI
 DEC DI
 SUB BP,3
 JNC CHANELS

 JMP MAIN

NEWLINE:
 MOV AX,0E0DH
 INT 10H
 MOV AL,0AH
 INT 10H
RETN

PRINTSTRLN:
 CALL NEWLINE
.1:
 MOV BL,14                   ; color yellow
 CALL PRINTSTR.1
 MOV AL,' '
 INT 10H
RETN

PRINTSTR:
 MOV BL,15
.1:
 LODSB
 MOV AH,0EH
 INT 10H
 CMP [SI],BH
 JNE .1
 MOV BL,11                   ; color cyan
RETN

PRINTNUM8:
 MOV    AH,0
PRINTNUM16:
 MOVZX  EAX,AX
PRINTNUM32:
.0:
 SUB    CX,CX
.1:
 SUB    EDX,EDX
 MOV    ESI,10
 DIV    ESI
 ADD    DL,'0'
 PUSH   DX
 INC    CX
 TEST   EAX,EAX
 JNZ    .1
.2:
 POP    AX
 MOV    AH,0EH
 INT    10H
 LOOP   .2
 MOV    AL,' '
 INT    10H
RETN

infotxt:
 DB 'MidiXfader 0.4 by Abaddon',0
timertxt:
 DB 'timer:',0
freqtxt:
 DB 'freq:',0
instrumenttxt:
 DB 'patch',0
banktxt:
 DB 'bank',0
notetxt:
 DB 'note',0
velocitytxt:
 DB 'vel',0
channeltxt:
 DB 'ch',0

IRQ:
 PUSHA
 PUSH DS
 PUSH CS
 POP DS
 MOV SI,SFX
 MOV AL,[SI-SFX+COUNTER]
 AND AL,63
 MOV BYTE [SI-SFX+VOL+8],64
 ADD [SI-SFX+VOL+8],AL
 MOV BYTE [SI-SFX+VOL+11],127
 SUB [SI-SFX+VOL+11],AL
 SHL AL,1
 MOV BYTE [SI-SFX+VOL+2],AL
; MOV BYTE [SI-SFX+VOL+8],AL
 XOR AL,126
 MOV BYTE [SI-SFX+VOL+5],AL
; MOV BYTE [SI-SFX+VOL+11],AL

 MOV CX,NON-SFX
 MOV AL,[SI-SFX+COUNTER]
 TEST AL,63
 JNZ NONOTE
 AND AL,127
 CMP AL,64
NON2:
 SALC
 MOV AH,0
 PUSH AX
 MOV AH,0
 PUSH AX
 MOV AH,127
 PUSH AX
 MOV AH,127

 AND AH,AL
 MOV BYTE [SI-SFX+NON+11],AH
 POP AX
 AND AH,AL
 MOV BYTE [SI-SFX+NON+8],AH
 POP AX
 AND AH,AL
 MOV BYTE [SI-SFX+NON+5],AH
 POP AX
 AND AH,AL
 MOV BYTE [SI-SFX+NON+2],AH
 MOV CL,NON-SFX+3*4
NONOTE:

 MOV DX,330H
 INC DWORD [SI-SFX+COUNTER]
 REP OUTSB

 MOV AL,20H
 OUT 20H,AL
 POP DS
 POPA
IRET

RESET:
 POP DX
 POP DS
 MOV AX,2508H
 INT 21H
 MOV DX,330H
 MOV CX,4
.1:
 MOV AL,0B3H+1
 SUB AL,CL
 OUT DX,AL
 MOV AL,123
 OUT DX,AL
 OUT DX,AL
 LOOP .1
 POP AX
 OUT 40H,AL
 OUT 40H,AL
 MOV AL,03H
 INT 10H
RETN

NOTES:
 DB 32,127
 DB 31,127
 DB 30,127
 DB 35,0

MSGS:
 DB 0F0H,041H,010H,042H,012H,040H,000H,07FH,000H,041H,0F7H ; GS Reset
;DB 0F0H,07EH,07FH,009H,001H,0F7H ; GM1 System On
;DB 0F0H,07EH,07FH,009H,002H,0F7H ; GM System Off
;DB 0F0H,07EH,07FH,009H,003H,0F7H ; GM2 System On
SFX:

BANK:
 DB 0B3H,0,0
 DB 0B2H,0,0
 DB 0B1H,0,0
 DB 0B0H,0,0
 DB 0C3H,107
 DB 0C2H,47
 DB 0C1H,81
 DB 0C0H,35
VOL:
 DB 0B3H,7,0
 DB 0B2H,7,0
 DB 0B1H,7,0
 DB 0B0H,7,0
NON:
 DB 093H,35,0
 DB 092H,35,0
 DB 091H,35,127
 DB 090H,35,127

COUNTER:
 DD 0