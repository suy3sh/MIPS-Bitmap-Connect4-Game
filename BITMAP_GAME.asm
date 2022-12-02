#BitMap Connect Four Program
#Suyesh Shrestha
#November 5th

#Instructions:
#	set pixel dimensions to 8x8
# 	set display dem to 512x512
#	connect to mips and run

.eqv WIDTH 64
.eqv HEIGHT 64
.eqv MEM 0x10010000

#colors
#Player 1 color
.eqv RED	0x00FF0000
#Player 2 color
.eqv YELLOW 	0X00FFFF00
#color of board
.eqv BLUE	0X000000FF
#color of numbers
.eqv WHITE 	0X00FFFFFF


.text

######################### DRAW THE BOARD #################################




#draw bottom row for numbers
#counters
#i = 0
li $t0, 0 
#j = 63
li $t1, 63


loop1:
add 	$a0, $0, $t0	
add 	$a1, $0, $t1 
addi 	$a2, $0, BLUE	
jal	draw_pixel
addi 	$t0, $t0, 1	#i++

#delay
li $a0, 1 
li $v0, 32
syscall

blt 	$t0, WIDTH, loop1
beq 	$t0, WIDTH, loop2
	
loop2:
li 	$t0, 0 
addi 	$t1, $t1, -1  	#j--
bgt	$t1, 53, loop1

#draw vertical bars
#counters
#i = 0
li $t0, 0
#j = 0
li $t1, 0

loop3:
add $a0, $0, $t0
add $a1, $0, $t1
addi $a2, $0, BLUE
jal draw_pixel
add $t1, $t1, 1		#j++

#delay
li $a0, 2 
li $v0, 32
syscall

blt $t1, HEIGHT, loop3
beq $t1, HEIGHT, loop4

loop4:
li 	$t1, 0
addi 	$t0, $t0, 9	#i = i + 9
blt 	$t0, WIDTH, loop3


#draw horizontal bars
#counters
#i = 0
li $t0, 0
#j = 0
li $t1, 0

loop5:
add $a0, $0, $t0
add $a1, $0, $t1
addi $a2, $0, BLUE
jal draw_pixel
add $t0, $t0, 1		#i++

#delay
li $a0, 2 
li $v0, 32
syscall

blt 	$t0, WIDTH, loop5
beq 	$t0, WIDTH, loop6

loop6:
li 	$t0, 0
addi 	$t1, $t1, 9	#j = j + 9
blt 	$t1, HEIGHT, loop5


#draw numbers on bottom row

#DRAW NUMBER 1
addi 	$a2, $0, WHITE  

addi 	$a0, $0, 4 
addi 	$a1, $0, 55  
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 56  
jal 	draw_pixel

addi 	$a0, $0, 3 
addi 	$a1, $0, 56 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 4 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 3 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 5 
addi 	$a1, $0, 62 
jal 	draw_pixel

#delay
li $a0, 250 
li $v0, 32
syscall

#DRAW NUMBER 2
addi 	$a0, $0, 16 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 15 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 14 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 13 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 12 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 11 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 11 
addi 	$a1, $0, 61  
jal 	draw_pixel

addi 	$a0, $0, 11 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 12 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 13 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 14 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 15 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 16 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 16 
addi 	$a1, $0, 56 
jal 	draw_pixel

addi 	$a0, $0, 15 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 14 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 13 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 12 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 11 
addi 	$a1, $0, 56
jal 	draw_pixel

#delay
li $a0, 250
li $v0, 32
syscall

#DRAW NUMBER 3
addi 	$a0, $0, 20 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 21 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 22 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 23 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 24 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 25 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 25 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 25 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 24 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 25 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 25 
addi 	$a1, $0, 56 
jal 	draw_pixel

addi 	$a0, $0, 24 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 23 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 22 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 21 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 20 
addi 	$a1, $0, 56 
jal 	draw_pixel

#delay
li $a0, 250 
li $v0, 32
syscall

