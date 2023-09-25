.global wave

wave:
    xorq %r8, %r8               # i=0
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
    xorq %r8, %r8

.loop:
    movq (%rsi,%r8,8),%rax
    incq %r8
    movq (%rsi,%r8,8),%rcx
    movq %rax, (%rsi,%r8,8)
    decq %r8
    movq %rcx, (%rsi,%r8,8)
    addq $2,%r8

.loop_check:
    cmpq %r8, %rdi
    jg .loop

.end:
    ret
