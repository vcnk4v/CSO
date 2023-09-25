.global palindrome

palindrome:
    movq %rdi, %r8      # duplicate num
    xorq %r9, %r9       # storing rev num
    movq $10, %rcx      # for division by 10

.L1:                    # loop to get reversed number
    testq %r8, %r8
    jz .L2
    xorq %rdx, %rdx
    movq %r8, %rax
    idivq %rcx
    pushq %r9               # store original r9
    leaq (%r9,%r9,8), %r9   # multiply by 10
    addq (%rsp),%r9         # multiply by 10, rev=rev*10
    addq $8, %rsp           # clear stack
    addq %rdx, %r9          # rev = rev+ rem
    movq %rax, %r8          # n = n/10
    jmp .L1

.L2:                    # compare original with reversed
    xorq %rax, %rax
    cmpq %rdi, %r9
    jne .end
    movq $1, %rax

.end:
    ret
