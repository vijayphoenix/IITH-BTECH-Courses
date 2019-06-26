#This program calculates the intersection of AD and CF
import numpy as np
import matplotlib.pyplot as plt

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
F = mid_pt(A,B)

AD =np.vstack((A,D)).T
CF =np.vstack((C,F)).T




dvec = np.array([-1,1])
omat = np.array([[0,1],[-1,0]])
# print(line_intersect(AD,CF))


BC=np.vstack((B,C)).T

normBC=norm_vec(BC)
Q= A+(0.1*normBC)
AQ =np.vstack((A,Q)).T
P=line_intersect(AD,CF)



plt.plot(P[0], P[1], 'o')
plt.text(P[0] * (1 + 0.1), P[1] * (1 - 0.1) ,'P')
plt.plot([P[0],A[0]],[P[1],A[1]],label='$AP$')


plt.show()