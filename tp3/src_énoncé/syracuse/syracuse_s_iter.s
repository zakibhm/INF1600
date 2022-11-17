.text
.globl syracuse_s_iter
.globl afficher
syracuse_s_iter:
pushl   %ebp
movl    %esp, %ebp
pushl %ebx

# DEBUT COMPLETION
movl 8(%ebp), %eax
xorl %ebx, %ebx
jmp affichage
boucle :
    cmpl $1, %eax
    jbe retour # quitte si n <= 1

    incl %ebx
    pushl %eax
    movl $0, %edx
    movl $2, %ecx
    div %ecx
    cmpl $0, %edx
    jnz Impair

    # si pair
    addl $4, %esp 
    jmp affichage

Impair:
    # si impair
    popl %eax
    movl $3, %ecx
    mul %ecx
    addl $1, %eax
    jmp affichage

affichage :
    pushl %eax
    pushl %ebx
    call afficher
    addl $4, %esp
    popl %eax
    jmp boucle


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
