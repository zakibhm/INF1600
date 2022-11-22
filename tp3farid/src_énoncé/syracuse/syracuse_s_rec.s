.data
.text
.globl syracuse_s_rec
.globl afficher
syracuse_s_rec:
pushl  %ebp
movl   %esp, %ebp
pushl %ebx
# DEBUT COMPLETION
movl 8(%ebp), %eax
movl 12(%ebp),%ecx
pushl %eax
pushl %ecx
call afficher
popl %ecx
popl %eax

debut:

cmpl $1,%eax
je retour
addl $1,%ecx
addl $1,%ecx
xorl %edx, %edx  
pushl %ecx  
movl $2,%ecx
divl %ecx
cmpl $1,%edx
popl %ecx
je impair

jmp recursivite

impair:
pushl %ecx
movl $2,%ecx
mul %ecx
addl $1,%eax
movl $3,%ecx
mul %ecx
addl $1,%eax
popl %ecx
jmp recursivite

recursivite:
pushl %ecx
pushl %eax
call syracuse_s_rec


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
popl %ebx
leave
ret
