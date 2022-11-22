.data
salaireRetraite: .int 0
const100: .float 100
resultatPuissance: .float 1
numerateur: .float 0
tauxInteret: .float 0
tauxInteretOrg: .float 0
return: .int 0
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this

pushl %esi
call _ZN4Reer12salaireFinalEv
addl $4, %esp
movl %eax, salaireRetraite
flds const100
fildl 16(%esi)
fdivp
fildl salaireRetraite
fmulp
fistpl salaireRetraite
movl salaireRetraite, %eax
movl 4(%esi), %ecx # ecx == anneesDeRetraite

filds 20(%esi)
flds const100
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
    flds const100
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
    fistpl return
    fld1
    fstps resultatPuissance #mettre resultatPuissance à 1 si on appelle cette fonction pour une deuxieme fois (appelle version assembleur)
    movl return, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
