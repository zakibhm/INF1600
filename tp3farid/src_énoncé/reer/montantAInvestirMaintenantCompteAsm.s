.data
tauxIntr:
     .float 1.04
power: 
    .float 1
const1: 
    .int 1
resultat: 
    .int 0
negatif: 
    .int -1 
.text
.globl _ZN6Compte29montantAInvestirMaintenantAsmEv

_ZN6Compte29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
movl 8(%ebp), %edi 
pushl %edi
call _ZN4Reer12salaireFinalEv
movl 24(%edi), %ebx 
movl %eax, resultat
addl $4, %esp

boucle :

cmpl $0, %ebx
jz finboucle
flds power
flds tauxIntr
fmulp
fstps power
subl $1, %ebx
jmp boucle

finboucle:
    
    fildl const1
    flds power
    fdivrp
    fildl resultat
    fmulp
    filds negatif
    fmulp
    fildl 28(%edi) 
    faddp
    fistpl resultat
    movl resultat, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
