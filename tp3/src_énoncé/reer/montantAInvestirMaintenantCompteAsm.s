.data
tauxInteret3: .float 1.04
resultatPow: .float 1
retourFunc: .int 0
inverserSigne: .float -1 
.text
.globl _ZN6Compte29montantAInvestirMaintenantAsmEv

_ZN6Compte29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION
movl 8(%ebp), %esi # esi == this
pushl %esi
call _ZN4Reer15salaireFinalAsmEv
addl $4, %esp
movl %eax, retourFunc

movl 24(%esi), %ecx # ecx == anneeAvantRetraite

puissance :
    cmpl $0, %ecx
    je finPuissance

    flds tauxInteret3
    flds resultatPow
    fmulp
    fstps resultatPow
    subl $1, %ecx
    jmp puissance

finPuissance:
    flds resultatPow
    fld1
    fdivp
    fildl retourFunc
    fmulp
    flds inverserSigne
    fmulp
    fildl 28(%esi) # encaisse
    faddp
    fistpl retourFunc
    fld1
    fstps resultatPow #mettre resultatPow à 1
    movl retourFunc, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
