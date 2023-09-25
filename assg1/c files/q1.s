.global get_sum

get_sum:
    xorq %r8, %r8             # initialise sum to be returned, sum=0
    xorq %r9, %r9             # initialise index, i=0

.loop:
    cmpq %rsi, %r9            # checking if index is greater than size
    jge .fin                  # if index becomes greater than size, finish loop

    movq (%rdi,%r9,8), %rax   # moving current element arr[i] to rax for division by idiv
    xorq %rdx, %rdx           # rdx is set to 0 for division by idiv
    movq $3, %rcx             # moving value 3 to rcx 
    idivq %rcx                # dividing rdx:rax by 3 - remainder is stored in rdx

    testq %rdx, %rdx          # testq checks if rdx is 0 using bitwise AND
    jnz .n                    # if remainder is not zero, skip the addition step and go to next iteration

    addq (%rdi,%r9,8), %r8    # else, add the value of a[i] to sum

.n:
    incq %r9                  # increment index by 1
    jmp .loop                 # repeat loop

.fin:
    movq %r8, %rax            # mov the value of sum in r8 to rax, because rax stores return value of fnc
    ret                       # return sum
