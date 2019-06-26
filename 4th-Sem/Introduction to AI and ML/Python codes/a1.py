#Code by GVV Sharma
#January 28, 2019
#released under GNU GPL
import numpy as np
import matplotlib.pyplot as plt
#if using termux
import subprocess
import shlex
#end if


def mid_pt(B,C):
	D = (B+C)/2
	return D

def norm_vec(AB):
	return np.matmul(omat,np.matmul(AB,dvec))

def line_intersect(AD,CF):
	n1=norm_vec(AD)
	n2=norm_vec(CF)
	N =np.vstack((n1,n2))
	p = np.zeros(2)
	p[0] = np.matmul(n1,AD[:,0])
	p[1] = np.matmul(n2,CF[:,0])
	return np.matmul(np.linalg.inv(N),p)

A = np.array([-2,-2])
B = np.array([1,3])
C = np.array([4,-1])



D = mid_pt(B,C)
E =mid_pt(A,C)
F = mid_pt(A,B)
G=(A+B+C)/3

AD =np.vstack((A,D)).T
CF =np.vstack((C,F)).T

dvec = np.array([-1,1])
omat = np.array([[0,1],[-1,0]])


len =10
lam_1 = np.linspace(0,1,len)
x_AB = np.zeros((2,len))
x_BC = np.zeros((2,len))
x_CA = np.zeros((2,len))
for i in range(len):
	temp1 = A + lam_1[i]*(B-A)
	x_AB[:,i]= temp1.T
	temp2 = B + lam_1[i]*(C-B)
	x_BC[:,i]= temp2.T
	temp3 = C + lam_1[i]*(A-C)
	x_CA[:,i]= temp3.T
#print(x_AB[0,:],x_AB[1,:])
plt.plot(x_AB[0,:],x_AB[1,:],label='$AB$')



# plt.plot([D[0],A[0]],[D[1],A[1]],label='$AD$')
# plt.plot([E[0],B[0]],[E[1],B[1]],label='$BE$')
# plt.plot([F[0],C[0]],[F[1],C[1]],label='$CF$')




plt.plot(x_BC[0,:],x_BC[1,:],label='$BC$')
plt.plot(x_CA[0,:],x_CA[1,:],label='$CA$')
plt.plot(A[0], A[1], 'x')
plt.text(A[0] * (1 + 0.1), A[1] * (1 - 0.1) ,'A')
plt.plot(B[0], B[1], 'o')
plt.text(B[0] * (1 - 0.2), B[1] * (1) , 'B')
plt.plot(C[0], C[1], 'o')
plt.text(C[0] * (1 + 0.03), C[1] * (1 - 0.1) ,'C')




# plt.plot(D[0], D[1], 'o')
# plt.text(D[0] * (1 + 0.1), D[1] * (1 - 0.1) ,'D')
# plt.plot(E[0], E[1], 'o')
# plt.text(E[0] * (1 + 0.1), E[1] * (1 - 0.1) ,'E')
# plt.plot(F[0], F[1], 'o')
# plt.text(F[0] * (1 + 0.1), F[1] * (1 - 0.1) ,'F')
# plt.plot(G[0], G[1], 'o')
# plt.text(G[0] * (1 + 0.1), G[1] * (1 - 0.1) ,'G')


#ALTITUDE OF TRIANGLE


# BC=np.vstack((B,C)).T
# normBC=norm_vec(BC)
# Q= A+(0.1*normBC)
# AQ =np.vstack((A,Q)).T
# P=line_intersect(AQ,BC)
# plt.plot(P[0], P[1], 'o')
# plt.plot([P[0],A[0]],[P[1],A[1]],label='$AP$')
# plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1) ,'P')



#FINISHED



#ANGLE BISECTOR

c=np.linalg.norm(A-B)
b=np.linalg.norm(C-A)
a=np.linalg.norm(C-B)


W= (a*A+b*B)/(a+b)
U=(b*B+c*C)/(b+c)
V=(a*A+c*C)/(a+b)

AU=np.vstack((A,U)).T
BV=np.vstack((B,V)).T
CW=np.vstack((C,W)).T

I=line_intersect(AU,BV)
plt.plot(I[0], I[1], 'o')
plt.plot([U[0],A[0]],[U[1],A[1]],label='$AU$')
plt.plot([V[0],B[0]],[V[1],B[1]],label='$BV$')
plt.plot([W[0],C[0]],[W[1],C[1]],label='$CW$')



AB=np.vstack((A,B)).T
normAB=norm_vec(AB)
Qq= I+(0.1*normAB)
IX =np.vstack((I,Qq)).T
X=line_intersect(IX,AB)
plt.plot(X[0], X[1], 'o')
plt.plot([I[0],X[0]],[I[1],X[1]],label='$IX$')
plt.text(X[0] * (1 + 0.1), X[1] * (1 - 0.1) ,'X')

print("NORM OF IX",np.linalg.norm(I-X))


#FINISHED


plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
#if using termux
# plt.savefig('../figs/triangle.pdf')
# plt.savefig('../figs/triangle.eps')
# subprocess.run(shlex.split("termux-open ../figs/triangle.pdf"))
#else
plt.show()