#DRAW NUMBER 4
addi 	$a0, $0, 29 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 29 
addi 	$a1, $0, 56 
jal 	draw_pixel

addi 	$a0, $0, 29 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 29 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 30 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 31 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 32 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 33 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 55 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 56 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 34 
addi 	$a1, $0, 62 
jal 	draw_pixel

#delay
li $a0, 250 
li $v0, 32
syscall


#DRAW NUMBER 5
addi 	$a0, $0, 38 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 39 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 40 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 41 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 42 
addi 	$a1, $0, 62 
jal 	draw_pixel

addi 	$a0, $0, 43 
addi 	$a1, $0, 61 
jal 	draw_pixel

addi 	$a0, $0, 43 
addi 	$a1, $0, 60 
jal 	draw_pixel

addi 	$a0, $0, 43 
addi 	$a1, $0, 59 
jal 	draw_pixel

addi 	$a0, $0, 42 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 41 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 40 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 39 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 38 
addi 	$a1, $0, 58 
jal 	draw_pixel

addi 	$a0, $0, 38 
addi 	$a1, $0, 57 
jal 	draw_pixel

addi 	$a0, $0, 38 
addi 	$a1, $0, 56
jal 	draw_pixel

addi 	$a0, $0, 38 
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 39 
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 40 
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 41
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 42
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 43
addi 	$a1, $0, 55
jal 	draw_pixel

#delay
li $a0, 250
li $v0, 32
syscall

#DRAW NUMBER 6
addi 	$a0, $0, 52
addi 	$a1, $0, 56
jal 	draw_pixel

addi 	$a0, $0, 51
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 50
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 49
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 48
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 56
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 57
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 58
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 59
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 60
jal 	draw_pixel

addi 	$a0, $0, 47
addi 	$a1, $0, 61
jal 	draw_pixel

addi 	$a0, $0, 48
addi 	$a1, $0, 62
jal 	draw_pixel

addi 	$a0, $0, 49
addi 	$a1, $0, 62
jal 	draw_pixel

addi 	$a0, $0, 50
addi 	$a1, $0, 62
jal 	draw_pixel

addi 	$a0, $0, 51
addi 	$a1, $0, 62
jal 	draw_pixel

addi 	$a0, $0, 52
addi 	$a1, $0, 61
jal 	draw_pixel

addi 	$a0, $0, 52
addi 	$a1, $0, 60
jal 	draw_pixel

addi 	$a0, $0, 52
addi 	$a1, $0, 59
jal 	draw_pixel

addi 	$a0, $0, 51
addi 	$a1, $0, 58
jal 	draw_pixel

addi 	$a0, $0, 50
addi 	$a1, $0, 58
jal 	draw_pixel

addi 	$a0, $0, 49
addi 	$a1, $0, 58
jal 	draw_pixel

addi 	$a0, $0, 48
addi 	$a1, $0, 58
jal 	draw_pixel

#delay
li $a0, 250
li $v0, 32
syscall

#DRAW NUMBER 7
addi 	$a0, $0, 56
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 57
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 58
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 59
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 60
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 61
addi 	$a1, $0, 55
jal 	draw_pixel

addi 	$a0, $0, 61
addi 	$a1, $0, 56
jal 	draw_pixel

addi 	$a0, $0, 60
addi 	$a1, $0, 57
jal 	draw_pixel

addi 	$a0, $0, 59
addi 	$a1, $0, 58
jal 	draw_pixel

addi 	$a0, $0, 58
addi 	$a1, $0, 59
jal 	draw_pixel

addi 	$a0, $0, 57
addi 	$a1, $0, 60
jal 	draw_pixel

addi 	$a0, $0, 56
addi 	$a1, $0, 61
jal 	draw_pixel

addi 	$a0, $0, 56
addi 	$a1, $0, 62
jal 	draw_pixel

########################### END OF BOARD BEING DRAWN ##############################
########################### START OF KEYBOARD INPUT ###############################

#counters for each of the columns 
#checks if there has been a token already placed in that column
li $t1 9
li $t2 9
li $t3 9
li $t4 9
li $t5 9
li $t6 9
li $t7 9

