import numpy as np


def hitting_probability(A: np.ndarray, a: int):
    """ Calculate Hitting Probabilities

    Args:
        A: `np.ndarray`, State Transition matrix of the following form

        A = | A11 A12 |
            | 0    I  |

        a: `int`, No. of absorbing states

    Returns:
        `np.ndarray`, Shape is (r * a) where r is no. of transient states.

    """
    assert A.shape[0] == A.shape[1] 
    r = A.shape[0] - a
    return np.linalg.inv(np.eye(r) - A[:-a, :-a]) @ A[:-a, r:]


A = np.array([
    [0.1, 0.4, 0.3, 0.2, 0, 0],
    [0.1, 0, 0.4, 0.3, 0.1, 0.1],
    [0, 0.3, 0, 0.4, 0.1, 0.2],
    [0, 0.1, 0.3, 0.3, 0.2, 0.1],
    [0, 0, 0, 0, 1.0, 0],
    [0, 0, 0, 0, 0, 1.0]])

print('Hitting Probabilities = \n', hitting_probability(A, 2))
