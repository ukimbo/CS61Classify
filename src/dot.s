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
    
    li t0, 0 # workingSum
    li t1, 0 # loopCounter
    mv t2, a0 # array0 counter
    mv t3, a1 # array1 counter
    
loop_start:
    beq t1, a1, loop_end
    lw t4, 0(t2)
    lw t5, 0(t3)
    add t0, t4, t5
    
    
    add t2, t2, a0
    add t3, t3, a1
    
    addi t1, t1, 1
    j loop_start

loop_end:

    # Epilogue
    mv a0, t0
    jr ra
    
error_36:
    li a0, 36
    ecall
    
error_37:
    li a0, 37
    ecall
