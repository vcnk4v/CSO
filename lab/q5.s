.global rearrange

rearrange:
    xorq %r8, %r8       # int i=0
    movq $-1, %r9       # int j = -1
    cmpq %r8, %rdi
    jle .end

.L1:
    cmpq $1, (%rsi,%r8,8)
    je .loop_check
    incq %r9
    movq (%rsi,%r9,8),%rdx          # swap a[i] and a[j]
    movq (%rsi,%r8,8),%rcx
    movq %rcx, (%rsi,%r9,8)
    movq %rdx, (%rsi,%r8,8)
    
.loop_check:
    incq %r8
    cmpq %r8, %rdi
    jg .L1

.end:
    ret
