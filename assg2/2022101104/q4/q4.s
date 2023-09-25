.global special_op

special_op:
    xorq %rax, %rax         # set rax to 0
    addq %rdi, %rax         # add first argument
    addq %rsi, %rax         # add second argument
    addq %rdx, %rax         # add third argument
    addq %rcx, %rax         # add fourth argument
    addq %r8, %rax          # add fifth argument
    addq %r9, %rax          # add sixth argument
    addq 8(%rsp), %rax      # add seventh argument, stored in the stack at second position from top
    subq 16(%rsp), %rax     # subtract eighth argument, stored after seventh argument in the stack
    ret                     # return x1 + x2 + x3 + x4 + x5 + x6 + x7 − y
