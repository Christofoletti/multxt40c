; Multi text screen for MSX 1.0
; 
; Author: Luciano M. Christofoletti
; Date: 26/oct/2016
; Version: 1.0
; 
; This source code must be compiled using the Glass Compiler
; 
; References:
;   MSX top secret
;   http://map.grauw.nl/articles/keymatrix.php
;   http://www.msxcomputermagazine.nl/mccm/millennium/milc/architec/topic_0.htm
;   
; SCREEN 0 (Text mode, 40 column):
; Name table (char positions)     0000-03BF
; Character patterns (font)       0800-0FFF
;
; SCREEN 0 (Text mode, 80 column):
; Name table (char positions)     0000-077F (086F)
; Character attribute (Blink)     0800-08EF (090D)
; Character patterns (font)       1000-17FF
    
    include once "lib/msxbios.asm"
    include "lib/msx1variables.asm"
    
SHOWCSR     equ 09E1H       ; Show cursor on text screen
HIDECSR     equ 0A2EH       ; Hide cursor on text screen
APPADDR     equ 0D600H      ; The start address of application's hooks handlers

MAXPAGES    equ 4           ; Number of text pages
ATTBNSAV    equ 8           ; Number of attributes saved for each screen
LINTTBSZ    equ 24          ; Size of LINTTB table
PGATBSIZ    equ ATTBNSAV+LINTTBSZ  ; Number of bytes needed for each page attributes entry
    
    ; **** Start of main screen change routine ****
    org     APPADDR
    
; ------------------------------------------------------------------------------
; Function..: Keyboard HKYEA interruption handler
; Input.....: A - the key pressed code
; Output....: none
; Changes...: none
; ------------------------------------------------------------------------------
HKYEAHDL:
    proc
        PUSH AF
        
        ; Verify if shift+select is pressed
        CP   03EH           ; Select key pressed?
        JR   NZ,EXIT
        
        ; Get the status of control key
        LD   A,(NEWKEY+6)   ; F3, F2, F1, CODE, CAPS, GRAPH, CTRL, SHIFT
        BIT  1,A
        JR   NZ,EXIT
        
        ; Verify if the system is currently in text mode 0
        LD   A,(SCRMOD)
        OR   A
        JR   NZ,EXIT
        
        PUSH BC
        PUSH DE
        PUSH HL
        
        ; Save current page attributes in PAGEATRB table
        CALL GETPGADR
        SCF
        CALL COPYATRB
        
        ; Hide cursor (restore original char at cursor position)
        CALL HIDECSR
        
        ; Update current active page index
        LD   HL,ACTVPAGE
        LD   A,(HL)
        INC  A
        AND  BIT01MSK
        LD   (HL),A
        
        ; Update NAMBAS, TXTNAM and VDP status
        CALL SETPAGE
        
        ; Set page properties for new selected page
        CALL GETPGADR       ; Evaluate the address of page attributes in RAM
        LD   A,(DE)         ; Get the CSRY value for current page
        OR   A              ; Reset carry flag (update bios attributes)
        CALL COPYATRB       ; Set bios variables using stored attributes in RAM
        CALL SETSCR         ; Set screen attributes
        CALL Z,CLS          ; Clear current page if CSRY is zero for current page
        
        POP  HL
        POP  DE
        POP  BC
    EXIT:
        POP  AF
        RET
    endp
    
; ------------------------------------------------------------------------------
; Function..: HSCRE hook handler - this routine is called every time the user
;             changes the current screen mode.
; Input.....: A - The new screen mode code (1 -> screen 0, 2 -> screen 1, ...)
; Output....: None
; Changes...: IX
; ------------------------------------------------------------------------------
HSCREHDL:
    proc
        PUSH AF
        
        ; The new graphic mode is stored in the A reg
        AND  0FH
        CP   01H            ; Value 1 in reg A means screen 0
        JR   Z,EXIT         ; Don't need to reset pages if new mode is screen 0
        
        PUSH BC
        PUSH DE
        PUSH HL
        
        ; Initializing regs used to reset page data in PAGEATRB table
        LD   B,MAXPAGES
        LD   DE,ATTBNSAV-2
        LD   HL,PAGEATRB
        
        ; Mark all pages as invalid
    SETATBR:
        LD   (HL),0H        ; Mark page as invalid (using CSRY entry as flag)
        INC  HL
        INC  HL
        LD   (HL),' '       ; Reset char at cursor position (CURSAV entry)
        ADD  HL,DE          ; Point DE to LINTTB entry start
        
        ; Clear the LINTTB stored attributes
        LD   A,B            ; Store reg B value in reg A (avoing push/pop)
        LD   B,LINTTBSZ
    NEXT:
        LD   (HL),B
        INC  HL
        DJNZ NEXT
        LD   B,A            ; Restore B reg value
        
        DJNZ SETATBR
        
        POP  HL
        POP  DE
        POP  BC
        
    EXIT:
        POP  AF
        RET
    endp
    
