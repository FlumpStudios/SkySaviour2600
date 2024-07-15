 rem Generated 22/10/2018 21:47:13 by Visual bB Version 1.0.0.568
 rem **********************************
 rem *Sky Savior                      *
 rem *<description>                   *
 rem *<author>                        *
 rem *<contact info>                  *
 rem *<license>                       *
 rem ********************************** 
 
 includesfile multisprite_superchip.inc
 set kernel multisprite
 set romsize 8k
 
 pfheight=7 

 playfield:
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................ 
 .XXXXX...XXXXX....XXXXX...XXXXX.
 .X.X.X..XX.X.XX..XX.X.XX..X.X.X.
 .XXXXX..XXXXXXX..XXXXXXX..XXXXX.
 .XXXXX..XXX.XXX..XXXXXXX..XX.XX. 
end

 _COLUP1 = $3A 
 COLUP2 = $A4 
 COLUP3 = $A4 
 COLUP4 = $76 
 COLUP5 = $2E

  
 lifecolor = $aa
;**************************
;      Sprite setups      *
;**************************
 player0x=76
 player0y=30

 player1x=76
 player1y=115 

 player2x=86
 player2y=105

 player3x=96
 player3y=110

 player4x=116
 player4y=100

 player5x=100
 player5y= 200
 
 missile0y=100
 missile0x=140

 
;enemy bullet
 missile1y=200
 missile1x=50

;**************************
;        Declarations     *
;**************************
 dim _P0_Luminosity = a.b
 dim asteroidY = player1y.b 
 dim asteroid2Y = player2y.c
 dim asteroid3Y = player3y.d
 dim asteroid4Y = player4y.e
 dim explosionTicker = f 
 dim player3MoveLeft = g
 dim asteroidx = player1x.h
 dim asteroid2x = player2x.i
 dim asteroid3x = player3x.j
 dim asteroid4x = player4x.k
 dim bulletMultiplier = l
 dim killCount = m
 dim ticker = n
 dim powerUpInPlay = o
 dim altSprite = p
 dim  firstFrame = r
 dim _High_Score3 = s 
 dim _High_Score1 = t
 dim _High_Score2 = u 
 dim _resetTicker = x
 dim gameReady = z  
 ;dim _Bit0_Reset_Restrainer = y
 dim _Bit6_Sequence_Switch = y
 
 dim _sc1 = score
 dim _sc2 = score+1
 dim _sc3 = score+2 
 dim titlescreencolor = $F0

 ;**********************
 ;     Assignments     *
 ;********************** 
 bulletMultiplier = 0
 _High_Score1 = _sc1
 _High_Score2 = _sc2
 _High_Score3 = _sc3 
 lives = 192
 ticker = 0
 _resetTicker = 0
 altSprite = 0
 explosionTicker = 0
 scorecolor = $1b
 firstFrame = 0
 player3MoveLeft = 1
 killCount = 0
 powerUpInPlay = 0
sprites 
 ticker = ticker + 1
 if ticker > 10 then COLUBK = $0 : ticker = 0 :  AUDV0 = 0 : AUDC0 = 0 : AUDF0 = 0 

 
 ;**************************************
 ;     Set random colours on spawn     *
 ;**************************************
 if player1y = 100 then goto setPlayer1Color

completePlayer1ColorSet
 if player2y = 100 then goto setPlayer2Color

completePlayer2ColorSet
 if player3y = 100 then goto setPlayer3Color

;completePlayer3ColorSet
; if player4y = 100 then goto setPlayer4Color


colorSetComplete
 
 if player5y < 200 then explosionTicker = explosionTicker + 1
 if explosionTicker > 1 then player5y = 200:explosionTicker = 0: AUDV0 = 0 : AUDC0 = 0 : AUDF0 = 0
 
 if player2y < 85 && missile1y > 150 && altSprite = 1 then missile1y = player2y: missile1x =  player2x - 3
 if player3y < 85 && missile1y > 150  then missile1y = player3y: missile1x =  player3x - 3
 if player4y < 85 && missile1y > 150  then missile1y = player4y: missile1x =  player4x - 3

 if missile0y > 30 && missile0y < 60 then AUDV1 = 2 : AUDC1 = 12 : AUDF1 = 7 else AUDV1 = 0 : AUDC1 = 0: AUDF0 = 0

 if player0x > (player1x - 20) && player0x < (player1x + 1) && player0y > (player1y - 10) && player0y < (player1y + 15) && powerUpInPlay = 1 then goto handlePowerUp

 if collision(missile1, player0) then goto killPlayer
 if collision(player0, player1) then goto killPlayer
 if _resetTicker > 0 then goto killPlayer 
 if missile1y < 150 && _resetTicker = 0  then missile1y = missile1y -1 
 goto titlepage

