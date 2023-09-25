.global direction

direction:
    pushq %rbx
    movq $-1, %r8       # index
    movq %rdi, %rcx
    decq %rcx           # store n-1
    pushq $0
    jmp .L3_check

.L3:
    cmpq $0, (%rsi,%r8,8)
    jne .L4
    movq %rcx, (%rdx, %r8,8)
    subq %r8, (%rdx, %r8,8)
    subq %r8, (%rdx, %r8,8)
    addq %r8, (%rsp)            # total sum
    jmp .L3_check

.L4:
    movq %r8, (%rdx, %r8,8)
    addq %r8, (%rdx, %r8,8)
    subq %rcx, (%rdx, %r8,8)
    addq %rcx, (%rsp)           # total sum
    subq %r8, (%rsp)


.L3_check:
    incq %r8
    cmpq %r8, %rdi
    jge .L3


.sort:                  # selection sort
    xorq %r8, %r8       # index i
    cmpq %r8, %rdi
    jle .end

.L1:                    # outer loop
    movq %r8, %rcx      # min_index = i
    movq %r8, %r9
    movq (%rdx,%rcx,8),%rax
    jmp .inner_check

.L2:
    cmpq (%rdx,%r9,8),%rax
    jge .inner_check
    movq %r9, %rcx
    movq (%rdx,%rcx,8),%rax

.inner_check:
    incq %r9
    cmpq %r9, %rdi
    jg .L2

.outer_check:
    movq (%rdx,%r8,8),%rbx
    movq %rax, (%rdx,%r8,8)
    movq %rbx, (%rdx,%rcx,8)
    incq %r8
    cmpq %r8, %rdi
    jg .L1
    xorq %r8,%r8
    popq %rcx
    incq %rcx

.L5:
    cmpq $0, (%rdx,%r8,8)
    jle .L5_check
    addq (%rdx,%r8,8), %rcx
    
.L5_check:
    movq %rcx, (%rdx,%r8,8)
    incq %r8
    cmpq %r8, %rdi
    jg .L5

.end:
    popq %rbx
    ret