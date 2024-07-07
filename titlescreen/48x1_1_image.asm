
 ; *** if you want to modify the bitmap color on the fly, just dim a
 ; *** variable in bB called 'bmp_48x1_1_color' , and use it to set the
 ; *** color.

 ;*** The height of the displayed data...
bmp_48x1_1_window = 48

 ;*** The height of the bitmap data. This can be larger than
 ;*** the displayed data height, if you are scrolling or animating
 ;*** the data...
bmp_48x1_1_height = 48

 ifnconst bmp_48x1_1_color
bmp_48x1_1_color
 endif
 ; *** this is the bitmap color. If you want to change it in a 
 ; *** variable instead, dim one in bB called bmp_48x1_1_color
	.byte $0c


   if >. != >[.+bmp_48x1_1_height]
      align 256
   endif

bmp_48x1_1_00

	BYTE %00000000
	BYTE %00000000
	BYTE %01111111
	BYTE %00000000
	BYTE %00111100
	BYTE %00111100
	BYTE %00111100
	BYTE %01001110
	BYTE %01001110
	BYTE %00001110
	BYTE %00001110
	BYTE %00001110
	BYTE %00111100
	BYTE %00111100
	BYTE %01100000
	BYTE %01100000
	BYTE %01100000
	BYTE %00111100
	BYTE %00111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000001
	BYTE %00000001
	BYTE %00000011
	BYTE %00000011
	BYTE %00000011
	BYTE %00000111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001111
	BYTE %00011111
	BYTE %00111111
	BYTE %00111111
	BYTE %01111111
	BYTE %01111111
	BYTE %00000000
	BYTE %00000000

   if >. != >[.+(bmp_48x1_1_height)]
      align 256
   endif

bmp_48x1_1_01

	BYTE %00000000
	BYTE %00000000
	BYTE %11111111
	BYTE %00000000
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %01111110
	BYTE %01111110
	BYTE %01111110
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %01001110
	BYTE %00111100
	BYTE %00111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00110000
	BYTE %01110011
	BYTE %01110011
	BYTE %01110011
	BYTE %11110100
	BYTE %11110100
	BYTE %11110000
	BYTE %11110000
	BYTE %11110000
	BYTE %11110011
	BYTE %11110011
	BYTE %11110110
	BYTE %11110110
	BYTE %11110110
	BYTE %11110011
	BYTE %11110011
	BYTE %11110000
	BYTE %11110000
	BYTE %11110000
	BYTE %00000000
	BYTE %00000000

   if >. != >[.+(bmp_48x1_1_height)]
      align 256
   endif

bmp_48x1_1_02

	BYTE %00000000
	BYTE %00000000
	BYTE %11111111
	BYTE %00000000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00101100
	BYTE %00101100
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %01000110
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %11000110
	BYTE %11000110
	BYTE %11000110
	BYTE %11100110
	BYTE %11100110
	BYTE %11100111
	BYTE %11100111
	BYTE %11100111
	BYTE %11000111
	BYTE %11000111
	BYTE %00000110
	BYTE %00000110
	BYTE %00000110
	BYTE %11000110
	BYTE %11000110
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000

   if >. != >[.+(bmp_48x1_1_height)]
      align 256
   endif

bmp_48x1_1_03

	BYTE %00000000
	BYTE %00000000
	BYTE %11111111
	BYTE %00000000
	BYTE %00111100
	BYTE %00111100
	BYTE %00111100
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00011000
	BYTE %00111100
	BYTE %00111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %01100001
	BYTE %01100001
	BYTE %01100001
	BYTE %11000001
	BYTE %11000001
	BYTE %10000001
	BYTE %10000001
	BYTE %10000001
	BYTE %10000011
	BYTE %10000011
	BYTE %11000110
	BYTE %11000110
	BYTE %11000110
	BYTE %01100110
	BYTE %01100110
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000

   if >. != >[.+(bmp_48x1_1_height)]
      align 256
   endif

bmp_48x1_1_04

	BYTE %00000000
	BYTE %00000000
	BYTE %11111111
	BYTE %00000000
	BYTE %00111100
	BYTE %00111100
	BYTE %00111100
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %00111100
	BYTE %00111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00001100
	BYTE %10001110
	BYTE %10001110
	BYTE %10001110
	BYTE %10001111
	BYTE %10001111
	BYTE %10001111
	BYTE %10001111
	BYTE %10001111
	BYTE %11001111
	BYTE %11001111
	BYTE %01101111
	BYTE %01101111
	BYTE %01101111
	BYTE %01101111
	BYTE %01101111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001111
	BYTE %00000000
	BYTE %00000000

   if >. != >[.+(bmp_48x1_1_height)]
      align 256
   endif

bmp_48x1_1_05

	BYTE %00000000
	BYTE %00000000
	BYTE %11111110
	BYTE %00000000
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01101000
	BYTE %01101000
	BYTE %01111100
	BYTE %01111100
	BYTE %01111100
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01100110
	BYTE %01111100
	BYTE %01111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %10000000
	BYTE %11000000
	BYTE %11000000
	BYTE %11100000
	BYTE %11100000
	BYTE %11110000
	BYTE %11110000
	BYTE %11110000
	BYTE %11111000
	BYTE %11111100
	BYTE %11111100
	BYTE %11111100
	BYTE %11111100
	BYTE %00000000
	BYTE %00000000

