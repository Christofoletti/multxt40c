; msxvars.asm - MSX BIOS system variables
; version 0.5
; 
; www.objectware.net
; 
; This file is part of OpCode IDE templates.
; 
; OpCode IDE is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 3 of the License, or
; (at your option) any later version.
; 
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.
; 
; References:
;     https://www.msx.org/wiki/System_variables_and_work_area

; Name      equ Address     ; Size  - Description
;                          (in bytes)

;; **** Subroutines for inter-slot read/write/call
RDPRIM      equ 0F380H      ; 5     - Read from primary slot, used by RDSLT (000Ch) routine from Main-ROM
WRPRIM      equ 0F385H      ; 7     - Write to primary slot, used by WRSLT (0014h) routine from Main-ROM
CLPRIM      equ 0F38CH      ; 14    - Call primary slot, used by CALSLT (001Ch) routine from Main-ROM

;; **** Addresses for extra subroutines in machine language
USRTAB0     equ 0F39AH      ; 2     - Address specified with DEFUSR0
USRTAB1     equ 0F39CH      ; 2     - Address specified with DEFUSR1
USRTAB2     equ 0F39EH      ; 2     - Address specified with DEFUSR2
USRTAB3     equ 0F3A0H      ; 2     - Address specified with DEFUSR3
USRTAB4     equ 0F3A2H      ; 2     - Address specified with DEFUSR4
USRTAB5     equ 0F3A4H      ; 2     - Address specified with DEFUSR5
USRTAB6     equ 0F3A6H      ; 2     - Address specified with DEFUSR6
USRTAB7     equ 0F3A8H      ; 2     - Address specified with DEFUSR7
USRTAB8     equ 0F3AAH      ; 2     - Address specified with DEFUSR8
USRTAB9     equ 0F3ACH      ; 2     - Address specified with DEFUSR9

;; **** Screen Parameters
LINL40      equ 0F3AEH      ; 1     - Screen width in SCREEN 0 (Default 39)
LINL32      equ 0F3AFH      ; 1     - Screen width in SCREEN 1 (Default 29)
LINLEN      equ 0F3B0H      ; 1     - Current screen width 
CRTCNT      equ 0F3B1H      ; 1     - Number of lines of current screen (default 24)
CLMLST      equ 0F3B2H      ; 1     - X-location in the case that items are divided by commas in PRINT. (LINLEN-(LINLEN MOD 14)-14)
TXTNAM      equ 0F3B3H      ; 2     - SCREEN 0 pattern name table address
TXTCOL      equ 0F3B5H      ; 2     - SCREEN 0 color table address
TXTCGP      equ 0F3B7H      ; 2     - SCREEN 0 Pattern generator table address
TXTATR      equ 0F3B9H      ; 2     - Unused
TXTPAT      equ 0F3BBH      ; 2     - Unused
T32NAM      equ 0F3BDH      ; 2     - SCREEN 1 pattern name table address
T32COL      equ 0F3BFH      ; 2     - SCREEN 1 color table address
T32CGP      equ 0F3C1H      ; 2     - SCREEN 1 pattern generator table address
T32ATR      equ 0F3C3H      ; 2     - SCREEN 1 sprite attribute table address
T32PAT      equ 0F3C5H      ; 2     - SCREEN 1 sprite generator table address
GRPNAM      equ 0F3C7H      ; 2     - SCREEN 2 pattern name table address
GRPCOL      equ 0F3C9H      ; 2     - SCREEN 2 color table address
GRPCGP      equ 0F3CBH      ; 2     - SCREEN 2 pattern generator table address
GRPATR      equ 0F3CDH      ; 2     - SCREEN 2 sprite attribute table address
GRPPAT      equ 0F3CFH      ; 2     - SCREEN 2 sprite generator table address
MLTNAM      equ 0F3D1H      ; 2     - SCREEN 3 pattern name table address
MLTCOL      equ 0F3D3H      ; 2     - SCREEN 3 color table address
MLTCGP      equ 0F3D5H      ; 2     - SCREEN 3 pattern generator table address
MLTATR      equ 0F3D7H      ; 2     - SCREEN 3 sprite attribute table address
MLTPAT      equ 0F3D9H      ; 2     - SCREEN 3 sprite generator table address

