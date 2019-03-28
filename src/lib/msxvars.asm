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
;     https://www.msx.org/wiki/System_variables_for_disks

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
CLIKSW      equ 0F3DBH      ; 1     - Key click switch. (0=Disabled, other=Enabled)
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
PRTFLG      equ 0F416H      ; 1     - Flag whether to send to printer (0=screen, other=printer)
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

;; **** File management under basic
MAXFIL      equ 0F85FH      ; 1     - High legal file number
FILTAB      equ 0F860H      ; 2     - Starting address of of file data area
NULBUF      equ 0F862H      ; 2     - Points to file 0 buffer (used by SAVE/LOAD st)
PTRFIL      equ 0F864H      ; 2     - Points to file data of currently accessing file
RUNFLG      equ 0F866H      ; 1     - Non-zero when Basic program run after load
FILNAM      equ 0F866H      ; 11    - File name from Disk-Basic instruction used
FILNM2      equ 0F871H      ; 11    - Second file name from Disk-Basic instruction used (NAME, COPY, MOVE, etc)
NLONLY      equ 0F87CH      ; 1     - When loading program (0=NON Basic, other=Basic)
SAVEND      equ 0F87DH      ; 2     - End address specified in BSAVE

;; **** Display
FNKSTR      equ 0F87FH      ; 160   - Texts for function keys
CGPNT       equ 0F91FH      ; 2     - Location of the character font used to initialise screen (Slot ID and address)
NAMBAS      equ 0F922H      ; 2     - Current pattern name table address
CGPBAS      equ 0F924H      ; 2     - Current pattern generator table address
PATBAS      equ 0F926H      ; 2     - Current sprite generator table address
ATRBAS      equ 0F928H      ; 2     - Current sprite attribute table address
CLOC        equ 0F92AH      ; 2     - Cursor location
CMASK       equ 0F92CH      ; 1     - Graphic cursor mask (SCREEN 2 to 4) or ordinate (SCREEN 5 to 12)
MINDEL      equ 0F92DH      ; 2     - Work area used by instruction LINE of Basic
MAXDEL      equ 0F92FH      ; 2     - End of the work area used by LINE instruction of Basic

;; **** Data area for the CIRCLE instruction of Basic
ASPECT      equ 0F931H      ; 2     - Aspect ratio of the circle; set by <ratio> of CIRCLE
CENCNT      equ 0F933H      ; 2     - Counter used by CIRCLE
CLINEF      equ 0F935H      ; 1     - Flag to draw line to centre
CNPNTS      equ 0F936H      ; 2     - Point to be plotted in a 45° segment
CPLOTF      equ 0F938H      ; 1     - Plot polarity flag
CPCNT       equ 0F939H      ; 2     - Number of points in 1/8 of circle
CPCNT8      equ 0F93BH      ; 2     - Number of points in the circle
CRCSUM      equ 0F93DH      ; 2     - Cyclic redundancy check sum of the circle
CSTCNT      equ 0F93FH      ; 2     - Variable to maintain the number of points of the starting angle
CSCLXY      equ 0F941H      ; 1     - Scale of X and Y

;; **** Data area for the PAINT instruction of Basic
CSAVEA      equ 0F942H      ; 2     - Address of the first pixel of different color
CSAVEM      equ 0F944H      ; 1     - Mask of the first pixel of different color
CXOFF       equ 0F945H      ; 2     - X offset from center
CYOFF       equ 0F947H      ; 2     - Y offset from center
LOHMSK      equ 0F949H      ; 1     - Leftmost position of an LH excursion
LOHDIR      equ 0F94AH      ; 1     - New painting direction required by an LH excursion
LOHADR      equ 0F94BH      ; 2     - Leftmost position of an LH
LOHCNT      equ 0F94DH      ; 2     - Size of an LH excursion
SKPCNT      equ 0F94FH      ; 2     - Skip count
MOVCNT      equ 0F951H      ; 2     - Movement count
PDIREC      equ 0F953H      ; 1     - Direction of the paint
LEPROG      equ 0F954H      ; 1     - Set to 1 when moving to the left
RTPROG      equ 0F955H      ; 1     - Set to 1 when moving to the right

;; **** RS-232 and MML buffers
MCLTAB      equ 0F956H      ; 2     - Used by the instructions DRAW & PLAY in Basic
MCLFLG      equ 0F958H      ; 1     - Current macro language flag (0=DRAW, 1-255=PLAY)
QUETAB      equ 0F959H      ; 24    - Queue tables (VOICAQ, VOICBQ, VOICCQ and RS2IQ (RS232))
QUEBAK      equ 0F971H      ; 1     - Replacement characters table of queues
VOICAQ      equ 0F975H      ; 128   - Voice A queue of instruction PLAY (PSG)
VOICBQ      equ 0F9F5H      ; 128   - Voice B queue of instruction PLAY
VOICCQ      equ 0FA75H      ; 128   - Voice C queue of instruction PLAY
RS2IQ       equ 0FAF5H      ; 64    - RC-232C queue (MSX1 only)

