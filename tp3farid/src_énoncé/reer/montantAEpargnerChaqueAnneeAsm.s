.data
div100: 
    .int 100
div1: 
    .int 1
tauxInteret1: 
    .float 0
resultat2: 
    .float 1
resultat: 
    .float 0
montantAcc: 
    .int 0
.text
.globl _ZN4Reer30montantAEpargnerChaqueAnneeAsmEv

_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %edi 

pushl %edi
call _ZN4Reer31montantAmasseFinalAvantRetraiteEv
movl %eax, montantAcc
movl 24(%edi), %ebx
addl $4, %esp
filds div100
filds 20(%edi) 
fdivp
fildl montantAcc
fmulp
fstps resultat

filds div100
filds 20(%edi)  
fdivp
filds div1
faddp
fstps tauxInteret1

boucle :

cmpl $0, %ebx
jz finboucle
flds tauxInteret1
flds resultat2
fmulp
fstps resultat2
subl $1, %ebx
jmp boucle

finboucle :

filds div1
flds resultat2
fsubp 
flds resultat
fdivp
fistpl montantAcc
movl montantAcc, %eax
    

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
