string: .asciz "My favourite number is FIFTEEN!\n"
false : .asciz "le 15e caractère n’est pas une lettre de l’alphabet\n"
true : .asciz "Votre 15e caractère est : %c\n"

.text
.globl main

main : 
push %ebp
mov %esp,%ebp
    push %ebx

#votre code
movl $string ,%esi
addl  $14 ,%esi

cmpb $122, (%esi)
jle lowerCase
jmp notChar

lowerCase :
cmpb $97, (%esi)
jge isChar
jmp secondCheck

secondCheck :
cmpb $90, (%esi)
jle upperCase 
jmp notChar

upperCase :
cmpb $65, (%esi)
jge isChar 

notChar :
pushl (%esi)
pushl $false
jmp print

isChar :
pushl (%esi)
pushl $true

print :
call printf
addl $16, %esp
ret








movl %edx, %eax
movl $0, %edx
div divisionSur10
addl %eax, %ebx
addl %edx, %ebx