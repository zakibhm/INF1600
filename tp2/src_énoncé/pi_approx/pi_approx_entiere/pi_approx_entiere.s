.data
iteration : 
.int 0
pi:             # Valeur du ratio de pi initial
.int 0
.text
.globl pi_approx_entiere

pi_approx_entiere:
movl 4(%esp), %ecx
addl $1, %ecx
movl %ecx, iteration
push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE #
initialisation :
xorl %ecx, %ecx

newTerme :
cmpl iteration, %ecx
jz fin
pushl %ecx
movl %ecx, %edx
sar $1, %dl
jc signedDiv 
jmp unsignedDiv

#divison negative (resultat du terme est negatif)
signedDiv :
movl $4, %eax
addl %ecx, %ecx
addl $1, %ecx
movl $0, %edx
divl %ecx
imul $-1, %eax
addl %eax, pi
popl %ecx
addl $1, %ecx
jmp newTerme

#devision positive (resultat du terme est positif)
unsignedDiv :
movl $4, %eax
addl %ecx, %ecx
addl $1, %ecx
movl $0, %edx
divl %ecx
addl %eax, pi
popl %ecx
addl $1, %ecx
jmp newTerme

fin :
movl pi, %eax
pop %ebx
pop %ebp
ret
