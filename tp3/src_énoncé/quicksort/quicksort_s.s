.data
CUTOFF: .int 2 
pivot: .int 0
     
.text
.globl quicksort_s


quicksort_s:
pushl %ebp
movl %esp, %ebp
pushl %ebx

# DEBUT COMPLETION


#recuperation des paramateres :
movl 8(%ebp), %esi #esi == tableau
movl 12(%ebp),  %eax #eax == left
movl 16(%ebp),  %ecx #ecx == right
    
addl CUTOFF, %eax
cmpl %ecx, %eax
jg retour

movl 12(%ebp),  %eax
pushl %ecx
pushl %eax
pushl %esi
movl $0, %eax
call medianOfThree # eax == pivot
popl %esi
movl %esi, %edi
popl %ebx       #ebx == i;
popl %ecx
subl $1, %ecx   #ecx == k ;

for :
    while1 :
        pushl %edi
        incl %ebx
        pushl %eax
        movl $4, %eax
        mul %ebx
        addl %eax, %edi
        popl %eax
        cmpl %eax, (%edi)
        popl %edi
        jl while1

    while2 :
        pushl %esi
        subl $1, %ecx 
        pushl %eax
        movl $4, %eax
        mul %ecx
        addl %eax, %esi
        popl %eax
        cmpl %eax, (%esi)
        popl %esi
        jg while2

    cmpl %ecx, %ebx
    jge finFor
    pushl %ecx
    pushl %ebx
    pushl %esi
    movl %eax, pivot
    call swapRefs
    movl pivot, %eax
    popl %esi
    popl %ebx
    popl %ecx
    jmp for

    finFor :
        #swapRefs (T_, i, right - 1)
        movl 16(%ebp),  %ecx #ecx == right
        subl $1, %ecx
        pushl %ecx
        pushl %ebx
        pushl %esi
        call swapRefs
        popl %esi
        popl %ebx
        popl %ecx

        #quicksort(T_, left, i - 1)
        movl 12(%ebp),  %edx #edx == left
        subl $1, %ebx
        pushl %ebx
        pushl %edx
        pushl %esi
        call quicksort_s
        popl %esi
        popl %ebx
        popl %edx

        #quicksort(T_, i + 1, right)
        movl 16(%ebp),  %ecx #ecx == right
        addl $2, %ebx
        pushl %ecx
        pushl %ebx
        pushl %esi
        call quicksort_s
        addl $12, %esp


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