;; **** Cursor and function key parameters
CLIKSW      equ 0F3DBH      ; 1     - Key click switch. (0 = Disabled / 1-FF = Enabled)
CSRY        equ 0F3DCH      ; 1     - Y-coordinate of text cursor (1..CRTCNT)
CSRX        equ 0F3DDH      ; 1     - X-coordinate of text cursor (1..LINLEN)
CONSDFG     equ 0F3DEH      ; 1     - Display function keys flag (0 = do not display keys)

;; **** Area to save the last writing value in VDP registers (used by VDP(n) in basic)
RG0SAV      equ 0F3DFH      ; 1     - VDP register R#00 status
RG1SAV      equ 0F3E0H      ; 1     - VDP register R#01 status
RG2SAV      equ 0F3E1H      ; 1     - VDP register R#02 status
RG3SAV      equ 0F3E2H      ; 1     - VDP register R#03 status
RG4SAV      equ 0F3E3H      ; 1     - VDP register R#04 status
RG5SAV      equ 0F3E4H      ; 1     - VDP register R#05 status
RG6SAV      equ 0F3E5H      ; 1     - VDP register R#06 status
RG7SAV      equ 0F3E6H      ; 1     - VDP register R#07 status
STATFL      equ 0F3E7H      ; 1     - Copy from status register R#00 (used by VDP(0) in basic)

;; **** Space bar/Triggers status
TRGFLG      equ 0F3E8H      ; 1     - Stores trigger button status of joystick/space bar

;; **** Color and drawing parameters
FORCLR      equ 0F3E9H      ; 1     - Foreground color
BAKCLR      equ 0F3EAH      ; 1     - Background  color
BDRCLR      equ 0F3EBH      ; 1     - Border color
MAXUPD      equ 0F3ECH      ; 3     - Work area used by CIRCLE instruction (contains JP 0000H at start)
MINUPD      equ 0F3EFH      ; 3     - Work area used by CIRCLE instruction (contains JP 0000H at start)
ATRBYT      equ 0F3F2H      ; 1     - Tracing attribute (plot color for graphic routines)

;; **** MML
QUEUES      equ 0F3F3H      ; 2     - QUETAB table address used by PLAY (default F959H)
FRCNEW      equ 0F3F5H      ; 1     - Work area size for PLAY (255 by default)

;; **** Key input parameters
SCNCNT      equ 0F3F6H      ; 1     - Interval for the key scan. Permanently set by the Basic
REPCNT      equ 0F3F7H      ; 1     - Delay until the auto-repeat of the key begins. (default 50)
PUTPNT      equ 0F3F8H      ; 2     - Address of first free byte in the keyboard buffer KEYBUF (default FBF0H)
GETPNT      equ 0F3FAH      ; 2     - Address of the next data from the keyboard (in the keyboard buffer))

;; **** Cassette parameters (until MSX2+)
CS1200      equ 0F3FCH      ; 5     - Work area of the data recorder 1200 baud
CS2400      equ 0F401H      ; 5     - Work area of the data recorder 2400 baud
CASLOW      equ 0F406H      ; 2     - Settings for the tape player: LO cycle
CASHIGH     equ 0F408H      ; 2     - Settings for the tape player: HI cycle
HEADER      equ 0F40AH      ; 1     - Length of the current header signal

;; **** Aspect ratio settings for CIRCLE
ASPCT1      equ 0F40BH      ; 2     - 256/aspect ratio for Basic instruction CIRCLE
ASPCT2      equ 0F40DH      ; 2     - 256*aspect ratio for Basic instruction CIRCLE

