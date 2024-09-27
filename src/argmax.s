
.globl argmax

.text
# =================================================================
# FUNCTION: Given a int array, return the index of the largest
#   element. If there are multiple, return the one
#   with the smallest index.
# Arguments:
#   a0 (int*) is the pointer to the start of the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   a0 (int)  is the first index of the largest element
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)

    li t1, 0
    li t2, 1
loop_start:
    bge t2, a1, loop_end
    slli t3, t2, 2

    add t4, a0, t3
    lw t5, 0(t4)

    ble t5, t0, loop_continue

    mv t0, t5
    mv t1, t2
loop_continue:

    addi t2, t2, 1
    j loop_start
loop_end:
    mv a0, t1
    
    jr ra
handle_error:
    li a0, 36
    j exit
