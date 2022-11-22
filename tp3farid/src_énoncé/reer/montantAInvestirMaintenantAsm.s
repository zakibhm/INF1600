.data
const100: 
    .int 100
tauxIntr: 
    .float 0
power: 
    .float 1
montantAcc:
     .int 0
const1: 
    .int 1
.text
.globl _ZN4Reer29montantAInvestirMaintenantAsmEv

_ZN4Reer29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi 

pushl %esi
call _ZN4Reer31montantAmasseFinalAvantRetraiteEv
movl %eax, montantAcc
movl 24(%esi), %ebx 
addl $4, %esp
filds const100
filds 20(%esi) 
fdivp
filds const1
faddp
fstps tauxIntr

boucle :
cmpl $0, %ebx
jz finboucle

flds tauxIntr
flds power
fmulp
fstps power
subl $1, %ebx
jmp boucle

finboucle:  
    
filds const1
flds power
fdivrp
fildl montantAcc
fmulp
fistpl montantAcc
movl montantAcc, %eax


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
