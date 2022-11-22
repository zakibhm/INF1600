.data
pivot: .int 0
     
.text
.globl quicksort_s


quicksort_s:
pushl %ebp
movl %esp, %ebp
pushl %ebx

# DEBUT COMPLETION

movl 8(%ebp), %edi 
movl 16(%ebp),  %ecx #droite
movl 12(%ebp),  %ebx 
addl $2, %ebx
cmpl %ecx, %ebx
jnle retour

movl 12(%ebp),  %eax # Gauche
pushl %ecx
pushl %eax
pushl %edi
xorl %eax, %eax
call medianOfThree 
popl %edi
movl %edi, %edi
popl %ebx       
popl %ecx
subl $1, %ecx  

boucle1 :
subl $1, %ecx 
pushl %edi
pushl %eax
movl $4, %eax
mul %ecx
addl %eax, %edi
popl %eax
cmpl %eax, (%edi)
popl %edi
jnle boucle1


boucle2 :
pushl %edi
addl $1, %ebx
pushl %eax
movl $4, %eax
mul %ebx
addl %eax, %edi
popl %eax
cmpl %eax, (%edi)
popl %edi
jnge boucle2

#fin des deux premieres boucles
cmpl %ecx, %ebx
jnl finboucle #verifier si la fin de la boucle for
pushl %ecx
pushl %ebx
pushl %edi
movl %eax, pivot
call swapRefs
movl pivot, %eax
popl %edi
popl %ebx
popl %ecx
jmp boucle1



finboucle :
movl 16(%ebp),  %edx 
pushl %edx
pushl %ebx
pushl %edi
call swapRefs
popl %edi
popl %ebx
popl %edx

subl $1, %ebx
movl 12(%ebp),  %edx 

pushl %ebx
pushl %edx
pushl %edi
call quicksort_s
popl %edi
popl %ebx
popl %edx

movl 16(%ebp),  %edx 
addl $2, %ebx
pushl %edx
pushl %ebx
pushl %edi
call quicksort_s


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
