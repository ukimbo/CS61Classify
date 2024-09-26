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
    # Prologue
    li t0, 1                
    blt a1, t0, error_terminate  

    li t1, 0 #loop counter
    li t2, 0 #currentMaxIndex
    li t6, 0 #currentMax

loop_start:
    beq t1, a1, loop_end
    slli t3, t1, 2          
    add t4, a0, t3         
    lw t5, 0(t4)
    blt t6, t5, max
    
    j loop_continue         

max:
    mv t6, t5
    mv t2, t1 

loop_continue:
    addi t1, t1, 1          
    blt t1, a1, loop_start 

loop_end:
    # Epilogue
    jr ra
    
error_terminate:
    li a0, 36               
    ecall   