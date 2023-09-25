.global get_product_assembly

get_product_assembly:
    movq $1, %rcx
    
loop:
    cmpq $0, %rdi
    jz fin
    movq %rcx, %rax
    xorq %rdx, %rdx
    imulq (%rdi)
    movq $9223372036854775807, %r8
    xorq %rdx, %rdx
    idivq %r8
    movq %rdx, %rcx
    movq 8(%rdi),%rdi
    jmp loop

fin:
    movq %rcx, %rax
    ret

