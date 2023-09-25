.global binarySearch

binarySearch:
    movq $-1, %r9               # store -1 in r9
    cmpq %rsi, %rdx             # compare l and r indices
    cmovl %r9, %rax             # if l<r, return value in rax is -1
    jl .end                     # if l<r, return
    movq %rdx, %r8              # else, store r in r8
    subq %rsi, %r8              # store r-l in r8
    sarq $1, %r8                # divide by 2, (r-l)/2 in r8
    addq %rsi, %r8              # add l, mid = l+(r-l)/2 in r8
    cmpq %rcx, (%rdi,%r8,8)     # compare arr[mid] with x (element to be searched for)
    cmove %r8, %rax             # if arr[mid]==x, move mid to rax to be returned
    je .end                     # return mid
    jl .L1                      # if arr[mid]<x, jump to .L1
    jg .L2                      # else, arr[mid]>x, jump to .L2

.L1:                            # arr[mid] < x
    addq $1, %r8                # add 1 to mid 
    movq %r8, %rsi              # new l = mid+1
    call binarySearch           # call binarySearch(arr, mid+1, r, x)
    jmp .end                    # jump to end after done

.L2:
    subq $1, %r8                # subtract 1 from mid
    movq %r8, %rdx              # new r = mid-1
    call binarySearch           # call binarySearch(arr, l, mid-1, x)

.end:
    ret                         # end of function call
