.data
string1:
.asciz  "AazZWgFh tuvJKLYZHj" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
string2:
.asciz "le message cache est : %c%c\n"
divisionSur100 : .word 100
.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

movl $string1, %esi
#addl $9, %esi

newWord :
xorl %ebx, %ebx

boucle :
xorl %eax,%eax
movl $0, %edx # precaution
movb (%esi), %al


cmpb $100, (%esi)
jge dev100
jmp dev10


dev100 :
divl divisionSur100
addl %eax, %ebx
movl %edx, %eax
movl $0, %edx
movl $10, %ecx
divl %ecx
addl %eax, %ebx
addl %edx, %ebx
jmp CheckNextchar


dev10 :
movl $10, %ecx
divl %ecx
addl %edx,%ebx
addl %eax,%ebx
jmp CheckNextchar


CheckNextchar :
addl $1, %esi
cmpb $0, (%esi)
je fin

cmpb $32, (%esi)
jne boucle
addl $1, %esi 
pushl %ebx
jmp newWord

fin:
popl %eax
pushl %ebx
pushl %eax
pushl $string2
call printf
addl $12, %esp
popl %ebx
popl %ebp
ret
