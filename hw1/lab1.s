.data
in: .word 6     # test input

.text
main:

lw   a0, in
jal  ra, isPerfect

mv   a0, a1      # output answer
li a7, 1
ecall
li   a7, 10      # end program
ecall

isPerfect:       #function a0: input, a1: ret

srli a1, a0, 1   # a2 = a0 >> 1
li   a3, 0       # a3 = 0 (use as temporary sum)
LOOP:            # do

rem  a2, a0, a1  # a2 = a0 % a1

bnez a2, EIF     # if a2 == 0
add  a3, a3, a1  # a3 += a1
EIF:             # endif
addi a1, a1, -1  # a1--
bnez a1, LOOP    # while (a2 != 0)

li   a1, 0       # a0 = (a3 == a0) ? 1 : 0;
bne  a3, a0, END
li   a1, 1

END:
ret