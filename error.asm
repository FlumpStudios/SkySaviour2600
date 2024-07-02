game
.
 ; 

.L00 ;  rem Generated 22/10/2018 21:47:13 by Visual bB Version 1.0.0.568

.L01 ;  rem **********************************

.L02 ;  rem *Horizon Shift                   *

.L03 ;  rem *<description>                   *

.L04 ;  rem *<author>                        *

.L05 ;  rem *<contact info>                  *

.L06 ;  rem *<license>                       *

.L07 ;  rem **********************************

.
 ; 

.L08 ;  includesfile multisprite_superchip.inc

.L09 ;  set kernel multisprite

.L010 ;  set romsize 8k

.
 ; 

.L011 ;  pfheight = 7

	LDA #7
	STA pfheight
.
 ; 

.L012 ;  playfield:

	LDA #<PF1_data0
	STA PF1pointer
	LDA #>PF1_data0
	STA PF1pointer+1
	LDA #<PF2_data0
	STA PF2pointer
	LDA #>PF2_data0
	STA PF2pointer+1
.
 ; 

.
 ; 

.L013 ;  COLUBK  =  $0

	LDA #$0
	STA COLUBK
.
 ; 

.L014 ;  _COLUP1  =  $3A

	LDA #$3A
	STA _COLUP1
.L015 ;  COLUP2  =  $A4

	LDA #$A4
	STA COLUP2
.L016 ;  COLUP3  =  $A4

	LDA #$A4
	STA COLUP3
.L017 ;  COLUP4  =  $76

	LDA #$76
	STA COLUP4
.L018 ;  COLUP5  =  $2E

	LDA #$2E
	STA COLUP5
.
 ; 

.
 ; 

.L019 ;  lifecolor  =  $aa

	LDA #$aa
	STA lifecolor
.
 ; 

.
 ; 

.
 ; 

.L020 ;  player0x = 66

	LDA #66
	STA player0x
.L021 ;  player0y = 57

	LDA #57
	STA player0y
.
 ; 

.L022 ;  player1x = 76

	LDA #76
	STA player1x
.L023 ;  player1y = 99

	LDA #99
	STA player1y
.
 ; 

.L024 ;  player2x = 86

	LDA #86
	STA player2x
.L025 ;  player2y = 100

	LDA #100
	STA player2y
.
 ; 

.L026 ;  player3x = 96

	LDA #96
	STA player3x
.L027 ;  player3y = 100

	LDA #100
	STA player3y
.
 ; 

.L028 ;  player4x = 106

	LDA #106
	STA player4x
.L029 ;  player4y = 100

	LDA #100
	STA player4y
.
 ; 

.L030 ;  player5x = 100

	LDA #100
	STA player5x
.L031 ;  player5y =  200

	LDA #200
	STA player5y
.L032 ;  missile0y = 255

	LDA #255
	STA missile0y
.
 ; 

.
 ; 

.L033 ;  missile1y = 200

	LDA #200
	STA missile1y
.L034 ;  missile1x = 50

	LDA #50
	STA missile1x
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L035 ;  dim asteroidY  =  player1y.b

.L036 ;  dim asteroid2Y  =  player2y.c

.L037 ;  dim asteroid3Y  =  player3y.d

.L038 ;  dim asteroid4Y  =  player4y.e

.
 ; 

.L039 ;  dim misx  =  missile1x.h

.L040 ;  dim misy  =  missile1y.i

.
 ; 

.L041 ;  dim _P0_Luminosity  =  a.b

.L042 ;  dim _sc3  =  score + 2

.L043 ;  dim _Bit0_Reset_Restrainer  =  y

.L044 ;  dim _Bit6_Sequence_Switch  =  y

.L045 ;  dim explosionTicker  =  f

.L046 ;  dim _resetTicker  =  x

.L047 ;  dim gameReady  =  z

.
 ; 

.L048 ;  dim switchSprite  =  p

.
 ; 

.L049 ;  dim ticker  =  l

.
 ; 

.L050 ;  dim titlescreencolor  =  $F0

.L051 ;  dim _High_Score  =  q

