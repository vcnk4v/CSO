.global maxsum

maxsum:                 
    xorq %r8, %r8           # i=0
    movq %rdi, %r9          # j=n
    xorq %rax, %rax

.L1:
    movq (%rsi,%r8,8), %rcx
    addq %rcx, %rax
    incq %r8
    jmp .L2

.L2:
    cmpq %r8, %rdx
    jg .L1
    movq %rax, %rcx
    jmp .L3_check

.L3:
    addq (%rsi,%r9,8), %rax
    subq (%rsi,%r8,8), %rax
    cmpq %rax, %rcx
    cmovl %rax, %rcx

.L3_check:
    decq %r9
    decq %r8
    cmpq $0, %r8
    jge .L3

.end:
    movq %rcx, %rax
    ret
