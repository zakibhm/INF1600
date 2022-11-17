.data
string1:
.asciz  "AazZWgFh tuvJKLYZHj" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
string2:
.asciz "le message caché est : %c%c\n"
divisionSur100 : .int 100
divisionSur10 : .int 10
.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx
movl $string1, %esi

newWord :
#initialiser le registre à 0
xorl %ebx, %ebx

boucle :
xorl %eax,%eax
movl $0, %edx # precaution
movb (%esi), %al

#verifier si le code ascii est superieur à 100 ou non pour double division sur 10
cmpb $100, (%esi)
jge div100
jmp div10

#double division
div100 :
divl divisionSur100
addl %eax, %ebx
movl %edx, %eax
movl $0, %edx
divl divisionSur10
addl %eax, %ebx
addl %edx, %ebx
jmp CheckNextchar

#une seule division
div10 :
divl divisionSur10
addl %edx,%ebx
addl %eax,%ebx
jmp CheckNextchar

CheckNextchar :
addl $1, %esi
#verifier si la fin de la phrase
cmpb $0, (%esi)
je fin

#verifier pour un nouveau mot (espace)
cmpb $32, (%esi)
jne boucle
addl $1, %esi 
pushl %ebx
jmp newWord

fin:
#pour afficher les 2 charactres au bon ordre
popl %eax
pushl %ebx
pushl %eax

pushl $string2
call printf
addl $12, %esp
popl %ebx
popl %ebp
ret
