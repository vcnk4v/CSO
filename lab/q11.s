.global odd

odd:    
    xorq %r8, %r8           # index i=0
    cmpq %r8, %rdi
    jle .end
    movq (%rsi,%r8,8),%r9   # check first element
    movq $1, %rcx           # flag for even/odd
    andq $1, %r9
    cmpq $1, %r9
    je .L1
    movq %r8,%rcx

.L1:
    movq (%rsi,%r8,8),%rdx
    andq $1, %rdx
    cmpq %rdx, %rcx
    jne .sort   
    incq %r8
    cmpq %r8, %rdi
    jg .L1

.end:
    ret

.sort:                          # insertion sort
    xorq %r8, %r8
    
.L2:
    movq (%rsi,%r8,8),%rcx      #curr
    movq %r8, %r9
    cmpq $0, %r9
    jle .L3_end
    decq %r9
    movq (%rsi,%r9,8), %rax
    incq %r9
    cmpq %rax, %rcx
    jge .L3_end

.L3:
    decq %r9
    movq (%rsi,%r9,8), %rdx
    incq %r9
    movq %rdx, (%rsi,%r9,8)

.L3_check:
    decq %r9
    cmpq $0, %r9
    jle .L3_end
    decq %r9
    movq (%rsi,%r9,8), %rax
    incq %r9
    cmpq %rax, %rcx
    jl .L3

.L3_end:
    movq %rcx, (%rsi,%r9,8)

.L2_check:
    incq %r8
    cmpq %r8, %rdi
    jg .L2
    jmp .end
