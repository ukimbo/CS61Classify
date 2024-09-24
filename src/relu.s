.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
#   a0 (int*) is the pointer to the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   None
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# ==============================================================================
relu:
    # Prologue
    li t0, 1   
    blt a1, t0, exit  
    add x1, x2, x0
    add t1, x0, x0 #counter
    addi t2, a1, 0 #limit
    
loop_start:
    beq t1, t2, loop_end #if counter == limit -> loop_end
    slli t3, t1, 2 
    add t4, a0, t3
    lw t5, 0(t4)
    
    blt t5, x0, loop_continue
    
    addi t1, t1, 1
    j loop_start 

loop_continue:
    li t5, 0
    sw t5, 0(t4)
    addi t1, t1, 1
    j loop_start 

loop_end:
    # Epilogue

    jr ra    
    
exit:
    li a0 36
    j exit
