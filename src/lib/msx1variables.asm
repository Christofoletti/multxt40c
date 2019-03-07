; msxbios.asm - MSX BIOS system variables
; version 0.4
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

; Name      equ Address     ; Size  - Description
;                          (in bytes)

;; **** Subroutines For Inter-Slot Read/Write/Call
RDPRIM      equ 0F380H      ; 5     - Read from primary slot, used by RDSLT (000Ch) routine from Main-ROM
WRPRIM      equ 0F385H      ; 7     - Write to primary slot, used by WRSLT (0014h) routine from Main-ROM
CLPRIM      equ 0F38CH      ; 14    - Call primary slot, used by CALSLT (001Ch) routine from Main-ROM

;; **** Addresses For Extra Subroutines In Language Machine
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
TXTCOL      equ 0F3B5H      ; Modo texto 40*24: Base da tabela de cores
TXTCGP      equ 0F3B7H      ; Modo texto 40*24: Base da tabela de caracteres
TXTATR      equ 0F3B9H      ; Modo texto 40*24: Base dos atributos de sprite
TXTPAT      equ 0F3BBH      ; Modo texto 40*24: Base das imagens de sprite
T32NAM      equ 0F3BDH      ; Modo texto 32*24: Base da tabela de nomes
T32COL      equ 0F3BFH      ; Modo texto 32*24: Base da tabela de cores
T32CGP      equ 0F3C1H      ; Modo texto 32*24: Base da tabela de caracteres
T32ATR      equ 0F3C3H      ; Modo texto 32*24: Base dos atributos de sprite
T32PAT      equ 0F3C5H      ; Modo texto 32*24: Base das imagens de sprite
GRPNAM      equ 0F3C7H      ; Modo gr�fico 256*192: Base da tabela de nomes
GRPCOL      equ 0F3C9H      ; Modo gr�fico 256*192: Base da tabela de cores
GRPCGP      equ 0F3CBH      ; Modo gr�fico 256*192: Base da tabela de caracteres
GRPATR      equ 0F3CDH      ; Modo gr�fico 256*192: Base dos atributos de sprite
GRPPAT      equ 0F3CFH      ; Modo gr�fico 256*192: Base das imagens de sprite
MLTNAM      equ 0F3D1H      ; Modo gr�fico 64*48: Base da tabela de nomes
MLTCOL      equ 0F3D3H      ; Modo gr�fico 64*48: Base da tabela de cores
MLTCGP      equ 0F3D5H      ; Modo gr�fico 64*48: Base da tabela de caracteres
MLTATR      equ 0F3D7H      ; Modo gr�fico 64*48: Base dos atributos de sprite
MLTPAT      equ 0F3D9H      ; Modo gr�fico 64*48: Base das imagens de sprite

