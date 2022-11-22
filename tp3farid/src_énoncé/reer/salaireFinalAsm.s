.data
div100: 
    .int 100
resultatFinal:
     .int 0
const1: 
    .int 1
augmentationSl: 
    .float 0
salaireDp: 
    .int 0
power: 
    .float 1
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %eax 
movl 24(%eax), %ebx 

filds div100
filds 12(%eax)
fdivp
filds const1
faddp 
fstps augmentationSl

subl $1, %ebx
boucle :
cmpl $0, %ebx
jz finBoucle

flds augmentationSl
flds power
fmulp
fstps power
subl $1, %ebx
jmp boucle


finBoucle:
movl 8(%eax), %edx
movl %edx, salaireDp
fildl salaireDp
flds power

fmulp
fistpl resultatFinal
movl resultatFinal, %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
