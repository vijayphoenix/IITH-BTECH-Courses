import numpy as np
import value_iteration as vi

n = 5
T = np.array([
    [0.1, 0.4, 0.3, 0.2, 0],
    [0.1, 0, 0.4, 0.3, 0.2],
    [0, 0.3, 0, 0.5, 0.2],
    [0, 0.1, 0.3, 0.2, 0.4],
    [0, 0.2, 0.3, 0.4, 0.1]])

R = np.array([[3, 1, 4, 5, 2]])

tolerance = 0.01

for discount in [0.5, 0.8]:
    print(f'For discount  = {discount}')
    h, acplan, V = vi.value_iteration(T,R,discount,tolerance)
    print('Optimal Value = ', V[h,:])
    print('')