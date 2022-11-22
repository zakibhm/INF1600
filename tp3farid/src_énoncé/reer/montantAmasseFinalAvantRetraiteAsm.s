.data
salaireRetraite: 
    .int 0
const100: 
    .int 100
const1: 
    .int 1
power: 
    .float 1
resultat: 
    .float 0
tauxIntr: 
    .float 0
tauxIntr2: 
    .float 0
montantAcc: 
    .int 0
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %edi 

pushl %edi
call _ZN4Reer12salaireFinalEv
movl %eax, salaireRetraite
movl 4(%edi), %ebx 
addl $4, %esp
fildl const100
fildl 16(%edi)
fdivp
fildl salaireRetraite
fmulp
fistpl salaireRetraite
movl salaireRetraite, %eax
filds 20(%edi)
filds const100
fdivrp
filds const1 
faddp 
fstps tauxIntr
filds 20(%edi)
filds const100
fdivrp
fstps tauxIntr2

boucle:
cmpl $0, %ebx
jz finboucle
flds power
flds tauxIntr
fmulp
fstps power
subl $1, %ebx
jmp boucle


finboucle:
filds const1
flds power
fsubp 
fstps resultat
flds tauxIntr2
flds tauxIntr
fmulp
flds power
fmulp
flds resultat
fdivp
fildl salaireRetraite
fmulp
fistpl montantAcc
movl montantAcc, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
