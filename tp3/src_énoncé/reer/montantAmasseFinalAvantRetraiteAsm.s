.data
salaireRetraite: .int 0
const100: .int 100
resultatPuissance: .float 1
numerateur: .float 0
tauxInteret: .float 0
tauxInteretOrg: .float 0
montantAccumuler: .int 0
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this

pushl %esi
call _ZN4Reer15salaireFinalAsmEv
movl %eax, salaireRetraite
addl $4, %esp
fildl const100
fildl 16(%esi)
fdivp
fildl salaireRetraite
fmulp
fistpl salaireRetraite
movl salaireRetraite, %eax
movl 4(%esi), %ecx # ecx == anneesDeRetraite

filds 20(%esi)
filds const100
fdivrp
fld1 
faddp 
fstps tauxInteret

puissance:
    cmpl $0, %ecx
    je finPuissance
    flds resultatPuissance
    flds tauxInteret
    fmulp
    fstps resultatPuissance
    subl $1, %ecx
    jmp puissance


finPuissance:
    fld1
    flds resultatPuissance
    fsubp 
    fstps numerateur
    filds const100
    filds 20(%esi)
    fdivp
    fstps tauxInteretOrg
    flds tauxInteret
    flds resultatPuissance
    fmulp
    flds tauxInteretOrg
    fmulp
    flds numerateur
    fdivp
    fildl salaireRetraite
    fmulp
    fistpl montantAccumuler
    fld1
    fstps resultatPuissance #mettre resultatPuissance à 1
    movl montantAccumuler, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