;; **** Graphic pages (MSX 2 and above)
DPPAGE      equ 0FAF5H      ; 1     - Displayed page number (MSX2~)
ACPAGE      equ 0FAF6H      ; 1     - Destination page number (MSX2~)

;; **** System
AVCSAV      equ 0FAF7H      ; 1     - Copy of AV control port (#F7) content (MSX2+~)
EXBRSA      equ 0FAF8H      ; 1     - SUB-ROM Slot ID (MSX2~)
CHRCNT      equ 0FAF9H      ; 1     - Character counter in the buffer, used in KANA-ROM (MSX2~)
ROMA        equ 0FAFAH      ; 2     - Area to store KANA character (Japanese MSX2~ only)
MODE        equ 0FAFCH      ; 1     - Flag for screen mode
NORUSE      equ 0FAFDH      ; 1     - Used by KANJI-ROM for rendering KANJI fonts in graphic modes (MSX2~)
XSAVE       equ 0FAFEH      ; 2     - X-coordinate for Mouse/Trackball/Lightpen (MSX2~)
YSAVE       equ 0FB00H      ; 2     - Y-coordinate for Mouse/Trackball/Lightpen (MSX2~)
LOGOPR      equ 0FB02H      ; 1     - Logical operation code (MSX2~)

;; **** Data Area Used By RS-232C
RSTMP       equ 0FB03H      ; 1     - Temporary data storage for RS232 Driver
TOCNT       equ 0FB03H      ; 1     - Counter used by the RS-232C interface
RSFCB       equ 0FB04H      ; 2     - FCB ("File Control Block") address of the RS-232C
RSIQLN      equ 0FB06H      ; 1     - Byte DATA used by the RS-232C interface
MEXBIH      equ 0FB07H      ; 5     - Hook called by the RS-232C
OLDSTT      equ 0FB0CH      ; 5     - Hook called by the RS-232C
OLDINT      equ 0FB0CH      ; 5     - Hook called by the RS-232C
DEVNUM      equ 0FB16H      ; 1     - Byte offset (RS-232C)
DATCNT      equ 0FB17H      ; 3     - DATA area (RS-232C)
ERRORS      equ 0FB1AH      ; 1     - RS-232C error code
FLAGS       equ 0FB1BH      ; 1     - RS-232C flags
ESTBLS      equ 0FB1CH      ; 1     - Bit boolean (RS-232C)
COMMSK      equ 0FB1DH      ; 1     - RS-232C mask
LSTCOM      equ 0FB1EH      ; 1     - Byte Data (RS-232C)
LSTMOD      equ 0FB1FH      ; 1     - Byte Data (RS-232C)

;; **** Data area for the PLAY instruction of Basic
PRSCNT      equ 0FB35H      ; 1     - Command counter (PLAY)
SAVSP       equ 0FB36H      ; 2     - Stack pointer when instruction PLAY is used
VOICEN      equ 0FB38H      ; 1     - Number of voice played
SAVVOL      equ 0FB39H      ; 2     - The volume is saved here when Pause
MCLLEN      equ 0FB3BH      ; 1     - Length of the macro being analyzed
MCLPTR      equ 0FB3CH      ; 2     - Address of the macro being analyzed
QUEUEN      equ 0FB3EH      ; 1     - Number of the current queue
MUSICF      equ 0FB3FH      ; 1     - Music interruption flags
PLACNT      equ 0FB40H      ; 1     - Number of macro strings in the PLAY queue
VCBA        equ 0FB41H      ; 37    - Data for voice A
VCBB        equ 0FB66H      ; 37    - Data for voice B
VCBC        equ 0FB8BH      ; 37    - Data for voice C

;; **** Keyboard
ENSTOP      equ 0FBB0H      ; 1     - <>0 when it is possible to resume execution of a BASIC program (CTRL+SHIFT+GRPH+KANA/CODE to resume)
BASROM      equ 0FBB1H      ; 1     - <>0 if basic is in rom (CTRL+STOP disabled)
LINTTB      equ 0FBB2H      ; 24    - Table of 24 end-of-line flags for each physical line
FSTPOS      equ 0FBCAH      ; 2     - first position for inlin
CURSAV      equ 0FBCCH      ; 1     - ASCII code of character under the cursor
FNKSWI      equ 0FBCDH      ; 1     - Indicate which function keys is displayed
FNKFLG      equ 0FBCEH      ; 10    - Function key which have subroutine
ONGSBF      equ 0FBD8H      ; 1     - Global event flag
CLIKFL      equ 0FBD9H      ; 1     - Flag to know if the key click has already occurred
OLDKEY      equ 0FBDAH      ; 11    - Previous status of each keyboard matrix row
NEWKEY      equ 0FBE5H      ; 11    - New status of each keyboard matrix row
KEYBUF      equ 0FBF0H      ; 40    - Key code buffer

;; **** Buffers and work areas
LINWRK      equ 0FC18H      ; 40    - Work area for screen management
PATWRK      equ 0FC40H      ; 8     - Work area for the name-to-form converter
BOTTOM      equ 0FC48H      ; 2     - Address of the beginning of the available RAM area
HIMEM       equ 0FC4AH      ; 2     - Address of the end of the available RAM area

;; **** Interruptions
TRPTBL      equ 0FC4CH      ; 78    - Tables for each of  (ON...) do BASIC
RTYCNT      equ 0FC9AH      ; 1     - Interrupt control
INTFLG      equ 0FC9BH      ; 1     - This flag is set if STOP or CTRL+STOP is pressed
PADY        equ 0FC9CH      ; 1     - Y-coordinate of a connected touch pad (Until MSX2+)
PADX        equ 0FC9DH      ; 1     - X-coordinate of a connected touch pad (Until MSX2+)
JIFFY       equ 0FC9EH      ; 1     - Value of the software clock, each interrupt of the VDP it is increased by 1
INTVAL      equ 0FCA0H      ; 2     - Contains length of the interval when the ON INTERVAL routine was established
INTCNT      equ 0FCA2H      ; 2     - ON INTERVAL counter (counts backwards)

;; **** Cassette
LOWLIM      equ 0FCA4H      ; 1     - Used by the Cassette system (minimal length of startbit)
WINWID      equ 0FCA5H      ; 1     - Used by the Cassette system (store the difference between a low-and high-cycle)

;; **** Display & System
GRPHED      equ 0FCA6H      ; 1     - Heading for the output of graphic characters
ESCCNT      equ 0FCA7H      ; 1     - Escape sequence counter
INSFLG      equ 0FCA8H      ; 1     - Insert mode flag
CSRSW       equ 0FCA9H      ; 1     - Cursor display switch
CSTYLE      equ 0FCAAH      ; 1     - Cursor style normal/insert (0=Full cursor, other=Halve cursor)
CAPST       equ 0FCABH      ; 1     - Capital status (0=Off, other=On)
KANAST      equ 0FCACH      ; 1     - Kana mode flags for MSX Japanese, Russian key status ou "Dead Key" status
KANAMD      equ 0FCADH      ; 1     - KANA/JIS keyboard flag (0=KANA, other=JIS). (Japanese MSX only)
FLBMEM      equ 0FCAEH      ; 1     - 0 if loading basic program
SCRMOD      equ 0FCAFH      ; 1     - Current screen mode
OLDSCR      equ 0FCB0H      ; 1     - Old screen mode
CASPRV      equ 0FCB1H      ; 1     - Work area for the cassette (until MSX2+)
BDRATR      equ 0FCB2H      ; 1     - Border color for paint
GXPOS       equ 0FCB3H      ; 1     - X-position of graphic cursor
GYPOS       equ 0FCB5H      ; 1     - Y-position of graphic cursor
GRPACX      equ 0FCB7H      ; 1     - X Graphics Accumulator
GRPACY      equ 0FCB9H      ; 1     - Y Graphics Accumulator
DRWFLG      equ 0FCBBH      ; 1     - Used by the instruction DRAW (DrawFlag)
DRWSCL      equ 0FCBCH      ; 1     - Used by the instruction DRAW (DrawScaling)
DRWANG      equ 0FCBDH      ; 1     - Used by the instruction DRAW (DrawAngle)
RUNBNF      equ 0FCBEH      ; 1     - Used by BLOAD handler
SAVENT      equ 0FCBFH      ; 2     - Used by BLOAD handler
EXPTBL      equ 0FCC1H      ; 4     - Bit 7 of these variables is a flag for each primary slot to indicate expanded slot
SLTTBL      equ 0FCC5H      ; 4     - Saves the state of the 4 secondary slot registers of each extended primary slot
SLTATR      equ 0FCC9H      ; 64    - Slot attributes given during MSX boot process
SLTWRK      equ 0FD09H      ; 128   - SLTWRK is a 128-byte variable array work area in Main-RAM for ROM applications
PROCNM      equ 0FD89H      ; 16    - Work aera of the instructions CALL and OPEN
DEVICE      equ 0FD99H      ; 1     - This byte increases to 255 when SHIFT key was pressed at startup
HOOKS       equ 0FD9AH      ; 570   - Start of system hooks area (5 bytes per hook handler)