;; **** Cursor and function Key Parameters
CLIKSW:     equ 0F3DBH    ; Click do teclado: 0=desligado, 1-255: ligado
CSRY:       equ 0F3DCH    ; Coordenada Y do cursor em modo texto (1...CRTCNT)
CSRX:       equ 0F3DDH    ; Coordenada X do cursor em modo texto (1...LINLEN)
CONSDFG:    equ 0F3DEH    ; Apresenta��o das teclas de fun��o: 0=desligado
RG0SAV:     equ 0F3DFH    ; C�pia dos registrador 0 do VDP (somente escrita)
RG1SAV:     equ 0F3E0H    ; C�pia dos registrador 1 do VDP (somente escrita)
RG2SAV:     equ 0F3E1H    ; C�pia dos registrador 2 do VDP (somente escrita)
RG3SAV:     equ 0F3E2H    ; C�pia dos registrador 3 do VDP (somente escrita)
RG4SAV:     equ 0F3E3H    ; C�pia dos registrador 4 do VDP (somente escrita)
RG5SAV:     equ 0F3E4H    ; C�pia dos registrador 5 do VDP (somente escrita)
RG6SAV:     equ 0F3E5H    ; C�pia dos registrador 6 do VDP (somente escrita)
RG7SAV:     equ 0F3E6H    ; C�pia dos registrador 7 do VDP (somente escrita)
STATFL:     equ 0F3E7H    ; C�pia do registrador de status do VDP
TRGFLG:     equ 0F3E8H    ; Estado dos bot�es dos joysticks e da barra de espa�o
FORCLR:     equ 0F3E9H    ; Cor do primeiro plano
BAKCLR:     equ 0F3EAH    ; Cor do segundo plano (fundo)
BDRCLR:     equ 0F3EBH    ; Cor da borda
MAXUPD:     equ 0F3ECH    ; (C�digo automodific�vel usado para tra�ar retas)
MINUPD:     equ 0F3EFH    ; (C�digo automodific�vel usado para tra�ar retas)
ATRBYT:     equ 0F3F2H    ; Cor da tinta gr�fica em fun��es gr�ficas da BIOS
QUEUES:     equ 0F3F3H    ; Cont�m endere�o do bloco de controle das filas musicais
FRCNEW:     equ 0F3F5H    ; Indicador que distingue CLOAD (0) de CLOAD? (255)
SCNCNT:     equ 0F3F6H    ; Contador usado para controlar a frequencia das varreduras do teclado
REPCNT:     equ 0F3F7H    ; Contador usado para controlar o n�mero de repeti��es de uma tecla
PUTPNT:     equ 0F3F8H    ; Endere�o de inser��o em KEYBUF (buffer circular)
GETPNT:     equ 0F3FAH    ; Endere�o de remo��o em KEYBUF (buffer circular)
CS1200:     equ 0F3FCH    ; Par�metros do cassete para 1200 baud
CS2400:     equ 0F401H    ; Par�metros do cassete para 2400 baud
CASLOW:     equ 0F406H    ; Par�metros do cassete atuais: ciclo LO
CASHIGH:    equ 0F408H    ; Par�metros do cassete atuais: ciclo HI
HEADER:     equ 0F40AH    ; Par�metros do cassete atuais: ciclos no cabe�alho
ASPCT1:     equ 0F40BH    ; Inverso da raz�o de aspecto do CIRCLE*256
ASPCT2:     equ 0F40DH    ; Raz�o de aspecto do CIRCLE*256
ENDPRG:     equ 0F40FH    ; Usado pelo interpretador BASIC para ON ERROR GOTO
ERRFLG:     equ 0F414H    ; Armazena o c�digo de erro do BASIC
LPTPOS:     equ 0F415H    ; Usada por LPRINT, armazena posi��o da cabe�a de impress�o
PRTFLG:     equ 0F416H    ; Determina se OUTDO deve direcionar sua sa� da para a tela (0) ou impressora (1)
NTMSXP:     equ 0F417H    ; Determina convers�o de caracteres gr�ficos de OUTDO (0=sem convers�o, 1-255=espa�os)
RAWPRT:     equ 0F418H    ; Usada por OUTDO: 0=trata prefixos gr�ficos, 1=envia dados para a impressora sem tratamento
VLZADR:     equ 0F419H    ; Tempor�rio usado pela fun��o VAL do BASIC
VLZDAT:     equ 0F41BH    ; Tempor�rio usado pela fun��o VAL do BASIC
KBFMIN:     equ 0F41EH    ; Utilizado no tratamento de erros do BASIC
KBUF:       equ 0F41FH    ; Utilizado no tratamento de erros do BASIC (318)
BUFMIN:     equ 0F55DH    ; Utilizado na entrada de linhas BASIC
BUF:        equ 0F55EH    ; Utilizado na entrada de linhas BASIC (259)
TTYPOS:     equ 0F661H    ; Posi��o de tela atual, usada pelo PRINT
DIMFLG:     equ 0F662H    ; Usado pelo interpretador BASIC na instru��o DIM
VALTYP:     equ 0F663H    ; Usado pelo interpretador BASIC
DORES:      equ 0F664H    ; Usada pelo interpretador BASIC (linhas DATA)
DONUM:      equ 0F665H    ; Usada pelo interpretador BASIC
CONTXT:     equ 0F666H    ; Usada pelo interpretador BASIC
CONSAV:     equ 0F668H    ; Usada pelo interpretador BASIC
CONTYP:     equ 0F669H    ; Usada pelo interpretador BASIC
CONLO:      equ 0F66AH    ; Usada pelo interpretador BASIC
STKTOP:     equ 0F674H    ; Cont�m o endere�o do topo da pilha
TXTTAB:     equ 0F676H    ; Cont�m o endere�o do texto de programa BASIC
TEMPPT:     equ 0F678H    ; Aponta para a pr�xima entrada livre de TEMPST
TEMPST:     equ 0F67AH    ; Buffer de descritores de string (BASIC)
DSCTMP:     equ 0F698H    ; Buffer tempor�rio para fun��es de string (BASIC)
FRETOP:     equ 0F69BH    ; Aponta para a pr�xima posi��o livre no buffer apontado por MEMSIZ
TEMP3:      equ 0F69DH    ; Vari�vel tempor�ria (interpretador BASIC)
TEMP8:      equ 0F69FH    ; Vari�vel tempor�ria (interpretador BASIC)
ENDFOR:     equ 0F6A1H    ; Usada pelo interpretador BASIC (loops FOR)
DATLIN:     equ 0F6A3H    ; Linha do programa BASIC do item DATA atual
SUBFLG:     equ 0F6A5H    ; Usada pelo interpretador BASIC
FLGINP:     equ 0F6A6H    ; BASIC: distingue INPUT (0) de READ (1-255)
TEMP:       equ 0F6A7H    ; Vari�vel tempor�ria (interpretador BASIC)
PTRFLG:     equ 0F6A9H    ; Usada pelo interpretador BASIC
AUTFLG:     equ 0F6AAH    ; Flag do modo AUTO do BASIC
AUTLIN:     equ 0F6ABH    ; N�mero da linha AUTO atual (BASIC)
AUTINC:     equ 0F6ADH    ; Incremento atual do AUTO (BASIC)
SAVTXT:     equ 0F6AFH    ; Apontador de programa usado pelo manipulador de erro (BASIC)
ERRLIN:     equ 0F6B3H    ; N�mero da linha que gerou o erro (BASIC)
DOT:        equ 0F6B5H    ; Usada pelo interpretador BASIC
ERRTXT:     equ 0F6B7H    ; Usada pelo interpretador BASIC (RESUME)
ONELIN:     equ 0F6B9H    ; Usada pelo interpretador BASIC (ON ERROR GOTO)
ONEFLG:     equ 0F6BBH    ; Usada pelo interpretador BASIC (ON ERROR GOTO)
TEMP2:      equ 0F6BCH    ; Vari�vel tempor�ria (interpretador BASIC)
OLDLIN:     equ 0F6BEH    ; Linha que terminou o programa BASIC, usada por CONT
OLDTXT:     equ 0F6C0H    ; Aponta a instru��o que terminou o programa
VARTAB:     equ 0F6C2H    ; Aponta para a �rea de armazenamento de vari�veis (BASIC)
ARYTAB:     equ 0F6C4H    ; Aponta para a �rea de armazenamente de arrays (BASIC)
STREND:     equ 0F6C6H    ; Aponta para o byte seguinte � �rea de ARYTAB (BASIC)
DATPTR:     equ 0F6C8H    ; Aponta para item DATA atual (BASIC)
DEFTBL:     equ 0F6CAH    ; Tipos de vari�vel, por letra (BASIC), definidos por DEFINT, DEFSTR, etc
PRMSTK:     equ 0F6E4H    ; Usada pelo interpretador BASIC
PRMLEN:     equ 0F6E6H    ; Usada pelo interpretador BASIC
PARM1:      equ 0F6E8H    ; Usada pelo interpretador BASIC (buffer do FN)
PRMPRV:     equ 0F74CH    ; Usada pelo interpretador BASIC (FN)
PRMLN2:     equ 0F74EH    ; Usada pelo interpretador BASIC (FN)
PARM2:      equ 0F750H    ; Usada pelo interpretador BASIC (buffer do FN)
PRMFLG:     equ 0F7B4H    ; Usada pelo interpretador BASIC
ARYTA2:     equ 0F7B5H    ; Usada pelo interpretador BASIC
NOFUNS:     equ 0F7B7H    ; Usada pelo interpretador BASIC
TEMP9:      equ 0F7B8H    ; Vari�vel tempor�ria (interpretador BASIC)
FUNACT:     equ 0F7BAH    ; Usada pelo interpretador BASIC
SWPTMP:     equ 0F7BCH    ; Usada pelo interpretador BASIC (SWAP)
TRCFLG:     equ 0F7C4H    ; Ativado quando TRON est� ligado (BASIC)
FBUFFR:     equ 0F7C5H    ; Buffer de convers�o num�rica (BASIC)
DECTM2:     equ 0F7F2H    ; Vari�vel tempor�ria (interpretador BASIC)
DECCNT:     equ 0F7F4H    ; Vari�vel tempor�ria (interpretador BASIC)
DAC:        equ 0F7F6H    ; Buffer de avalia��o de express�o do BASIC
HOLD8:      equ 0F806H    ; Buffer tempor�rio de multiplica��o (BASIC)
ARG:        equ 0F847H    ; Buffer de avalia��o de express�o do BASIC
RNDX:       equ 0F857H    ; Cont�m o �ltimo n�mero aleat�rio (precis�o dupla)
MAXFIL:     equ 0F85FH    ; N�mero de buffers de E/S alocados (BASIC)
FILTAB:     equ 0F860H    ; Aponta para a tabela de FCBs dos buffers de E/S (BASIC)
NULBUF:     equ 0F862H    ; Aponta para o buffer de E/S
PTRFIL:     equ 0F864H    ; Aponta para o FCB do buffer de E/S ativo
FILNAM:     equ 0F866H    ; Buffer de nome de arquivo. (BASIC)
FILNM2:     equ 0F871H    ; Buffer de nome de arquivo. (BASIC)
NLONLY:     equ 0F87CH    ; Usada pelo interpretador BASIC
SAVEND:     equ 0F87DH    ; Usada pelo interpretador BASIC
FNKSTR:     equ 0F87FH    ; Buffer com strings das teclas de fun��o
CGPNT:      equ 0F91FH    ; Aponta para a tabela de caracteres em ROM (Slot ID 0 seguido do endere�o 0x1BBF)
NAMBAS:     equ 0F922H    ; Base da tabela de nomes no modo de video atual
CGPBAS:     equ 0F924H    ; Base da tabela de caracteres no modo de video atual
PATBAS:     equ 0F926H    ; Base da tabela de imagens de sprites no modo de v� deo atual
ATRBAS:     equ 0F928H    ; Base da tabela de atributos de sprites no modo de v� deo atual
CLOC:       equ 0F92AH    ; Endere�o do pixel atual (fun��es gr�ficas da BIOS)
CMASK:      equ 0F92CH    ; M�scara do pixel atual
MINDEL:     equ 0F92DH    ; Usado pela instru��o LINE
MAXDEL:     equ 0F92FH    ; Usado pela instru��o LINE
ASPECT:     equ 0F931H    ; Usado pela instru��o CIRCLE
CENCNT:     equ 0F933H    ; Usado pela instru��o CIRCLE
CLINEF:     equ 0F935H    ; Usado pela instru��o CIRCLE
CNPNTS:     equ 0F936H    ; Usado pela instru��o CIRCLE
CPLOTF:     equ 0F938H    ; Usado pela instru��o CIRCLE
CPCNT:      equ 0F939H    ; Usado pela instru��o CIRCLE
CPCNT8:     equ 0F93BH    ; Usado pela instru��o CIRCLE
CRCSUM:     equ 0F93DH    ; Usado pela instru��o CIRCLE
CSTCNT:     equ 0F93FH    ; Usado pela instru��o CIRCLE
CSCLXY:     equ 0F941H    ; Usado pela instru��o CIRCLE
CSAVEA:     equ 0F942H    ; Tempor�rio usado por fun��es gr�ficas da BIOS
CSAVEM:     equ 0F944H    ; Tempor�rio usado por fun��es gr�ficas da BIOS
CXOFF:      equ 0F945H    ; Usado pela instru��o CIRCLE
CYOFF:      equ 0F947H    ; Usado pela instru��o CIRCLE
LOHMSK:     equ 0F949H    ; Usado pela instru��o PAINT
LOHDIR:     equ 0F94AH    ; Usado pela instru��o PAINT
LOHADR:     equ 0F94BH    ; Usado pela instru��o PAINT
LOHCNT:     equ 0F94DH    ; Usado pela instru��o PAINT
SKPCNT:     equ 0F94FH    ; Usado pela instru��o PAINT
MOVCNT:     equ 0F951H    ; Usado pela instru��o PAINT
PDIREC:     equ 0F953H    ; Usado pela instru��o PAINT
LEPROG:     equ 0F954H    ; Usado pela instru��o PAINT
RTPROG:     equ 0F955H    ; Usado pela instru��o PAINT
MCLFLG:     equ 0F958H    ; Linguagem de macro atual, 0=DRAW, 1-255=PLAY
QUETAB:     equ 0F959H    ; Blocos de controle das filas musicais
QUEBAK:     equ 0F971H    ; Usado pelo manipulador de fila musical
VOICAQ:     equ 0F975H    ; Buffer da fila musical A
VOICBQ:     equ 0F9F5H    ; Buffer da fila musical B
VOICCQ:     equ 0FA75H    ; Buffer da fila musical C
RS2IQ:      equ 0FAF5H    ; Buffer da fila RS232
PRSCNT:     equ 0FB35H    ; Usado pelo interpretador BASIC (PLAY)
SAVSP:      equ 0FB36H    ; Usado pelo interpretador BASIC (PLAY)
VOICEN:     equ 0FB38H    ; Voz atual do interpretador PLAY
SAVVOL:     equ 0FB39H    ; Usado pelo interpretador BASIC (PLAY)
MCLLEN:     equ 0FB3BH    ; Comprimento do operando de macro-linguagem analisado
MCLPTR:     equ 0FB3CH    ; Aponta para caractere de macro-linguagem sendo analisado
QUEUEN:     equ 0FB3EH    ; Fila atual do interpretador PLAY
MUSICF:     equ 0FB3FH    ; Usado pelo interpretador BASIC (PLAY)
PLACNT:     equ 0FB40H    ; Usado pelo interpretador BASIC (PLAY)
VCBA:       equ 0FB41H    ; 37  - Data for voice A
VCBB:       equ 0FB66H    ; 37  - Data for voice B
VCBC:       equ 0FB8BH    ; 37  - Data for voice C
ENSTOP:     equ 0FBB0H    ; 1   - <>0 when it is possible to resume execution of a BASIC program (CTRL+SHIFT+GRPH+KANA/CODE to resume)
BASROM:     equ 0FBB1H    ; 1   - <>0 if basic is in rom. (CTRL+STOP disabled)
LINTTB:     equ 0FBB2H    ; 24  - Table of 24 end-of-line flags for each physical line
FSTPOS:     equ 0FBCAH    ; Usada internamente pelo editor de tela do BASIC
CURSAV:     equ 0FBCCH    ; Armazena o caractere sob o cursor
FNKSWI:     equ 0FBCDH    ; Usada pela rotina CHSNS para determinar se SHIFT est� pressionado (0) ou n�o (1) para apresentar as strings das teclas de fun��o
FNKFLG:     equ 0FBCEH    ; Usada pelo BASIC. (indicadores de KEY(n) ON)
ONGSBF:     equ 0FBD8H    ; Usado pelo interpretador BASIC
OLDKEY:     equ 0FBDAH    ; Armazena o estado anterior da matriz de teclado
NEWKEY:     equ 0FBE5H    ; Armazena o estado atual da matriz de teclado
KEYBUF:     equ 0FBF0H    ; Buffer circular do teclado (caracteres decodificados)
LINWRK:     equ 0FC18H    ; Buffer de linha de tela, usado pelo BIOS
PATWRK:     equ 0FC40H    ; Buffer usado pelo BIOS
BOTTOM:     equ 0FC48H    ; Armazena o in�cio da RAM usada pelo interpretador BASIC
TRPTBL:     equ 0FC4CH    ; Usado pelas instru��es de interrup��o (ON...) do BASIC
RTYCNT:     equ 0FC9AH    ; N�o-utilizada
INTFLG:     equ 0FC9BH    ; Flag de detec��o de CTRL-STOP (3) e STOP (4)
PADY:       equ 0FC9CH    ; �ltima coordenada Y do tablet
PADX:       equ 0FC9DH    ; �ltima coordenada X do tablet
JIFFY:      equ 0FC9EH    ; Contador incrementado a cada interrup��o do VDP
INTVAL:     equ 0FCA0H    ; Dura��o do intervalo do ON INTERVAL (BASIC)
INTCNT:     equ 0FCA2H    ; Contador do ON INTERVAL (BASIC)
LOWLIM:     equ 0FCA4H    ; Dura��o m� nima do bit de partida no cassete (TAPION)
WINWID:     equ 0FCA5H    ; Dura��o de discrimina��o LO/HI (TAPION)
GRPHED:     equ 0FCA6H    ; Vari�vel auxiliar da rotina CNVCHR do BIOS
ESCCNT:     equ 0FCA7H    ; Vari�vel auxiliar da rotina CHPUT do BIOS
INSFLG:     equ 0FCA8H    ; Indica modo de inser��o do editor de tela
CSRSW:      equ 0FCA9H    ; Cursor display switch
CSTYLE:     equ 0FCAAH    ; Estilo do cursor, bloco (0) ou sublinhado (1-255)
CAPST:      equ 0FCABH    ; Status do CAPS LOCK (0=desligado, 1-255=ligado)
KANAST:     equ 0FCACH    ; Status do KANA LOCK (0=desligado, 1-255=ligado)
KANAMD:     equ 0FCADH    ; Modo kana (MSX japoneses)
FLBMEM:     equ 0FCAEH    ; Usada pelo manipulador de erro de E/S
SCRMOD:     equ 0FCAFH    ; Modo de tela (SCREEN) atual
OLDSCR:     equ 0FCB0H    ; �ltimo modo de texto
CASPRV:     equ 0FCB1H    ; Tempor�rio de E/S do cassete
BDRATR:     equ 0FCB2H    ; Usado pelas rotinas gr�ficas do BIOS
GXPOS:      equ 0FCB3H    ; Tempor�rio das rotinas gr�ficas do BIOS
GYPOS:      equ 0FCB5H    ; Tempor�rio das rotinas gr�ficas do BIOS
GRPACX:     equ 0FCB7H    ; Tempor�rio das rotinas gr�ficas do BIOS
GRPACY:     equ 0FCB9H    ; Tempor�rio das rotinas gr�ficas do BIOS
DRWFLG:     equ 0FCBBH    ; Usado pelo manipulador do DRAW
DRWSCL:     equ 0FCBCH    ; Usado pelo manipulador do DRAW
DRWANG:     equ 0FCBDH    ; Usado pelo manipulador do DRAW
RUNBNF:     equ 0FCBEH    ; Usado pelo manipulador do BLOAD
SAVENT:     equ 0FCBFH    ; Usado pelo manipulador do BLOAD
EXPTBL:     equ 0FCC1H    ; Indicadores de expans�o dos 4 slots, (0x00=n�o expandido, 0x80=expandido)
SLTTBL:     equ 0FCC5H    ; C�pia dos registradores de slot prim�rio (v�lidos apenas nos slots expandidos)
SLTATR:     equ 0FCC9H    ; Atributos de ROM, 16 bytes por slot (desses, 4 por subslot)
SLTWRK:     equ 0FD09H    ; Dois bytes de trabalho local para cada uma das 64 extens�es de ROM poss� veis
PROCNM:     equ 0FD89H    ; Buffer para nome de dispositivo ou instru��o a ser analisado por uma ROM de extens�o
DEVICE:     equ 0FD99H    ; Usada para passar um n�mero de dispositivo para uma ROM de extens�o.