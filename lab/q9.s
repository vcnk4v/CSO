.global missing

missing:
    xorq %r8, %r8       # i=0

.L1:                    # bubble sort
    cmpq %rdi, %r8
    jge .loop_end
    movq %r8, %r9
    incq %r9

.L2:
    cmpq %rdi, %r9
    jge .L1_check
    movq (%rsi,%r8,8),%rcx
    cmpq %rcx, (%rsi,%r9,8)
    jg .L2_check
    movq (%rsi,%r9,8),%rax
    movq %rcx, (%rsi,%r9,8)
    movq %rax, (%rsi,%r8,8)

.L2_check:
    incq %r9
    jmp .L2

.L1_check:
    incq %r8
    jmp .L1

.loop_end:
    xorq %r8, %r8           # index i=0
    movq $-1, %rax
    movq $1, %r9            # positive integer

.L3:
    cmpq $0, (%rsi,%r8,8)
    jle .L3_check
    cmpq %r9, (%rsi,%r8,8)
    jne .end
    incq %r9
    
.L3_check:
    incq %r8
    cmpq %rdi, %r8
    jl .L3

.end:
    movq %r9, %rax
    ret
