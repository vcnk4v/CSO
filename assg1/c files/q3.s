.global divide

divide:
    testq %rsi, %rsi            # check if denominator is zero
    jnz start                   # jump to code for non-zero denominator
    movq $-1, (%rdx)            # if denominator is 0, arr[0]=-1
    movq $-1, 8(%rdx)           # if denominator is 0, arr[1]=-1
    ret                         # return

start:
    movq %rdi, 8(%rdx)          # move M into arr[1], to initialise remainder, r=M
    movq %rsi, %r8              # move N into r8

    cmpq $0, %rdi               # check if M is negative
    jl neg_m                    # if M<0, jump to code for negative M

    cmpq $0, %rsi               # else, M>0, check if n is negative
    jg L1                       # if N>0, jump to loop (M and N are of same sign)
    notq %r8                    # else, change sign of N 
    incq %r8                    # -N = ~N + 1 by 2's complement method

L1:
    cmpq 8(%rdx), %r8           # compare arr[0] (remainder, r) with N (divisor)
    jg endL1                    # if r < N, exit loop
    subq %r8, 8(%rdx)           # else, subtract N from remainder
    incq (%rdx)                 # increment arr[0] (quotient, q)
    jmp L1                      # repeat loop

neg_m:                          # code for M<0
    cmpq $0, %rsi               # check if N>0
    jl L2                       # if N<0, jump to loop (M and N are of same sign)
    notq %r8                    # else, change sign of N
    incq %r8                    # -N = ~N + 1 by 2's complement method

L2:
    cmpq $0, 8(%rdx)            # check if remainder has crossed 0, i.e. arr[1]>0
    jge endL2                   # if r>0, exit loop
    subq %r8, 8(%rdx)           # subtract remainder-N
    incq (%rdx)                 # increment quotient
    jmp L2                      # repeat loop
   
endL1:                          # end of loop, M>0
    cmpq $0, %rsi               # check if N<0
    jl q                        # if N<0, quotient = -arr[0], jump to q
    ret                         # else, return

endL2:                          # end of loop, M<0
    cmpq $0, %rsi               # check if N>0
    jg q                        # if N>0, quotient = -arr[0], jump to q
    ret                         # else, return

q:
    notq (%rdx)             # change sign of quotient by 2's complement
    incq (%rdx)
    ret                     # return
