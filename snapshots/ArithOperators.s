#include "screen.h"
#include "system.h"

.global main

.data

str__101: .asciiz "Mod %d\n"
str__225: .asciiz "Add %d\n"
str__281: .asciiz "X = %d, Y = %d\n"
str__422: .asciiz "Sub %d\n"
str__619: .asciiz "Mul %d\n"
str__816: .asciiz "Div %d\n"

.text


main:


# prologue
addi $sp, $sp, -4
sw $fp, 0($sp)
move $fp, $sp

addi $sp, $sp, -4
sw $ra, 0($sp)

# screen setup
li $a0, BRIGHT_WHITE
li $a1, BLACK
jal set_color
jal clear_screen


# prologue
addi $sp, $sp, -4
sw $fp, 0($sp)
move $fp, $sp

# int x
addi $sp, $sp, -4
# int y
addi $sp, $sp, -4


lw $t0, MS_COUNTER_REG_ADDR
move $a0, $t0
jal srand
move $t0, $v0

addi $sp, $sp, -4
sw $s0, 0($sp)
addi $s0, $fp, -4
jal rand
move $t0, $v0
move $a0, $t0
li $t0, 100
move $a1, $t0
jal mod
move $t0, $v0
li $t1, 1
add $t0, $t0, $t1
sw $t0, 0($s0)
lw $s0, 0($sp)
move $t1, $t0

addi $sp, $sp, -4
sw $s0, 0($sp)
addi $s0, $fp, -8
jal rand
move $t0, $v0
move $a0, $t0
li $t0, 100
move $a1, $t0
jal mod
move $t0, $v0
li $t1, 1
add $t0, $t0, $t1
sw $t0, 0($s0)
lw $s0, 0($sp)
move $t1, $t0

la $t0, str__281
move $a0, $t0
lw $t0, -4($fp)
move $a1, $t0
lw $t0, -8($fp)
move $a2, $t0
jal printf
move $t0, $v0

la $t0, str__225
move $a0, $t0
lw $t0, -4($fp)
lw $t1, -8($fp)
add $t0, $t0, $t1
move $a1, $t0
jal printf
move $t0, $v0

la $t0, str__422
move $a0, $t0
lw $t0, -4($fp)
lw $t1, -8($fp)
sub $t0, $t0, $t1
move $a1, $t0
jal printf
move $t0, $v0

la $t0, str__619
move $a0, $t0
lw $t0, -4($fp)
addi $sp, $sp, -4
sw $a0, 0($sp)
move $a0, $t0
lw $t0, -8($fp)
move $a1, $t0
jal mult
move $t0, $v0
lw $a0, 0($sp)
move $a1, $t0
jal printf
move $t0, $v0

la $t0, str__816
move $a0, $t0
lw $t0, -4($fp)
addi $sp, $sp, -4
sw $a0, 0($sp)
move $a0, $t0
lw $t0, -8($fp)
move $a1, $t0
jal div
move $t0, $v0
lw $a0, 0($sp)
move $a1, $t0
jal printf
move $t0, $v0

la $t0, str__101
move $a0, $t0
lw $t0, -4($fp)
addi $sp, $sp, -4
sw $a0, 0($sp)
move $a0, $t0
lw $t0, -8($fp)
move $a1, $t0
jal mod
move $t0, $v0
lw $a0, 0($sp)
move $a1, $t0
jal printf
move $t0, $v0


# epilogue
move $sp, $fp
lw $fp, 0($sp)
addi $sp, $sp, 4

lw $ra, -4($fp)

# epilogue
move $sp, $fp
lw $fp, 0($sp)
addi $sp, $sp, 4


jr $ra

