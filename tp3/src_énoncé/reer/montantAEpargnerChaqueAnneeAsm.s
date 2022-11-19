.data
montantAccumuler1: .int 0
numerateur: .float 0
const100: .float 100
tauxInteret1: .float 0
resultat: .float 1
.text
.globl _ZN4Reer30montantAEpargnerChaqueAnneeAsmEv

_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this

pushl %esi
call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv
addl $4, %esp
movl %eax, montantAccumuler1
filds 20(%esi) #tauxInteret
flds const100
fdivrp
fildl montantAccumuler1
fmulp
fstps numerateur


filds 20(%esi)  #tauxInteret
flds const100
fdivrp
fld1
faddp
fstps tauxInteret1
movl 24(%esi), %ecx # ecx == anneeAvantRetraite

puissance :
    cmpl $0, %ecx
    je finPuissance

    flds tauxInteret1
    flds resultat
    fmulp
    fstps resultat
    subl $1, %ecx
    jmp puissance

finPuissance :
    fld1
    flds resultat
    fsubp 
    flds numerateur
    fdivp
    fistpl montantAccumuler1
    fld1
    fstps resultat # mettre resultat à 1
    movl montantAccumuler1, %eax
    

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
