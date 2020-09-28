.data
n: .word 8
.text

main:
la t0, n  # copy addr of n to reg t0
lw a0, 0(t0)  # load the first bit of t0 to a0 (8)
jal ra, factorial # calling function factorial
addi a1, a0, 0 # a1 = a0
addi a0, x0, 1 # a0 = x0+1 = 1
ecall # Print Result
addi a0, x0, 10 # a0 = x0 + 10 = 10
ecall # Exit

factorial:
addi a0, a0, 1 # if 0! = 1
addi s10, x0, 1 #init factorial = 1
addi s11, x0, 1 # init i = 1

Loop:
mul s10, s10, s11 # factorial = factorial * i
addi s11, s11, 1 # i++
blt s11, a0, Loop # Loop while i < n

addi a0, s10, 0 # a0 = s10
jr ra # jump back