;; **** Basic interpreter parameters, variables and buffers
ENDPRG      equ 0F40FH      ; 5     - Dummy program end for instructions RESUME ... NEXT. (default DB ":",0,0,0,0)
ERRFLG      equ 0F414H      ; 1     - Last error code occurred in BASIC
LPTPOS      equ 0F415H      ; 1     - Position of printer head
PRTFLG      equ 0F416H      ; 1     - Flag whether to send to printer (0 = screen / other = printer)
NTMSXP      equ 0F417H      ; 1     - 0 If MSX printer (This converts Hiragana to Katakana on Japanese MSX)
RAWPRT      equ 0F418H      ; 1     - 0 to convert TAB's and unknown characters to spaces
VLZADR      equ 0F419H      ; 2     - Address of character replaced by VAL
VLZDAT      equ 0F41BH      ; 1     - Character replaced with 0 by VAL
CURLIN      equ 0F41CH      ; 2     - Current execution line number of Basic
KBFMIN      equ 0F41EH      ; 1     - Used if direct statement error occures
KBUF        equ 0F41FH      ; 318   - Crunch buffer; translated into intermediate language from BUF
BUFMIN      equ 0F55DH      ; 1     - Used by INPUT routine
BUF         equ 0F55EH      ; 258   - Buffer to store characters displayed to screen under Basic in direct mode
ENDBUF      equ 0F660H      ; 1     - Flag to prevent overflow of BUF
TTYPOS      equ 0F661H      ; 1     - Virtual cursor location internally retained by BASIC
DIMFLG      equ 0F662H      ; 1     - DIM instruction flag
VALTYP      equ 0F663H      ; 1     - Contains the code of the type of variable that is currently in DAC
DORES       equ 0F664H      ; 1     - Tempory flag for BASIC interpreter that indicates if stored keyword can be tokenized or not
OPRTYP      equ 0F664H      ; 1     - When an operator used with an instruction, its type is stored momentarily here
DONUM       equ 0F665H      ; 1     - Flag for the number encoding (IEEE 754-1985)
CONTXT      equ 0F666H      ; 2     - Temporary save of the text pointer
CONSAV      equ 0F668H      ; 1     - Store token of constant after calling CHRGTR (00010h en Main-ROM)
CONTYP      equ 0F669H      ; 1     - Type of stored constant, used by CHRGTR (00010h en Main-ROM)
CONLO       equ 0F66AH      ; 8     - Value of stored constant
MEMSIZ      equ 0F66AH      ; 2     - Highest location in memory used by Basic
STKTOP      equ 0F674H      ; 2     - Top location to be used for the stack
TXTTAB      equ 0F676H      ; 2     - Start address of the Basic program to load
TEMPPT      equ 0F678H      ; 2     - Starting address of unused area of temporary descriptor
TEMPST      equ 0F67AH      ; 30    - Temporary descriptors
DSCTMP      equ 0F698H      ; 3     - Contains the length and position of the "Ok" message of the BASIC
FRETOP      equ 0F69BH      ; 2     - Starting address of unused area of string area
TEMP3       equ 0F69DH      ; 2     - Used for garbage collection or by USR function
TEMP8       equ 0F69FH      ; 2     - Used for garbage collection
ENDFOR      equ 0F6A1H      ; 2     - Next address of the instruction FOR, used by NEXT
DATLIN      equ 0F6A3H      ; 2     - Line number of the instruction DATA read by READ
SUBFLG      equ 0F6A5H      ; 1     - Flag for array for USR fun
FLGINP      equ 0F6A6H      ; 1     - Flag for the instruction INPUT or READ (0 = INPUT / (1-255) = READ)
TEMP        equ 0F6A7H      ; 2     - Location for temporary reservation for st.code
PTRFLG      equ 0F6A9H      ; 1     - Pointer line number conversion flag for the Basic interpreter
AUTFLG      equ 0F6AAH      ; 1     - Auto mode flag (0 = Yes / other = No)
AUTLIN      equ 0F6ABH      ; 2     - Current line number for auto
AUTINC      equ 0F6ADH      ; 2     - Increment for auto
SAVTXT      equ 0F6AFH      ; 2     - Text pointer for resume
SAVSTK      equ 0F6B1H      ; 2     - Save stack when an error occurs
ERRLIN      equ 0F6B3H      ; 2     - Line number where last error in BASIC
DOT         equ 0F6B5H      ; 2     - Current line number displayed by LIST
ERRTXT      equ 0F6B7H      ; 2     - Pointer to the error message
ONELIN      equ 0F6B9H      ; 2     - Line number to go when error, Used by ON ERROR GOTO
ONEFLG      equ 0F6BBH      ; 1     - Error flag for the instruction ON ERROR GOTO
TEMP2       equ 0F6BCH      ; 2     - Work area for the formula evaluation routine
OLDLIN      equ 0F6BEH      ; 2     - Line number stored after the execution of the instruction STOP or END, or by pressing CTRL+STOP
OLDTXT      equ 0F6C0H      ; 2     - Old text pointer. The pointer is directed to the instruction following the one where the stop occurred

;; **** Data and variables of Basic
VARTAB      equ 0F6C2H      ; 2     - Pointer to the beginning of single variables area
ARYTAB      equ 0F6C4H      ; 2     - Pointer to the beginning of array variables area
STREND      equ 0F6C6H      ; 2     - Address of the end of the variable area
DATPTR      equ 0F6C8H      ; 2     - Pointer to next data to read from the instruction DATA. Modified by RESTORE
DEFTBL      equ 0F6CAH      ; 26    - Declaration table of variables defined by the instructions DEFINT, DEFSTR, DEFSNG and DEFDBL

