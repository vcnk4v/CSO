.global photo

photo:
    xorq %r8, %r8       # index i=0
    pushq %rdx
    cmpq %r8, %rdi
    jle .sort_end

.outer:
    movq (%rsi,%r8,8),%rcx      # outer loop for insertion sort
    movq %r8, %r9
    incq %r8
    jmp .inner_check

.inner:                         # inner loop for insertion sort
    decq %r9 
    movq (%rsi,%r9,8),%rdx
    incq %r9
    movq %rdx, (%rsi,%r9,8)
    decq %r9
    jmp .inner_check

.outer_check:
    cmpq %r8, %rdi
    jg .outer
    jle .sort_end

.inner_check:
    cmpq $0, %r9
    jle .L1
    movq %r9, %rax
    decq %rax
    cmpq %rcx, (%rsi,%rax,8)
    jg .inner

.L1:
    movq %rcx, (%rsi,%r9,8)
    jmp .outer_check

.sort_end:
    popq %rdx
    sarq $1,%rdi
    movq $-1, %r8
    movq $1, %rax
    jmp .loop_check

.L2:
    movq (%rsi,%r8,8),%rcx
    pushq %r8
    addq %rdi, %r8
    movq (%rsi,%r8,8), %r9
    popq %r8
    subq %rcx, %r9
    cmpq %r9, %rdx
    jle .loop_check
    xorq %rax, %rax
    jmp .end

.loop_check:
    incq %r8
    cmpq %r8, %rdi
    jg .L2

.end:
    ret