.
 ; 

.
 ; 

.L052 ;  lives  =  96

	LDA #96
	STA lives
.
 ; 

.
 ; 

.L053 ;  ticker  =  0

	LDA #0
	STA ticker
.L054 ;  _resetTicker  =  0

	LDA #0
	STA _resetTicker
.L055 ;  switchSprite  =  0

	LDA #0
	STA switchSprite
.
 ; 

.L056 ;  explosionTicker  =  0

	LDA #0
	STA explosionTicker
.
 ; 

.L057 ;  const scorefade = 1

.
 ; 

.L058 ;  scorecolor = $1a

	LDA #$1a
	STA scorecolor
.
 ; 

.
 ; 

.L059 ;  NUSIZ0  =  16

	LDA #16
	STA NUSIZ0
.
 ; 

.L060 ;  lives:

	LDA #<lives__L060
	STA lifepointer
	LDA lifepointer+1
	AND #$E0
	ORA #(>lives__L060)&($1F)
	STA lifepointer+1
.
 ; 

.
 ; 

.
 ; 

.L061 ;  player1:

	LDX #<playerL061_1
	STX player1pointerlo
	LDA #>playerL061_1
	STA player1pointerhi
	LDA #9
	STA player1height
.
 ; 

.
 ; 

.
 ; 

.L062 ;  player3:

	LDX #<playerL062_3
	STX player3pointerlo
	LDA #>playerL062_3
	STA player3pointerhi
	LDA #9
	STA player3height
.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.
 ; 

.L063 ;  ticker  =  ticker  +  1

	INC ticker
.L064 ;  if ticker  >  10 then ticker  =  0

	LDA #10
	CMP ticker
     BCS .skipL064
.condpart0
	LDA #0
	STA ticker
.skipL064
.L065 ;  if player1y  =  100  ||  player1y  =  0 then goto setPlayer1Color

	LDA player1y
	CMP #100
     BNE .skipL065
.condpart1
 jmp .condpart2
.skipL065
	LDA player1y
	CMP #0
     BNE .skip0OR
.condpart2
 jmp .setPlayer1Color

.skip0OR
.L066 ;  if player2y  =  100  ||  player2y  =  0 then goto setPlayer2Color

	LDA player2y
	CMP #100
     BNE .skipL066
.condpart3
 jmp .condpart4
.skipL066
	LDA player2y
	CMP #0
     BNE .skip1OR
.condpart4
 jmp .setPlayer2Color

.skip1OR
.L067 ;  if player3y  =  100  ||  player4y  =  0 then goto setPlayer3Color

	LDA player3y
	CMP #100
     BNE .skipL067
.condpart5
 jmp .condpart6
.skipL067
	LDA player4y
	CMP #0
     BNE .skip2OR
.condpart6
 jmp .setPlayer3Color

.skip2OR
.L068 ;  if player4y  =  100  ||  player5y  =  0 then goto setPlayer4Color

	LDA player4y
	CMP #100
     BNE .skipL068
.condpart7
 jmp .condpart8
.skipL068
	LDA player5y
	CMP #0
     BNE .skip3OR
.condpart8
 jmp .setPlayer4Color

.skip3OR
.
 ; 

.colorSetComplete
 ; colorSetComplete

.L069 ;  if player5y  <  200 then explosionTicker  =  explosionTicker  +  1

	LDA player5y
	CMP #200
     BCS .skipL069
.condpart9
	INC explosionTicker
.skipL069
.L070 ;  if explosionTicker  >  1 then player5y  =  200 : explosionTicker  =  0 :  AUDV0  =  0  :  AUDC0  =  0  :  AUDF0  =  0

	LDA #1
	CMP explosionTicker
     BCS .skipL070
.condpart10
	LDA #200
	STA player5y
	LDA #0
	STA explosionTicker
	STA AUDV0
	STA AUDC0
	STA AUDF0
.skipL070
.
 ; 

.L071 ;  if player4y  =  80  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #80
     BNE .skipL071
.condpart11
	LDA #150
	CMP missile1y
     BCS .skip11then