;; **** Function and parameters of Basic
PRMSTK      equ 0F6E4H      ; 2     - Previous definition block on the stack. (To clean the waste)
PRMLEN      equ 0F6E6H      ; 2     - Number of bytes used in PARM1
PARM1       equ 0F6E8H      ; 100   - Area 1 for parameters block storage (FN buffer)
PRMPRV      equ 0F74CH      ; 2     - Pointer to previous parameter block in PARM1
PRMLN2      equ 0F74EH      ; 2     - Number of bytes used in PARM2
PARM2       equ 0F750H      ; 100   - Area 2 for to store the blocks being created (FN buffer)
PRMFLG      equ 0F7B4H      ; 1     - Flag to indicate whether PARM1 was searching
ARYTA2      equ 0F7B5H      ; 2     - End point of search
NOFUNS      equ 0F7B7H      ; 1     - 0 if no function active
TEMP9       equ 0F7B8H      ; 2     - Location of temporary storage for garbage collection
FUNACT      equ 0F7BAH      ; 1     - Count of active functions
SWPTMP      equ 0F7BCH      ; 8     - Value of first variable in instruction SWAP

;; **** Graphic tracing
TRCFLG      equ 0F7C4H      ; 1     - Tracing flag (0 = No tracing; Other = Tracing in progress)

;; **** Math pack
FBUFFR      equ 0F7C5H      ; 43    - Buffer used by mathematical routines
DECTMP      equ 0F7F0H      ; 2     - Used to transform decimal integer to floating point number
DECTM2      equ 0F7F2H      ; 2     - Used by the divisions
DECCNT      equ 0F7F4H      ; 2     - Used by the divisions
DAC         equ 0F7F6H      ; 16    - Decimal accumulator
HOLD8       equ 0F806H      ; 48    - Work area for decimal multiplications
HOLD2       equ 0F836H      ; 8     - Work area in the execution of numerical operators
HOLD        equ 0F83EH      ; 8     - Work area in the execution of numerical operators
ARG         equ 0F847H      ; 16    - Argument (Value used to be calculate with DAC)
RNDX        equ 0F857H      ; 8     - Last random number generated

;; **** Display
MAXFIL      equ 0F85FH      ;       - Número de buffers de E/S alocados (BASIC)
FILTAB      equ 0F860H      ;       - Aponta para a tabela de FCBs dos buffers de E/S (BASIC)
NULBUF      equ 0F862H      ;       - Aponta para o buffer de E/S
PTRFIL      equ 0F864H      ;       - Aponta para o FCB do buffer de E/S ativo
FILNAM      equ 0F866H      ;       - Buffer de nome de arquivo. (BASIC)
FILNM2      equ 0F871H      ;       - Buffer de nome de arquivo. (BASIC)
NLONLY      equ 0F87CH      ;       - Usada pelo interpretador BASIC
SAVEND      equ 0F87DH      ;       - Usada pelo interpretador BASIC

