.text
.globl syracuse_s_iter
.globl afficher
syracuse_s_iter:
pushl   %ebp
movl    %esp, %ebp
pushl %ebx
# DEBUT COMPLETION

movl 8(%ebp), %eax

movl $0, %ecx

boucle:
pushl %eax
pushl %ecx
call afficher
popl %ecx
popl %eax
cmpl $1,%eax
je retour
addl $1,%ecx
xorl %edx, %edx  
pushl %ecx  
movl $2,%ecx
divl %ecx
cmpl $1,%edx
popl %ecx
je impair
jmp boucle #pair

impair:
pushl %ecx
movl $2,%ecx
mul %ecx
addl $1,%eax
movl $3,%ecx
mul %ecx
addl $1,%eax
popl %ecx
jmp boucle



# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
popl %ebx
leave
ret
