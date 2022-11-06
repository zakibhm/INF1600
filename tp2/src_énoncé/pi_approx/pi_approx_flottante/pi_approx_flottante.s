.data
i:             
.float  0       # i
iteration:
.int 50        # Nombre d'itérations
x:
.float 2       
y:
.float 1
signe1:
.float 1
signe2:
.float -1
pi:             # Valeur du ratio de pi initial
.float 0
cte: 
.float 1
multiplicateur:
.float 4
.text
.globl pi_approx_flottante

pi_approx_flottante:

push %ebp       # Prologue
mov %esp,%ebp
push %ebx

#movl iteration, %eax
#addl $1, %eax

#votre code
xorl %ecx, %ecx
newTerme :
cmpl iteration, %ecx
jz fin
pushl %ecx
flds i 
flds i
faddp
flds cte
faddp 
flds multiplicateur
fdivp

#verifier si le terme est pair ou impair
sar $1, %cl
jc signedDiv 
jmp unsignedDiv

signedDiv :
flds signe2
fmulp
flds pi
faddp 
fstps pi
jmp inc_i

unsignedDiv :
flds pi
faddp 
fstps pi
jmp inc_i

inc_i :
flds i
flds cte
faddp
fstps i
popl %ecx
addl $1, %ecx
jmp newTerme


fin :
flds pi
pop %ebx
pop %ebp
ret
