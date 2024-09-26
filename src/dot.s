.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int arrays
# Arguments:
#   a0 (int*) is the pointer to the start of arr0
#   a1 (int*) is the pointer to the start of arr1
#   a2 (int)  is the number of elements to use
#   a3 (int)  is the stride of arr0
#   a4 (int)  is the stride of arr1
# Returns:
#   a0 (int)  is the dot product of arr0 and arr1
# Exceptions:
#   - If the number of elements to use is less than 1,
#     this function terminates the program with error code 36
#   - If the stride of either array is less than 1,
#     this function terminates the program with error code 37
# =======================================================
dot:
    # Prologue
    li t0, 1
    blt a2, t0, error_36
    blt a3, t0, error_37
    blt a4, t0, error_37

    li t0, 0    # workingSum
    li t1, 0    # loopCounter
    mv t2, a0   # arr0 pointer
    mv t3, a1   # arr1 pointer

loop_start:
    beq t1, a2, loop_end
    lw t4, 0(t2)   # Load arr0 element
    lw t5, 0(t3)   # Load arr1 element

    mul t6, t4, t5
    add t0, t0, t6

    slli t6, a3, 2   # t6 = stride0 * 4
    add t2, t2, t6   # Move arr0 pointer

    slli t6, a4, 2   # t6 = stride1 * 4
    add t3, t3, t6   # Move arr1 pointer

    addi t1, t1, 1
    j loop_start

loop_end:
    mv a0, t0
    jr ra

error_36:
    li a0, 36
    j end

error_37:
    li a0, 37
    j end

end:
    jr ra