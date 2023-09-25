.global get_address_smallest

get_address_smallest:
    xorq %r8, %r8           # initialise index i to 0
    movq %rdi, %rax         # store first element's address in rax (rax stores minimum to be returned)

loop:
    cmpq %rsi, %r8          # checking if index is greater than size
    jge fin                 # if index becomes greater than size, finish loop
    movq (%rdi,%r8,8),%r9   # moving current element arr[i] to r9 
    cmpq (%rax), %r9        # checking if it is less than current min
    jl min                  # if so, jump to min 

n:
    incq %r8                 # increment index by 1
    jmp loop                 # repeat loop

min:
    leaq (%rdi,%r8,8), %rax # store address of current min in rax
    jmp n                   # jump to next iteration

fin:
    ret                     # return, with rax containing address of smallest element
