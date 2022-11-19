.data
montantAccumuler2: .int 0
const100: .float 100
tauxInteret2: .float 0
denominateur: .float 1
.text
.globl _ZN4Reer29montantAInvestirMaintenantAsmEv

_ZN4Reer29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this

pushl %esi
call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv
addl $4, %esp
movl %eax, montantAccumuler2


filds 20(%esi) #tauxInteret
flds const100
fdivrp
fld1
faddp
fstps tauxInteret2


movl 24(%esi), %ecx # ecx == anneeAvantRetraite

puissance :
    cmpl $0, %ecx
    je finPuissance

    flds tauxInteret2
    flds denominateur
    fmulp
    fstps denominateur
    subl $1, %ecx
    jmp puissance

finPuissance:  
    flds denominateur
    fld1
    fdivp
    fildl montantAccumuler2
    fmulp
    fistpl montantAccumuler2
    fld1
    fstps denominateur # mettre la valeur du denominateur à 1
    movl montantAccumuler2, %eax


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