;; **** 
FNKSTR      equ 0F87FH      ;       - Buffer com strings das teclas de função
CGPNT       equ 0F91FH      ;       - Aponta para a tabela de caracteres em ROM (Slot ID 0 seguido do endereço 0x1BBF)
NAMBAS      equ 0F922H      ;       - Base da tabela de nomes no modo de video atual
CGPBAS      equ 0F924H      ;       - Base da tabela de caracteres no modo de video atual
PATBAS      equ 0F926H      ;       - Base da tabela de imagens de sprites no modo de ví deo atual
ATRBAS      equ 0F928H      ;       - Base da tabela de atributos de sprites no modo de ví deo atual
CLOC        equ 0F92AH      ;       - Endereço do pixel atual (funções gráficas da BIOS)
CMASK       equ 0F92CH      ;       - Máscara do pixel atual
MINDEL      equ 0F92DH      ;       - Usado pela instrução LINE
MAXDEL      equ 0F92FH      ;       - Usado pela instrução LINE
ASPECT      equ 0F931H      ;       - Usado pela instrução CIRCLE
CENCNT      equ 0F933H      ;       - Usado pela instrução CIRCLE
CLINEF      equ 0F935H      ;       - Usado pela instrução CIRCLE
CNPNTS      equ 0F936H      ;       - Usado pela instrução CIRCLE
CPLOTF      equ 0F938H      ;       - Usado pela instrução CIRCLE
CPCNT       equ 0F939H      ;       - Usado pela instrução CIRCLE
CPCNT8      equ 0F93BH      ;       - Usado pela instrução CIRCLE
CRCSUM      equ 0F93DH      ;       - Usado pela instrução CIRCLE
CSTCNT      equ 0F93FH      ;       - Usado pela instrução CIRCLE
CSCLXY      equ 0F941H      ;       - Usado pela instrução CIRCLE
CSAVEA      equ 0F942H      ;       - Temporário usado por funções gráficas da BIOS
CSAVEM      equ 0F944H      ;       - Temporário usado por funções gráficas da BIOS
CXOFF       equ 0F945H      ;       - Usado pela instrução CIRCLE
CYOFF       equ 0F947H      ;       - Usado pela instrução CIRCLE
LOHMSK      equ 0F949H      ;       - Usado pela instrução PAINT
LOHDIR      equ 0F94AH      ;       - Usado pela instrução PAINT
LOHADR      equ 0F94BH      ;       - Usado pela instrução PAINT
LOHCNT      equ 0F94DH      ;       - Usado pela instrução PAINT
SKPCNT      equ 0F94FH      ;       - Usado pela instrução PAINT
MOVCNT      equ 0F951H      ;       - Usado pela instrução PAINT
PDIREC      equ 0F953H      ;       - Usado pela instrução PAINT
LEPROG      equ 0F954H      ;       - Usado pela instrução PAINT
RTPROG      equ 0F955H      ;       - Usado pela instrução PAINT
MCLFLG      equ 0F958H      ;       - Linguagem de macro atual, 0=DRAW, 1-255=PLAY
QUETAB      equ 0F959H      ;       - Blocos de controle das filas musicais
QUEBAK      equ 0F971H      ;       - Usado pelo manipulador de fila musical
VOICAQ      equ 0F975H      ;       - Buffer da fila musical A
VOICBQ      equ 0F9F5H      ;       - Buffer da fila musical B
VOICCQ      equ 0FA75H      ;       - Buffer da fila musical C
RS2IQ       equ 0FAF5H      ;       - Buffer da fila RS232
PRSCNT      equ 0FB35H      ;       - Usado pelo interpretador BASIC (PLAY)
SAVSP       equ 0FB36H      ;       - Usado pelo interpretador BASIC (PLAY)
VOICEN      equ 0FB38H      ;       - Voz atual do interpretador PLAY
SAVVOL      equ 0FB39H      ;       - Usado pelo interpretador BASIC (PLAY)
MCLLEN      equ 0FB3BH      ;       - Comprimento do operando de macro-linguagem analisado
MCLPTR      equ 0FB3CH      ;       - Aponta para caractere de macro-linguagem sendo analisado
QUEUEN      equ 0FB3EH      ;       - Fila atual do interpretador PLAY
MUSICF      equ 0FB3FH      ;       - Usado pelo interpretador BASIC (PLAY)
PLACNT      equ 0FB40H      ;       - Usado pelo interpretador BASIC (PLAY)
VCBA        equ 0FB41H      ;       - 37  - Data for voice A
VCBB        equ 0FB66H      ;       - 37  - Data for voice B
VCBC        equ 0FB8BH      ;       - 37  - Data for voice C
ENSTOP      equ 0FBB0H      ;       - 1   - <>0 when it is possible to resume execution of a BASIC program (CTRL+SHIFT+GRPH+KANA/CODE to resume)
BASROM      equ 0FBB1H      ;       - 1   - <>0 if basic is in rom. (CTRL+STOP disabled)
LINTTB      equ 0FBB2H      ;       - 24  - Table of 24 end-of-line flags for each physical line
FSTPOS      equ 0FBCAH      ;       - Usada internamente pelo editor de tela do BASIC
CURSAV      equ 0FBCCH      ;       - Armazena o caractere sob o cursor
FNKSWI      equ 0FBCDH      ;       - Usada pela rotina CHSNS para determinar se SHIFT está pressionado (0) ou não (1) para apresentar as strings das teclas de função
FNKFLG      equ 0FBCEH      ;       - Usada pelo BASIC. (indicadores de KEY(n) ON)
ONGSBF      equ 0FBD8H      ;       - Usado pelo interpretador BASIC
OLDKEY      equ 0FBDAH      ;       - Armazena o estado anterior da matriz de teclado
NEWKEY      equ 0FBE5H      ;       - Armazena o estado atual da matriz de teclado
KEYBUF      equ 0FBF0H      ;       - Buffer circular do teclado (caracteres decodificados)
LINWRK      equ 0FC18H      ;       - Buffer de linha de tela, usado pelo BIOS
PATWRK      equ 0FC40H      ;       - Buffer usado pelo BIOS
BOTTOM      equ 0FC48H      ;       - Armazena o início da RAM usada pelo interpretador BASIC
TRPTBL      equ 0FC4CH      ;       - Usado pelas instruções de interrupção (ON...) do BASIC
RTYCNT      equ 0FC9AH      ;       - Não-utilizada
INTFLG      equ 0FC9BH      ;       - Flag de detecção de CTRL-STOP (3) e STOP (4)
PADY        equ 0FC9CH      ;       - Última coordenada Y do tablet
PADX        equ 0FC9DH      ;       - Última coordenada X do tablet
JIFFY       equ 0FC9EH      ;       - Contador incrementado a cada interrupção do VDP
INTVAL      equ 0FCA0H      ;       - Duração do intervalo do ON INTERVAL (BASIC)
INTCNT      equ 0FCA2H      ;       - Contador do ON INTERVAL (BASIC)
LOWLIM      equ 0FCA4H      ;       - Duração mí nima do bit de partida no cassete (TAPION)
WINWID      equ 0FCA5H      ;       - Duração de discriminação LO/HI (TAPION)
GRPHED      equ 0FCA6H      ;       - Variável auxiliar da rotina CNVCHR do BIOS
ESCCNT      equ 0FCA7H      ;       - Variável auxiliar da rotina CHPUT do BIOS
INSFLG      equ 0FCA8H      ;       - Indica modo de inserção do editor de tela
CSRSW       equ 0FCA9H      ;       - Cursor display switch
CSTYLE      equ 0FCAAH      ;       - Estilo do cursor, bloco (0) ou sublinhado (1-255)
CAPST       equ 0FCABH      ;       - Status do CAPS LOCK (0=desligado, 1-255=ligado)
KANAST      equ 0FCACH      ;       - Status do KANA LOCK (0=desligado, 1-255=ligado)
KANAMD      equ 0FCADH      ;       - Modo kana (MSX japoneses)
FLBMEM      equ 0FCAEH      ;       - Usada pelo manipulador de erro de E/S
SCRMOD      equ 0FCAFH      ;       - Modo de tela (SCREEN) atual
OLDSCR      equ 0FCB0H      ;       - último modo de texto
CASPRV      equ 0FCB1H      ;       - Temporário de E/S do cassete
BDRATR      equ 0FCB2H      ;       - Usado pelas rotinas gráficas do BIOS
GXPOS       equ 0FCB3H      ;       - Temporário das rotinas gráficas do BIOS
GYPOS       equ 0FCB5H      ;       - Temporário das rotinas gráficas do BIOS
GRPACX      equ 0FCB7H      ;       - Temporário das rotinas gráficas do BIOS
GRPACY      equ 0FCB9H      ;       - Temporário das rotinas gráficas do BIOS
DRWFLG      equ 0FCBBH      ;       - Usado pelo manipulador do DRAW
DRWSCL      equ 0FCBCH      ;       - Usado pelo manipulador do DRAW
DRWANG      equ 0FCBDH      ;       - Usado pelo manipulador do DRAW
RUNBNF      equ 0FCBEH      ;       - Usado pelo manipulador do BLOAD
SAVENT      equ 0FCBFH      ;       - Usado pelo manipulador do BLOAD
EXPTBL      equ 0FCC1H      ;       - Indicadores de expansão dos 4 slots, (0x00=não expandido, 0x80=expandido)
SLTTBL      equ 0FCC5H      ;       - Cópia dos registradores de slot primário (válidos apenas nos slots expandidos)
SLTATR      equ 0FCC9H      ;       - Atributos de ROM, 16 bytes por slot (desses, 4 por subslot)
SLTWRK      equ 0FD09H      ;       - Dois bytes de trabalho local para cada uma das 64 extensões de ROM possí veis
PROCNM      equ 0FD89H      ;       - Buffer para nome de dispositivo ou instrução a ser analisado por uma ROM de extensão
DEVICE      equ 0FD99H      ;       - Usada para passar um número de dispositivo para uma ROM de extensão.