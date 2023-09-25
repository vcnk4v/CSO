.global min_bacteria

min_bacteria:
    movq %rdi, %r8
    xorq %r9, %r9           # min bacteria
    
.L1:
    testq $1, %rdi
    jz .L2
    incq %r9

.L2:
    sarq %rdi
    cmpq $0, %rdi
    jg .L1

.end:
    movq %r9, %rax
    ret
