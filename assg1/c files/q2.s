.global calculate

calculate:
    movq $0, %r9        # store value 0 in r9
    movq %rcx, %r8      # move value of rcx (y) into r8 to store for future use
    movq %rsi, %rcx     # move x int rcx to use fro shift operation
    cmpq %rsi, %r9      # check if value in rsi (x) is negative
    jg neg_x            # if x<0, need to divide by power of 2, so jumps to negative x condition block
    salq %cl, %rdi      # shift a (rdi) left by x amount
    movq %rdi, %rax     # move result of a.2^x into rax
    jmp findy           # jump to find b.2^y
    

neg_x:
    not %rcx            # if x is negative, find positive of x by 2's complement 
    inc %rcx            # -x = ~x + 1
    sarq %cl, %rdi      # shift a right by x amount 
    movq %rdi, %rax     # move result of a.2^x into rax

findy:                  # similarly find b.2^y
    movq %r8, %rcx      # get y in rcx
    cmpq %r8, %r9       # check if y is negative
    jg neg_y            # if y<0, division occurs, so jump to negative y condition block
    salq %cl, %rdx      # else, shift left b by y amount
    addq %rdx, %rax     # add this to rax to get a.2^x + b.2^y
    ret


neg_y:
    not %rcx            # if y is negative, find positive of y by 2's complement
    inc %rcx            # -y = ~y + 1
    sarq %cl, %rdx      # shift b right by y amount
    addq %rdx, %rax     # add this to rax to get a.2^x + b.2^y
    ret  
