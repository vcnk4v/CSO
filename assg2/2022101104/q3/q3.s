.global findNearest

findNearest:
    pushq %rbp                          # push rbp onto stack
    movq %rsp, %rbp                     # move rsp to rbp
    xorq %r9,%r9                        # initialise index i for ans arr as i=0
    cmpq %r9, %rdx                      # check if i<n
    jle .fin                            # if not, jump to end 
    
.L4:                                    # initialise all elements of ans array as -1
    movq $-1, (%rsi,%r9,8)              # move -1 to ans[i]
    incq %r9                            # i++
    cmpq %r9, %rdx                      # check if i<n
    jg .L4                              # if yes, repeat loop


.L3:
    xorq %r9, %r9                       # set r9 back to 0
    subq $1, %rdx                       # set rdx to n-1
    movq %rdx, %r8                      # initialise r8 as index i of arr, i=n-1
    cmpq $0,%rdx                        # check if n-1 <0
    jl .fin                             # if yes, jump to end



.L1:                                    # loop begins
    cmpq %rsp, %rbp                     # check if stack is empty by comparing with base pointer
    je .L2                              # if empty, jump to .L2
    movq (%rsp), %r9                    # r9 = stack[top]
    movq (%rdi,%r9,8),%rax              # move array[stack[top]] into rax 
    cmpq (%rdi,%r8,8),%rax              # comparing array[stack[top]] wit array[i]
    jg .L2                              # if array[stack[top]] is taller, jump to .L2
    addq $8, %rsp                       # else, pop the stack by deallocating space on stack (adding 8 bytes)
    jmp .L1                             # repeat loop

.L2:
    cmpq %rsp, %rbp                     # check if stack is empty by comparing with base pointer
    je .L5                              # if empty, jump to .L5
    movq (%rdi,%r9,8), %rcx             # move height at the top of stack, array[stack[top]] to rcx
    movq %rcx, (%rsi,%r8,8)             # move rcx to array[i]

.L5:
    pushq %r8                           # push i onto stack
    decq %r8                            # decrement i (i--)

.loop_check:
    cmpq $0, %r8                        # check if i<0
    jl .fin                             # if yes, jump to end
    jmp .L1                             # else, repeat loop

.fin:
    movq %rbp, %rsp                     # move rbp to stack
    popq %rbp                           # pop rbp
    ret                                 # return