handlePowerUp
   player1y = 115
   player2y = 105
   player3y = 120
   player4y = 100

   player1x = player1x + (ticker * 12)
   player2x = player2x + (ticker * 12)
   player3x = player3x + (ticker * 12)
   asteroid4x = 116
   score = score + 50
   COLUBK = $1f
   ticker = 5
   lives = 192   
   AUDV0 = 12 : AUDC0 = 8 : AUDF0 = 28
   goto frameReset

titlepage
 if joy0fire || switchreset then gameReady = 1 
 if gameReady = 1 then goto gamestart 
 gosub titledrawscreen bank2
 _sc1  = 0
 _sc2  = 0
 _sc3  = 0
 _sc1 = _High_Score1
 _sc2 = _High_Score2
 _sc3 = _High_Score3
 
 goto titlepage

gamestart   
   CTRLPF = 1 ;Set the spritre priority
      
   if firstFrame = 0 then missile0x = 200 : missile0y = 200: _sc1  = 0: _sc2 = 0: _sc3 = 0: firstFrame = 1: lives = 192: bulletMultiplier = 0: killCount = 0
   
 lives:
   %00111100
   %00011000
   %00111100
   %00111100
   %00111100
   %00011000
   %00000000
   %00000000
end

   if _sc1 > _High_Score1 then goto __New_High_Score
   if _sc1 < _High_Score1 then goto __Skip_High_Score
   if _sc2 > _High_Score2 then goto __New_High_Score
   if _sc2 < _High_Score2 then goto __Skip_High_Score

   if _sc3 > _High_Score3 then goto __New_High_Score
   if _sc3 < _High_Score3 then goto __Skip_High_Score

   goto __Skip_High_Score

__New_High_Score

   _High_Score1 = _sc1 : _High_Score2 = _sc2 : _High_Score3 = _sc3
__Skip_High_Score

 if ticker < 5 then player0: 
	 %01100110
	 %11111111
	 %10111101
	 %10100101
	 %00111100
	 %00011000
	 %00011000
	 %00000000
end

 if ticker >= 5 then player0: 
	 %00000000
	 %11111111
	 %10111101
	 %10100101
	 %00111100
	 %00011000
	 %00011000
	 %00000000
end

 if powerUpInPlay = 1 then player1:
   %00111110
   %01100011
   %01010001
   %01011101
   %01010101
   %01011101
   %01100011
   %00111110
end
 
 if powerUpInPlay = 0 && ticker < 5 then player1:
   %10011000 
   %01100110 
   %00011000 
   %01111100 
   %00011000 
   %00111100
   %01011010 
   %00111100 
end

 if powerUpInPlay = 0 && ticker >= 5 then player1:
   %00011001 
   %01100110 
   %00011000 
   %00111110 
   %00011000 
   %00111100
   %01011010 
   %00111100 
end

 if ticker < 5 then player2:
 %00000001
 %10011001
 %11111111
 %00111100
 %11111111
 %00111100
 %11100111
 %10011000
end

 if  ticker >= 5 then player2:
 %10000000
 %10011001
 %11111111
 %00111100
 %11111111
 %00111100
 %11100111
 %00011001
end

 if ticker < 3 then player3: 
 %10000001
 %11111111
 %00100100
 %11000011
 %01011010
 %01000010
 %00111100
 %11100111
end

 if ticker >=3 && ticker < 6  then player3: 
 %00000000
 %11111111
 %00100100
 %01000010
 %11011011
 %01000010
 %00111100
 %11100111
end

 if ticker >= 6  then player3: 
 %00000000
 %01111110
 %10100101
 %01000010
 %01011010
 %11000011
 %00111100
 %11100111
end


 if altSprite > 0 && ticker < 5 then player2:
 %00111100
 %11011011
 %01011010
 %11111111
 %10011001
 %10100101
 %11000011
 %01111110