; ------------------------------------------------------------------------------
; Function..: Set current screen attributes
; Input.....: None
; Output....: None
; Changes...: All registers except AF
; ------------------------------------------------------------------------------
SETSCR:
    proc
        PUSH AF
        
        ; Set the LINL40 bios variable equals LINLEN
        LD   A,(LINLEN)
        LD   (LINL40),A
        
        ; Set the cursor position
        LD   HL,(CSRY)
        CALL POSIT
        
        ; Set the screen colors
        CALL CHGCLR
        
        ; Set status of function keys display
        LD   A,(CONSDFG)
        OR   A
        JR   NZ,KEYON
        CALL ERAFNK
        XOR  A
    KEYON:
        CALL NZ,DSPFNK
        
        POP  AF
        RET
    endp
    
; ------------------------------------------------------------------------------
; Function..: Set name table addresses in bios vars and VDP reg 2 value
; Input.....: A - the page number to set
; Output....: None
; Changes...: AF, BC, DE, HL
; ------------------------------------------------------------------------------
SETPAGE:
    proc
        ; Set BC equals value in reg A
        LD   B,0H
        LD   C,A
        
        ; Update NAMBAS and TXTNAM bios variables
        LD   HL,NMTABLES
        ADD  HL,BC
        LD   D,(HL)
        LD   E,B
        LD   (NAMBAS),DE
        LD   (TXTNAM),DE
        
        ; Update the VDP reg 2 value
        LD   HL,NMTBLX
        ADD  HL,BC
        LD   B,(HL)
        LD   C,2
        CALL WRTVDP
        
        RET
        
        ; page 0 - default name table address for screen 0
        ; page 1 address (8x400H)
        ; page 2 address (10x400H)
        ; page 3 address (12x400H)
    NMTABLES:
        db 0H, 20H, 28H, 30H
        
        ; VDP reg 2 values (name table base address multipliers)
    NMTBLX:
        db 0, 8, 10, 12
        
    endp
    
; ------------------------------------------------------------------------------
; Function..: Evaluate the address of current page attributes in RAM
; Input.....: None
; Output....: DE - address of stored page attributes in RAM
; Changes...: AF, BC, DE, HL
; ------------------------------------------------------------------------------
GETPGADR:
    proc
        LD   HL,PAGEATRB
        LD   A,(ACTVPAGE)
        OR   A
        JR   Z,EXIT
        
        ; Evaluate displacement in attributes table for current active page
        LD   B,A
        LD   DE,PGATBSIZ
    NEXT:
        ADD  HL,DE
        DJNZ NEXT
        
    EXIT:
        EX   DE,HL
        RET
    endp
    
; ------------------------------------------------------------------------------
; Function..: Save/Load attributes from current text screen on page attributes
;             table. 
;             Carry flag indicates the operation type:
;                 Carry set -> save text screen attributes from bios variables
;                 Carry reset -> load text attributes to bios variables
; Input.....: DE - address of the page attributes table entry
; Output....: none
; Changes...: Flags (Z and C flags are not affected), BC, DE, HL
; ------------------------------------------------------------------------------
COPYATRB:
    proc
        PUSH IX
        LD   B,ATTBNSAV         ; Number of screen attributes to save/load
        LD   C,0FFH             ; Avoid BC decrement (LDI) conflict with DJNZ
        LD   IX,VARSADDR
        
        ; Save/Load the text screen attributes
    NEXT:
        ; Get the bios variable address in reg HL
        LD   L,(IX)
        INC  IX
        LD   H,(IX)
        INC  IX
        
        ; If carry flag is set, the operation is "save attributes", that is,
        ; move attributes from bios vars to PAGEATRB table
        JR   C,MOVE
        EX   DE,HL
    MOVE:
        LDI
        JR   C,UPDATE
        EX   DE,HL
    UPDATE:
        DJNZ NEXT
        
        ; Save/Load the LINTTB table
        LD   HL,LINTTB
        LD   C,LINTTBSZ
        JR   C,LOAD
        EX   DE,HL
    LOAD:
        LDIR
        
        POP  IX
        RET
        
        ; Addresses of text attributes (bios variables)
    VARSADDR:
        dw   CSRY, CSRX, CURSAV, CSRSW, FORCLR, BAKCLR, CONSDFG, LINLEN
        
    endp
    
    ; Current active (visible) page number
ACTVPAGE:
    db  0
    
APPSIZE    equ $-HKYEAHDL
    
    ; Page attributes table (needs MAXPAGESxPGATBSIZ bytes for all pages)
PAGEATRB:

