.global sum_mul

sum_mul:
    xorq %r8, %r8       # storing sum
    xorq %r9, %r9       # index i=0
    movq %rdi, %rax
    leaq (%rdx), %rcx
    imulq %rsi
    pushq $3
    pushq $2
    pushq %rax
    cmpq %r9,(%rsp)
    jle .fin

.L1:
    xorq %rdx, %rdx
    movq (%rcx,%r9,8), %rax
    idivq 8(%rsp)
    testq %rdx,%rdx
    jnz .loop_check

.L2:
    xorq %rdx, %rdx
    movq (%rcx,%r9,8), %rax
    idivq 16(%rsp)
    testq %rdx,%rdx
    jz .loop_check
    addq (%rcx,%r9,8), %r8


.loop_check:
    incq %r9
    cmpq %r9,(%rsp)
    jg .L1

.end:
    addq $24, %rsp

.fin:
    movq %r8, %rax
    ret