end

 if altSprite > 0 && ticker >= 5 then player2:
 %01011010
 %01011010
 %01011010
 %11111111
 %10000001
 %10100101
 %11000011
 %01111110
end


 if ticker < 5 then  player4:
 %00100100
 %10100101
 %01011010
 %00111100
 %01111110
 %10011001
 %00100100
 %01000010
end

 if ticker >= 5 then player4:
 %00100100
 %00100100
 %11011011
 %00111100
 %11111111
 %00011000
 %00100100
 %00100100
end

 player5:
 %10010001
 %01011010
 %00100100
 %11011011
 %01011010
 %00100100
 %01011010
 %10001001
end

 ;*************************************
 ;* Check if game over conditions met *
 ;************************************* 
 if _resetTicker > 0 then goto frameReset

 if player1y < 41 && powerUpInPlay = 0 then goto killPlayer
 if player1y < 10 && powerUpInPlay = 1 then player1y = 100
 
 ;make player 4 flash
 if ticker > 4 then COLUP4 = $40 else COLUP4 = $70

 if player2y < 41 then goto killPlayer
 if player3y < 41 then goto killPlayer
 if player4y < 41 then goto killPlayer

 if missile1y < 10 then missile1y = 200

 ;Reset bullet if off screen
 if missile0y > 100 then goto skip 

 ;Move the bullet
 missile0y = missile0y+2:goto draw_loop 

skip
 if player0y < 35 && lives < 196 && ticker = 0 then lives = lives + 32: AUDV1 = 2 : AUDC1 = 6 : AUDF1 = 5: bulletMultiplier = bulletMultiplier - 1: goto draw_loop
 if player0y < 35 then goto draw_loop
 if lives < 32 then goto draw_loop
 if joy0fire && player5y > 150 then missile0y = player0y - 4:bulletMultiplier = bulletMultiplier + 1: lives = lives - 32 :missile0x = player0x + 5
draw_loop
 if joy0right && player0x < 134  then player0x = player0x + 1
 if joy0left && player0x > 19  then player0x = player0x - 1
 if joy0down && player0y > 10 then player0y = player0y - 1
 if joy0up && player0y < 90 then player0y = player0y + 1 
 
 if player0y < 35 && lives < 196 && ticker < 5 then COLUP0 = $F0 : goto exitColourSwitch
 if player0y < 35 && lives < 196 && ticker > 5 then COLUP0 = $02 : goto exitColourSwitch
 if lives < 32 then COLUP0 = $40 else COLUP0 = $C6 ; set ship to blue if out of bullets

exitColourSwitch
 if missile0y > 80 then goto frameReset   
 if missile0x > (player1x - 12) && missile0x < (player1x + 3)  && missile0y > player1y - 10 && powerUpInPlay = 0 then player1x = player1x + (ticker * 12): player1y = 115: goto collisions
 if missile0x > (player2x - 12) && missile0x < (player2x + 3) && missile0y > player2y - 10 then player2x = player2x + (ticker * 12): player2y = 105: goto collisions
 if missile0x > (player3x - 12) && missile0x < (player3x + 3) && missile0y > player3y - 10 then player3x = player3x + (ticker * 12): player3y = 120: goto collisions
 if missile0x > (player4x - 12) && missile0x < (player4x + 3) && missile0y > player4y - 10 then player4y = 100: player4x = 116: goto collisions

frameReset 

checkPlayer1Position
 if player1y < 99 then goto checkPlayer2Position
 if player1x < 30 || player1x > 120 then player1x = player1x + 50 : goto checkPlayer1Position
 
checkPlayer2Position
 if player2y < 99 then goto checkPlayer3Position
 if player2x < 30 || player2x > 120 then player2x = player2x + 50 : goto checkPlayer2Position

checkPlayer3Position
 if player3y < 99 then goto exitPositionCheck
 if player3x < 30 || player3x > 120 then player3x = player3x + 50 : goto checkPlayer3Position

