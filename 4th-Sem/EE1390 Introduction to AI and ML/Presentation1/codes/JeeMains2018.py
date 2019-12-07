#JEE MAINS 2018

import numpy as np
import matplotlib.pyplot as plt

# This function return a normal vec to A 
def norm_vec(A):
	omat = np.array([[0,1],[-1,0]])
	return np.matmul(omat,A)

# Equation of hyperbola is x^2/a^2 - y^2/b^2 = 1

F1 = np.array([2,0])	# focus1
F2 = np.array([-2,0])	# focus2
P = np.array([2**0.5,3**0.5]) # Point on Hyberbola
a = abs(np.linalg.norm(F1-P)-np.linalg.norm(F2-P))/2 # calculating value of a
e = np.linalg.norm(F1-F2)/(2*a)	# eccentricity of hyperbola
b=((a**2)*(e**2-1))**0.5 # calculating value of b

# Matrix form of hyperbola is (x.T)V(x)=1
V = np.array([[1/a**2,0],[0,-1/b**2]])

# n is normal of hyperbola at point P
n = np.matmul(V,P.T).T
c = np.matmul(n,P)

# So the equation of Tangent of hyperbola at point P is (n.T)x = c 

# Graphical Verification
tangent = norm_vec(n)
P1 = P+-4*tangent
P2 = P+4*tangent

x = np.linspace(-9,9,400)
y = np.linspace(-9,9,400)
x,y =np.meshgrid(x,y)

plt.contour(x,y,x**2/a**2 - y**2/b**2,[1],colors='g')
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.plot(P[0], P[1], 'o')
plt.text(P[0]*1.4, P[1],'P')
plt.plot(F1[0], F1[1], 'o')
plt.text(F1[0]*1.2, F1[1],'F1')
plt.plot(F2[0], F2[1], 'o')
plt.text(F2[0]*1.5, F2[1],'F2')
plt.plot([P2[0],P1[0]],[P2[1],P1[1]],label='$Tangent$')
plt.legend(loc='best')
plt.grid() 
plt.show()