#player one(yellow) goes first
li $a2, RED

li $t8, RED
li $t9, YELLOW

keyboard:

#check for input
lw 	$t0, 0xffff0000  #t1 holds if input available
beq 	$t0, 0, keyboard   #If no input, keep displaying
    	
#process the input
lw	$s1, 0xffff0004

beq 	$s1, 49, column1 	#input 1	
beq 	$s1, 50, column2 	#input 2
beq	$s1, 51, column3 	#input 3
beq 	$s1, 52, column4 	#input 4
beq 	$s1, 53, column5 	#input 5
beq 	$s1, 54, column6 	#input 6
beq 	$s1, 55, column7 	#input 7
beq 	$s1, 119, winner	#input w after winning
beq	$s1, 32, exit		#input space


#invalid input, ignore
j 	keyboard

#process valid inputs

#input 1
column1:

#if statement to switch the color
beq $t9, $a2, red1
j else1

red1:
li $a2, RED
j endif1

else1:
li $a2, YELLOW

endif1:

#add to the counter each time 1 is pressed
addi $t1, $t1, -9

addi 	$a0, $0, 4
addi 	$a1, $t1, 49
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $t1, 49
jal	draw_pixel

addi 	$a0, $0, 4
addi 	$a1, $t1, 50
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $t1, 50
jal	draw_pixel
j 	keyboard

#input2
column2:

#if statement to switch the color
beq $t9, $a2, red2
j else2

red2:
li $a2, RED
j endif2

else2:
li $a2, YELLOW

endif2:

#add to the counter each time 2 is pressed
addi $t2, $t2, -9

addi 	$a0, $0, 13
addi 	$a1, $t2, 49
jal	draw_pixel

addi 	$a0, $0, 14
addi 	$a1, $t2, 49
jal	draw_pixel

addi 	$a0, $0, 13
addi 	$a1, $t2, 50
jal	draw_pixel

addi 	$a0, $0, 14
addi 	$a1, $t2, 50
jal	draw_pixel
j 	keyboard

#input 3
column3:

#if statement to switch the color
beq $t9, $a2, red3
j else3

red3:
li $a2, RED
j endif3

else3:
li $a2, YELLOW

endif3:

#add to the counter each time 3 is pressed
addi $t3, $t3, -9

addi 	$a0, $0, 22
addi 	$a1, $t3, 49
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $t3, 49
jal	draw_pixel

addi 	$a0, $0, 22
addi 	$a1, $t3, 50
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $t3, 50
jal	draw_pixel
j 	keyboard

#input4
column4:

#if statement to switch the color
beq $t9, $a2, red4
j else4

red4:
li $a2, RED
j endif4

else4:
li $a2, YELLOW

endif4:

#add to the counter each time 4 is pressed
addi $t4, $t4, -9

addi 	$a0, $0, 31
addi 	$a1, $t4, 49
jal	draw_pixel

addi 	$a0, $0, 32
addi 	$a1, $t4, 49
jal	draw_pixel

addi 	$a0, $0, 31
addi 	$a1, $t4, 50
jal	draw_pixel

addi 	$a0, $0, 32
addi 	$a1, $t4, 50
jal	draw_pixel
j 	keyboard

#input5
column5:

#if statement to switch the color
beq $t9, $a2, red5
j else5

red5:
li $a2, RED
j endif5

else5:
li $a2, YELLOW

endif5:

#add to the counter each time 5 is pressed
addi $t5, $t5, -9

addi 	$a0, $0, 40
addi 	$a1, $t5, 49
jal	draw_pixel

addi 	$a0, $0, 41
addi 	$a1, $t5, 49
jal	draw_pixel

addi 	$a0, $0, 40
addi 	$a1, $t5, 50
jal	draw_pixel

addi 	$a0, $0, 41
addi 	$a1, $t5, 50
jal	draw_pixel
j 	keyboard

#input6
column6:

#if statement to switch the color
beq $t9, $a2, red6
j else6