exitPositionCheck
;********************************************
;                 SCRIPT                    *
;********************************************
 if _resetTicker > 0 then goto resetScreen  
 if killCount < 5 then goto level1
 if killCount < 11 then goto level2
 if killCount < 18 then goto level3
 if killCount < 26 then goto level4
 if killCount < 35 then goto level5
 if killCount < 45 then goto level6
 if killCount < 56 then goto level7
 if killCount < 68 then goto level8
 if killCount < 81 then goto level9
 if killCount < 95 then goto level10
 if killCount < 110 then goto level11
 if killCount < 126 then goto level12
 if killCount < 143 then goto level13
 if killCount < 161 then goto level14
 if killCount < 180 then goto level15
 if killCount < 200 then goto level16

 asteroidY = asteroidY - 0.50
 asteroid2Y = asteroid2Y - 0.45
 asteroid3Y = asteroid3Y - 0.35
 asteroid4Y = asteroid4Y - 0.08
 COLUPF = $70
 goto resetScreen

level16
 asteroidY = asteroidY - 0.45
 asteroid2Y = asteroid2Y - 0.40
 asteroid3Y = asteroid3Y - 0.30
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level15
 asteroidY = asteroidY - 0.40
 asteroid2Y = asteroid2Y - 0.40
 asteroid3Y = asteroid3Y - 0.26
 asteroid4Y = asteroid4Y - 0.08
 COLUPF = $50
 goto resetScreen

level14
 asteroidY = asteroidY - 0.40
 asteroid2Y = asteroid2Y - 0.66
 asteroid3Y = asteroid3Y - 0.26
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level13
 asteroidY = asteroidY - 0.40
 asteroid2Y = asteroid2Y - 0.33
 asteroid3Y = asteroid3Y - 0.25
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level12
 asteroidY = asteroidY - 0.37
 asteroid2Y = asteroid2Y - 0.30
 asteroid3Y = asteroid3Y - 0.22
 asteroid4Y = asteroid4Y - 0.08
 COLUPF = $60
 goto resetScreen

level11
 asteroidY = asteroidY - 0.34
 asteroid2Y = asteroid2Y - 0.28 
 asteroid3Y = asteroid3Y - 0.20
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level10
 asteroidY = asteroidY - 0.32
 asteroid2Y = asteroid2Y - 0.26 
 asteroid3Y = asteroid3Y - 0.18
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level9
 asteroidY = asteroidY - 0.31
 asteroid2Y = asteroid2Y - 0.21 
 asteroid3Y = asteroid3Y - 0.17
 asteroid4Y = asteroid4Y - 0.08
 COLUPF = $05
 goto resetScreen

level8
 if asteroidY < 100 then asteroidY = asteroidY - 0.31
 asteroid2Y = asteroid2Y - 0.21 
 asteroid3Y = asteroid3Y - 0.17
 asteroid4Y = asteroid4Y - 0.08
 goto resetScreen

level7
 asteroidY = asteroidY - 0.21
 asteroid2Y = asteroid2Y - 0.31
 if asteroid3Y < 100 then asteroid3Y = asteroid3Y - 0.16
 asteroid4Y = asteroid4Y - 0.08
 COLUPF = $02
 goto resetScreen

level6
 asteroidY = asteroidY - 0.21
 asteroid2Y = asteroid2Y - 0.31
 asteroid3Y = asteroid3Y - 0.16
 goto resetScreen

level5
 asteroidY = asteroidY - 0.20
 asteroid2Y = asteroid2Y - 0.30 
 asteroid3Y = asteroid3Y - 0.15
 goto resetScreen

level4
 asteroidY = asteroidY - 0.20
 asteroid2Y = asteroid2Y - 0.30 
 asteroid3Y = asteroid3Y - 0.15
 COLUPF = $10
 goto resetScreen

level3
 if asteroidY < 100 then asteroidY = asteroidY - 0.20
 asteroid2Y = asteroid2Y - 0.30 
 asteroid3Y = asteroid3Y - 0.10
 goto resetScreen

level2
  asteroid2Y = asteroid2Y - 0.30
  asteroidY = asteroidY - 0.20
  goto resetScreen

level1
 asteroid2Y = asteroid2Y - 0.30 
 COLUPF = $70 

resetScreen
 drawscreen
 
 ; X movements
 if _resetTicker > 0 then goto sprites
 if powerUpInPlay = 1 then goto skipPlayer1
 if asteroidY > 70 && asteroidY < 100 then asteroidx = asteroidx + 0.15
 if asteroidY < 70 && asteroidY > 50 then asteroidx = asteroidx - 0.15
 if asteroidY < 50 && asteroidY > 42 then asteroidx = asteroidx + 0.15

