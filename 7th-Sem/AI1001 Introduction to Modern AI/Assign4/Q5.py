import numpy as np
import policy_iteration as pi

T = np.array([
   [[0.1, 0.4, 0.3, 0.2, 0, 0],
    [0.1, 0, 0.4, 0.3, 0.1, 0.1],
    [0, 0.3, 0, 0.4, 0.1, 0.2],
    [0, 0.1, 0.3, 0.3, 0.2, 0.1],
    [0, 0, 0, 0, 0.7, 0.3],
    [0, 0, 0, 0, 0.3, 0.7]],

   [[0.4, 0.3, 0.2, 0.1, 0, 0],
    [0.1, 0, 0.2, 0.4, 0.2, 0.1],
    [0, 0.2, 0, 0.4, 0.2, 0.2],
    [0, 0.1, 0.4, 0.2, 0.2, 0.1],
    [0, 0, 0, 0.3, 0.7, 0],
    [0, 0, 0, 0, 0.7, 0.3]]
])

R = np.array([[1, 3, 1, 2, 4, 4],
              [4, 2, 2, 1, 3, 5]])


for gamma in [0.5, 0.8]:
    print(f'For gamma = {gamma}')
    h, acplan, V, V_hat = pi.policy_iteration(T,R,gamma)
    print('Optimal Policy = ', acplan[h,:])
    print('Optimal Value  = ', V[h,:])
    print('')
