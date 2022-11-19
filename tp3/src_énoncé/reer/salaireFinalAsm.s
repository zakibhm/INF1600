.data
const1: .float 1
augmentationSalariale: .float 0
salaireDepart: .int 0
resultatPuissance: .float 1
div100: .float 100
resultatFinal: .int 0
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this
movl 24(%esi), %ecx   # ecx == anneeAvantRetraite
movl 8(%esi), %ebx
movl %ebx, salaireDepart
filds 12(%esi)
flds div100
fdivrp
fld1 
faddp 
fstps augmentationSalariale

subl $1, %ecx
puissance :
    cmpl $0, %ecx
    je finPuissance
    flds resultatPuissance
    flds augmentationSalariale
    fmulp
    fstps resultatPuissance
    subl $1, %ecx
    jmp puissance


finPuissance:
    flds resultatPuissance
    fildl salaireDepart
    fmulp
    fistpl resultatFinal
    fld1
    fstps resultatPuissance #mettre resultatPuissance à 1
    movl resultatFinal, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