red6:
li $a2, RED
j endif6

else6:
li $a2, YELLOW

endif6:

#add to the counter each time 6 is pressed
addi $t6, $t6, -9

addi 	$a0, $0, 49
addi 	$a1, $t6, 49
jal	draw_pixel

addi 	$a0, $0, 50
addi 	$a1, $t6, 49
jal	draw_pixel

addi 	$a0, $0, 49
addi 	$a1, $t6, 50
jal	draw_pixel

addi 	$a0, $0, 50
addi 	$a1, $t6, 50
jal	draw_pixel
j 	keyboard

#input7
column7:

#if statement to switch the color
beq $t9, $a2, red7
j else7

red7:
li $a2, RED
j endif7

else7:
li $a2, YELLOW

endif7:

#add to the counter each time 7 is pressed
addi $t7, $t7, -9

addi 	$a0, $0, 58
addi 	$a1, $t7, 49
jal	draw_pixel

addi 	$a0, $0, 59
addi 	$a1, $t7, 49
jal	draw_pixel

addi 	$a0, $0, 58
addi 	$a1, $t7, 50
jal	draw_pixel

addi 	$a0, $0, 59
addi 	$a1, $t7, 50
jal	draw_pixel
j 	keyboard


#input if w is pressed
winner:

#clear numbers from bottom
#counters
#i = 0
li $t0, 0 
#j = 63
li $t1, 63

loop1_w:
add 	$a0, $0, $t0	
add 	$a1, $0, $t1 
addi 	$a2, $0, BLUE	
jal	draw_pixel
addi 	$t0, $t0, 1	#i++

blt 	$t0, WIDTH, loop1_w
beq 	$t0, WIDTH, loop2_w
	
loop2_w:
li 	$t0, 0 
addi 	$t1, $t1, -1  	#j--
bgt	$t1, 53, loop1_w

#set color of letters to white
li $a2, WHITE

#draw the Y
addi 	$a0, $0, 1
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 1
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 1
addi 	$a1, $0, 57
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

addi 	$a0, $0, 2
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 2
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 2
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 2
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 2
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

addi 	$a0, $0, 3
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 3
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 3
addi 	$a1, $0, 57
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

#draw the O

addi 	$a0, $0, 5
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 5
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

addi 	$a0, $0, 6
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 6
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

addi 	$a0, $0, 7
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 7
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 5 
li $v0, 32
syscall

#draw the U
addi 	$a0, $0, 9
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 9
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 10
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 11
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 11
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

#draw the W
addi 	$a0, $0, 15
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 15
addi 	$a1, $0, 61
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 16
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 17
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 17
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 17
addi 	$a1, $0, 61
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 18
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 19
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 19
addi 	$a1, $0, 61
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

#draw the I
addi 	$a0, $0, 21
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 21
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall


#draw the N
addi 	$a0, $0, 23
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 23
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 24
addi 	$a1, $0, 56
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 25
addi 	$a1, $0, 57
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 26
addi 	$a1, $0, 58
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 27
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 61
jal	draw_pixel

addi 	$a0, $0, 27
addi 	$a1, $0, 62
jal	draw_pixel

#delay
li $a0, 25 
li $v0, 32
syscall

addi 	$a0, $0, 29
addi 	$a1, $0, 55
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 56
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 57
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 58
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 59
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 60
jal	draw_pixel

addi 	$a0, $0, 29
addi 	$a1, $0, 62
jal	draw_pixel


j 	keyboard



exit:	
li	$v0, 10
syscall



# subroutine to draw a pixel
# $a0 = X
# $a1 = Y
# $a2 = color

draw_pixel:
# s1 = address = MEM + 4*(x + y*width)
mul	$s1, $a1, WIDTH   # y * WIDTH
add	$s1, $s1, $a0	  # add X
mul	$s1, $s1, 4	  # multiply by 4 to get word offset
add	$s1, $s1, MEM	  # add to base address
sw	$a2, 0($s1)	  # store color at memory location
jr $ra










