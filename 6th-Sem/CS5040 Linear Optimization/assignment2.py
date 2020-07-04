# Jatin Sharma      : CS17BTECH11020
# Vijay Tadikamalla : CS17BTECH11040
# Tungadri Mandal   : CS17BTECH11043

"""Simplex Algorithm

Given: AX <=B

Objective: Maximize CX

Sample Input:

m = 5
n = 2

A = np.array([
    [2, 1],
    [2, 3],
    [3, 1],
    [-1, 0],
    [0, -1],
])

B = np.array([[18, 42, 24, 1, 0]]).T

C = np.array([[3, 2]]).T

Output:

Optimal vertex is: [ 3. 12.]

"""

import numpy as np
from numpy import linalg as la


class SimplexAlgorithm():
    """A class for all operations related to simplex algorithm"""

    def __init__(self, m, n, A, B, C):
        self.m = m
        self.n = n

        # AX <= B
        self.A = A
        self.B = B
        self.X = np.empty([n, 1])
        
        # Maximize CX
        self.C = C

        # A[m * n], B[m * 1], C[n * 1], X[n * 1]
        assert(self.A.shape == (self.m, self.n))
        assert(self.B.shape == (self.m, 1))
        assert(self.C.shape == (self.n, 1))
        assert(self.X.shape == (self.n, 1))

        if la.matrix_rank(self.A) != self.n:
            print("Problem not feasible")
        else:
            self.run()

    def _get_initial_point(self):
        """Get initial feasible point (inside the region)"""
        min_b = np.min(self.B)

        # Return origin if all values are greater than zero
        if min_b >= 0:
            return np.zeros((self.A.shape[1], 1))
        
        # min_b < 0
        init_pt = np.zeros((self.A.shape[1]+1, 1))
        init_pt[-1] = min_b
        return init_pt

    def _is_feasible_point(self, A, X, B):
        """Returns: Boolean True if feasible"""
        return A @ X <= B

    def _is_some_constraint_tight(self, A, X, B):
        """Returns: Boolean True if some constraint is tight"""
        return np.any(B - A @ X < 0.0001)

    def reach_boundary(self, A, X, B, C):
        """Go to the boundary of the region from the initial feasible point"""
        dir_vec = C
        alpha = 0.01
        while not self._is_some_constraint_tight(A, X, B):
                temp = X + alpha * C
                if self._is_feasible_point(A, temp, B):
                    X = temp
                else:
                    alpha = alpha / 10

        return X

    def get_init_vertex(self, A, X, B):
        """Returns the vertex"""
        rank = la.matrix_rank(A)
        return la.pinv(A[:rank]) @ B[:rank]

    def linear_ind_rows(self, A, X, B):
        """Return boolean mask of linear independent rows"""
        return (B - A @ X < 0.0001).T[0]

    def get_alpha(self, A, X, B, C):
        """Solve A.T @ alpha = C. Return alpha"""
        lin_ind = A[self.linear_ind_rows(A, X, B)]
        return la.pinv(lin_ind.T) @ C

    def find_optimal_vertex(self, A, X, B, C):
        """Return the optimal vertex, i.e vertex cost is maximum"""

        alpha = self.get_alpha(A, X, B, C)
        if np.all(alpha >= 0):
            return X
        bool_mask = self.linear_ind_rows(A, X, B)
        dir_matrix = -la.pinv(A[bool_mask])
        cost = []
        for i in range(dir_matrix.shape[0]):
            dir_vec = dir_matrix[:, i].reshape(-1, 1)
            min_ratio = (A @ dir_vec).T
            mask = min_ratio > 0
            if np.any(mask):
                t = np.min(((B - A @ X).T[0] / min_ratio)[mask])
                neighbor = X + dir_vec * t
                cost.append((neighbor.T @  C, i, neighbor))
        
        _, index, neighbor = max(cost)
        return self.find_optimal_vertex(A, neighbor, B, C)

    def run(self):
        """Run the algorithm"""
        self.X = self._get_initial_point()
        self.B = self.B + np.random.rand(*self.B.shape) * 0.00001
        temp_A, temp_B, temp_C = self.A, self.B, self.C
        if self.X.shape != self.C.shape:
            temp_A = np.append(np.append(self.A, np.zeros((1, self.n)), axis = 0), np.ones((self.m + 1, 1)), axis = 1)
            temp_A[-1][-1] = -1
            temp_B = np.append(self.B, [abs(min(self.B))], axis = 0)
            temp_C = np.zeros((self.n +1, 1))
            temp_C[-1] = 1

        self.X = self.reach_boundary(temp_A, self.X, temp_B, temp_C)
        self.X = self.get_init_vertex(temp_A, self.X, temp_B)

        opt_vertex = self.find_optimal_vertex(temp_A, self.X, temp_B, temp_C)
        if self.X.shape != (self.n, 1):
            if opt_vertex[-1] < 0:
                print("Unbounded")
            else:
                print(f"Optimal vertex is: {self.X.T[0][:-1]}")
        else:
            print(f"Optimal vertex is: {self.X.T[0]}")

def main():
    m = int(input("Enter m = "))
    n = int(input("Enter n = "))

    A = np.empty([m, n])
    B = np.empty([m, 1])
    C = np.empty([n, 1])

    for i in range(m):
        for j in range(n):
            A[i][j] = float(input("Enter A[%d][%d]=" % (i, j)))

    for i in range(m):
        B[i][0] = float(input("Enter B[%d]=" % i))

    for i in range(n):
        C[i][0] = float(input("Enter C[%d]=" % i))

    algo = SimplexAlgorithm(m, n, A, B, C)


if __name__=="__main__": 
    main()