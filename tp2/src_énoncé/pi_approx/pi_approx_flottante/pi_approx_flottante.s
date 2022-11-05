.data
i:             
.float  0       # i
iteration:
.int 50         # Nombre d'itérations
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

#votre code

pop %ebx
pop %ebp
ret
