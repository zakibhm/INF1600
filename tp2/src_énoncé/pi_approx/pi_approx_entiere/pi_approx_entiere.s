.data

.text
.globl pi_approx_entiere

pi_approx_entiere:
movl 4(%esp), %edx
addl $1, %edx
push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE #
initialisation :
movl %edx, %ecx
xorl %ebx, %ebx

newTerme :
pushl %edx
pushl %ecx
movl %edx, %eax
subl %ecx, %eax
movl %eax, %ecx
movl %eax, %edx
sar $1, %dl
jc signedDiv 
jmp unsignedDiv

signedDiv :
movl $4, %eax
addl %ecx, %ecx
addl $1, %ecx
movl $0, %edx
divl %ecx
imul $-1, %eax
addl %eax, %ebx
popl %ecx
popl %edx
loop newTerme

jmp fin 

unsignedDiv :
movl $4, %eax
addl %ecx, %ecx
addl $1, %ecx
movl $0, %edx
divl %ecx
addl %eax, %ebx
popl %ecx
popl %edx
loop newTerme

fin :
movl %ebx, %eax
#add $8, %esp
pop %ebx
pop %ebp
ret