.condpart12
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip11then
.skipL071
.L072 ;  if player4y  =  10  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #10
     BNE .skipL072
.condpart13
	LDA #150
	CMP missile1y
     BCS .skip13then
.condpart14
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip13then
.skipL072
.
 ; 

.L073 ;  if player4y  =  70  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #70
     BNE .skipL073
.condpart15
	LDA #150
	CMP missile1y
     BCS .skip15then
.condpart16
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip15then
.skipL073
.L074 ;  if player4y  =  20  &&  missile1y  >  150 then missile1y  =  player4y :  missile1x  =  player4x  -  3

	LDA player4y
	CMP #20
     BNE .skipL074
.condpart17
	LDA #150
	CMP missile1y
     BCS .skip17then
.condpart18
	LDA player4y
	STA missile1y
	LDA player4x
	SEC
	SBC #3
	STA missile1x
.skip17then
.skipL074
.
 ; 

.L075 ;  if missile0y  >  30  &&  missile0y  <  60 then AUDV1  =  2  :  AUDC1  =  12  :  AUDF1  =  7 else AUDV1  =  0  :  AUDC1  =  0 :  AUDF0  =  0

	LDA #30
	CMP missile0y
     BCS .skipL075
.condpart19
	LDA missile0y
	CMP #60
     BCS .skip19then
.condpart20
	LDA #2
	STA AUDV1
	LDA #12
	STA AUDC1
	LDA #7
	STA AUDF1
 jmp .skipelse0
.skip19then
.skipL075
	LDA #0
	STA AUDV1
	STA AUDC1
	STA AUDF0
.skipelse0
.
 ; 

.L076 ;  if collision(missile1,player0) then goto gameOver

	bit 	CXM1P
	BPL .skipL076
.condpart21
 jmp .gameOver

.skipL076
.L077 ;  if collision(player1,player0) then goto gameOver

	bit 	CXPPMM
	BPL .skipL077
.condpart22
 jmp .gameOver

.skipL077
.
 ; 

.L078 ;  if missile1y  <  45 then misy  =  misy  +  0.4

	LDA missile1y
	CMP #45
     BCS .skipL078
.condpart23
	LDA i
	CLC 
	ADC #102
	STA i
	LDA misy
	ADC #0
	STA misy
.skipL078
.L079 ;  if missile1y  >  45  &&  misy  <  150  &&  _resetTicker  =  0 then misy  =  misy  - 0.4

	LDA #45
	CMP missile1y
     BCS .skipL079
.condpart24
	LDA misy
	CMP #150
     BCS .skip24then
.condpart25
	LDA _resetTicker
	CMP #0
     BNE .skip25then
.condpart26
	LDA i
	SEC 
	SBC #102
	STA i
	LDA misy
	SBC #0
	STA misy
.skip25then
.skip24then
.skipL079
.
 ; 

.
 ; 

.
 ; 

.titlepage
 ; titlepage

.
 ; 

.L080 ;  if joy0fire  ||  switchreset then gameReady  =  1

 bit INPT4
	BMI .skipL080
.condpart27
 jmp .condpart28
.skipL080
 lda #1
 bit SWCHB
	BNE .skip11OR
.condpart28
	LDA #1
	STA gameReady
.skip11OR
.L081 ;  if gameReady  =  1 then COLUBK  =  $0  :  goto gamestart

	LDA gameReady
	CMP #1
     BNE .skipL081
.condpart29
	LDA #$0
	STA COLUBK
 jmp .gamestart

.skipL081
.
 ; 

.L082 ;  gosub titledrawscreen bank2

 sta temp7
 lda #>(ret_point1-1)
 pha
 lda #<(ret_point1-1)
 pha
 lda #>(.titledrawscreen-1)
 pha
 lda #<(.titledrawscreen-1)
 pha
 lda temp7
 pha
 txa
 pha
 ldx #2
 jmp BS_jsr
ret_point1
.
 ; 

.L083 ;  goto titlepage

 jmp .titlepage

.
 ; 

.gamestart
 ; gamestart

.
 ; 

.L084 ;  sprites

