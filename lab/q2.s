.global multiples

multiples:
    pushq %rbx
    pushq $15
    pushq $5
    pushq $3
    testq %rdi, %rdi
    jz .end
    xorq %rbx, %rbx

.L1:
    incq %rbx
    movq %rbx,%rax
    xorq %rdx,%rdx
    idivq 16(%rsp)
    testq %rdx, %rdx
    jz .L15
    xorq %rdx,%rdx
    movq %rbx,%rax
    idivq 8(%rsp)
    testq %rdx,%rdx
    jz .L5
    xorq %rdx,%rdx
    movq %rbx,%rax
    idivq (%rsp)
    testq %rdx,%rdx
    jz .L3
    movq %rbx,%r8
    decq %rbx
    movq %r8, (%rsi,%rbx,8)

.loopcheck:
    incq %rbx
    cmpq %rbx, %rdi
    jle .end
    jmp .L1

.L3:
    decq %rbx
    movq $-1, (%rsi,%rbx,8)
    jmp .loopcheck

.L5:
    decq %rbx
    movq $-2, (%rsi,%rbx,8)
    jmp .loopcheck

.L15:
    decq %rbx
    movq $-3, (%rsi,%rbx,8)
    jmp .loopcheck

.end:
    addq $24, %rsp
    popq %rbx
    ret
