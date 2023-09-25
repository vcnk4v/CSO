.global gcd

gcd:                    # %rdi = n, %rsi = m      
    cmpq %rdi,%rsi      # if m <= n, move to L2
    jle .L2     
    movq %rsi,%r8       # else, swap m and n
    movq %rdi, %rsi
    movq %r8, %rdi

.L2:
    cmpq $0, %rsi       # compare second arg (m) with 0
    jle .end            # if m<=0 , finish
    xorq %rdx, %rdx     
    movq %rdi, %rax
    idivq %rsi          # else, divide n/m
    movq %rsi, %rdi     # move m into n
    movq %rdx, %rsi     # move n%m into m
    jmp .L2             # repeat

.end:
    movq %rdi, %rax     # gcd = latest n
    ret
