.data
return: .int 0
const100: .float 100
tauxInteret: .float 0
denominateur: .float 1
.text
.globl _ZN4Reer29montantAInvestirMaintenantAsmEv

_ZN4Reer29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %esi # esi == this

pushl %esi
call _ZN4Reer31montantAmasseFinalAvantRetraiteEv
addl $4, %esp
movl %eax, return


filds 20(%esi) #tauxInteret
flds const100
fdivrp
fld1
faddp
fstps tauxInteret


movl 24(%esi), %ecx # ecx == anneeAvantRetraite

puissance :
    cmpl $0, %ecx
    je finPuissance

    flds tauxInteret
    flds denominateur
    fmulp
    fstps denominateur
    subl $1, %ecx
    jmp puissance

finPuissance:  
    flds denominateur
    fld1
    fdivp
    fildl return
    fmulp
    fistpl return
    fld1
    fstps denominateur # mettre la valeur du denominateur à 1 si on appelle cette fonction pour une deuxieme fois (appelle version assembleur)
    movl return, %eax


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
