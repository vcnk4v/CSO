.global is_balanced

is_balanced:
    xorq %rdx, %rdx                     # set rdx to 0
    movq %rdi, %rax                     # move n to rax for division
    movq $2, %rcx                       # move 2 to rcx 
    idivq %rcx                          # compute n/2, remainder stored in rdx
    movq $0, %rax                       # set rax to 0
    testq %rdx, %rdx                    # check if rdx is 0
    jnz end                             # if rdx!=0, n%2!=0, so cannot be balanced (given string only has brackets)
    pushq %rbp                          # push rbp onto stack
    movq %rsp, %rbp                     # move rsp to rbp
    
    xorq %rdx, %rdx                     # index i = 0 stored in rdx
    
.L1:
    movb (%rsi, %rdx, 1), %r8b          # move string input[i] into r8
    cmpb $'(',%r8b                      # check if left bracket, '('
    je .L61                             # if yes, jump to .L61
    cmpb $'{',%r8b                      # else, check if left bracket, '{'
    je .L62                             # if yes, jump to .L62
    cmpb $'[',%r8b                      # else, check if left bracket, '['
    je .L62                             # if yes, jump to .L62
    cmpb $']',%r8b                      # else, check if right bracket ']'
    je .L7                              # if yes, jump to .L7
    cmpb $')',%r8b                      # else, check if right bracket ')'
    je .L7                              # if yes, jump to .L7
    cmpb $'}',%r8b                      # else, check if right bracket '}'
    je .L7                              # if yes, jump to .L7
    jmp .L2                             # otherwise, jump to .L2 (continue loop)

.L7:                                    # right bracket encountered
    cmpq %rsp, %rbp                     # to check if stack is empty, compare rsp with original rsp value stored in rbp
    je .L9                              # if stack is empty (rsp==rbp), jump to end, since no matching left bracket found
    cmpb %r8b, (%rsp)                   # compare top of stack with input[i] (is lastest left bracket a match for right bracket found)
    jne .L10                            # if match not found, jump to end
    popq %rcx                           # else, pop the stack
    jmp .L2                             # jump to .L2 (continue loop)

.L61:                                   # '(' bracket found, difference in ascii of '(' and ')' is 1
    addq $1, %r8                        # add 1 + '(' = ')'
    pushq %r8                           # store corresponding right bracket in stack
    jmp .L2                             # jump to .L2 (continue loop)

.L62:                                   # '[' or '{' bracket found, difference in asciis of corresponding closinf brackets is 2
    addq $2, %r8                        # add 2 + '{' or '[' = '}' or ']'
    pushq %r8                           # store corresponding right bracket in stack

.L2:                                    # loop condition
    addq $1, %rdx                       # increment i++
    cmpq %rdi, %rdx                     # for loop check i<n
    jl .L1                              # if less, go to loop
    
.L8:
    movq $1, %r9                        # empty the stack if not empty
    cmpq %rsp, %rbp                     # check if stack is emoty by comparing to base pointer
    cmove %r9, %rax                     # if yes, balances, move 1 to rax (return value)
    jmp .L9                             # jump to .L9

.L10:
    cmpq %rsp, %rbp                     # check if stack is empty
    je .L9                              # if yes, move to end
    popq %r8                            # else, pop
    jmp .L10                            # repeat until stack is empty
    
.L9:
    movq %rbp, %rsp                     # restore stack to original top
    popq %rbp                           # pop rbp

end:
    ret                                 # end