skipPlayer1
 if asteroid4Y > 100 then asteroid4x = 116
 if asteroid4Y < 90 && asteroid4Y > 82 then asteroid4x = asteroid4x - 0.75  
 if asteroid4Y < 80 && asteroid4Y > 72 then asteroid4x = asteroid4x + 0.75
 if asteroid4Y < 70 && asteroid4Y > 62 then asteroid4x = asteroid4x - 0.75
 if asteroid4Y < 60 && asteroid4Y > 52 then asteroid4x = asteroid4x + 0.75 
 if asteroid4Y < 50 && asteroid4Y > 42 then asteroid4x = asteroid4x - 0.75

 if asteroid3Y > 100 then goto skipAsteroid3xMovement
 if asteroid3x < 30 then player3MoveLeft = 0
 if asteroid3x > 120 then player3MoveLeft = 1
 if player3MoveLeft = 1 then asteroid3x = asteroid3x - 0.15 else asteroid3x = asteroid3x + 0.15

skipAsteroid3xMovement

 if altSprite = 0 || player2y > 90 then goto sprites
 if player2x - 7 > player0x then asteroid2x = asteroid2x - 0.5
 if player2x - 7 < player0x then asteroid2x = asteroid2x + 0.5

 goto sprites

setPlayer1Color
 if ticker < 5 then _COLUP1 = $22 else _COLUP1 = $38
 if ticker = 7 then powerUpInPlay = 1: _COLUP1 = $1f else powerUpInPlay = 0
 goto completePlayer1ColorSet

setPlayer2Color
 if ticker > 5 then COLUP2 = $68 else COLUP2 = $22
 if ticker < 5 then altSprite = 0
 if ticker >= 5 && killCount > 26 then altSprite = 1

 goto completePlayer2ColorSet

setPlayer3Color
 if ticker = 0 then COLUP3 = $22
 if ticker = 1 then COLUP3 = $38
 if ticker = 2 then COLUP3 = $66
 if ticker = 3 then COLUP3 = $78
 if ticker = 4 then COLUP3 = $CA
 if ticker = 5 then COLUP3 = $D6
 if ticker = 6 then COLUP3 = $E8
 if ticker = 7 then COLUP3 = $3E
 if ticker = 8 then COLUP3 = $DC
 if ticker = 9 then COLUP3 = $48
 if ticker = 10 then COLUP3 = $68
 if ticker > 4 then player3MoveLeft  = 1 else player3MoveLeft = 0

  
 ;goto colorSetComplete
 goto colorSetComplete

;*******************************
;* Collision Logic             *
;* playfield size is 28 <> 141 *
;*******************************
collisions 
 player5x = missile0x + 4
 player5y = missile0y + 9
 missile0y = 200
 missile0x = 200
 AUDV0 = 12 : AUDC0 = 8 : AUDF0 = 28 
 score = score + bulletMultiplier
 killCount = killCount + 1
 goto frameReset

killPlayer
 if _resetTicker < 1 then _resetTicker = 1
 if !_Bit6_Sequence_Switch{6} then _P0_Luminosity = _P0_Luminosity + 1 : if _P0_Luminosity >= $20 then _Bit6_Sequence_Switch{6} = 1: _resetTicker = _resetTicker + 1 
 if _Bit6_Sequence_Switch{6} then _P0_Luminosity = _P0_Luminosity - 1 : if _P0_Luminosity <= $12 then _P0_Luminosity = $10 : _Bit6_Sequence_Switch{6} = 0
 AUDV1 = 10 : AUDC1 = 8 : AUDF1 = 25
 COLUBK = _P0_Luminosity 

 if _resetTicker > 3 then goto resetGame

 goto resetScreen

resetGame

 player0x=75
 player0y=30

 player1x=76
 player1y=115 

 player2x=86
 player2y=105

 player3x=96
 player3y=120

 player4x = 116
 player4y = 100

 missile0y=100
 missile0x=140

 
 _resetTicker = 0 
 missile1y= 200
 COLUBK = $0 
 AUDV1 = 0 : AUDC1 = 0 : AUDF1 = 0
 ;realLives = realLives - 1
 ;if realLives < 1 then gameReady = 0: firstFrame = 0: realLives = 3
 gameReady = 0
 firstFrame = 0
 altSprite = 0

 goto resetScreen    


 bank 2 
 asm
 include "titlescreen/asm/titlescreen.asm"
end


 inline 6lives_statusbar.asm