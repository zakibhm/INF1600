.text
.globl syracuse_s_rec
.globl afficher
syracuse_s_rec:
pushl  %ebp
movl   %esp, %ebp
pushl %ebx
# DEBUT COMPLETION
movl 8(%ebp), %eax #eax == un
movl 12(%ebp), %ebx # ebx == i

#affichage
pushl %eax
pushl %ebx
call afficher
popl %ebx
popl %eax
cmpl $1, %eax
je retour

Programme :
    incl %ebx
    pushl %eax
    movl $0, %edx
    movl $2, %ecx
    div %ecx
    cmpl $0, %edx
    jnz Impair

#pair
    jmp Recursivite

Impair :
    popl %eax
    movl $3, %ecx
    mul %ecx
    addl $1, %eax
    

Recursivite :
    pushl %ebx
    pushl %eax
    call syracuse_s_rec

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
