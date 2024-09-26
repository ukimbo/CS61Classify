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
    bge t1, a2, loop_end # Exit loop if t1 >= a2

    # Loop body
    lw t4, 0(t2) #Load current array value of array0
    lw t5, 0(t3) #Load current array value of array1
    
    mul t5, t5, t4 # Multiply the two array values
    add t0, t0, t5 # Add them to the working sum
    
    mv t6, a3 # x = stride0 
    slli t6, t6, 2 # x = x * 4
    
    add t2, t2, t6 # Increment array0 pointer
    
    mv t6, a4 # y = stride1
    slli t6, t6, 2 # y = y * 4
    
    add t3, t3, t6 # Increment array1 pointer
    
    addi t1, t1, 1 # Increment loop counter
    j loop_start
    
loop_end:
    # Epilogue
    mv a0, t0
    jr ra
    
error_36:
    li a0, 36       
    j end

error_37:
    li a0, 37       
    j end      
    
end:
    