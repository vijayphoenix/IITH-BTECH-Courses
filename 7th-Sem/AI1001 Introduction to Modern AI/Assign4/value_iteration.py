import numpy as np

def value_iteration(T,R,discount,tolerance):


    [action,state]=R.shape
    dimen = T.ndim
    if dimen < 3:
        T = np.array([T,np.zeros([state,state])])
    # print('No. of Actions = ', action) # gives number of actions
    # print('No. of States = ', state) # gives number of states.
    # A variable to start an infinite loop.
    dono = 1
    # A variable to see the length of horizon.
    h = 0
    # The upper limit on the length of the horizon.
    limit=1000 # 1000 can be changed as per requirement.
    # V is the max value function
    V = np.zeros([limit,state])
    acplan = np.zeros([limit,state])
    V[h,:] = np.amax(R,axis=0)
    locmax = np.argmax(R,axis=0)
    locmin = np.argmin(R,axis=0)
    locmax[locmax==locmin] = action+1
    acplan[h,:] = locmax
    while dono == 1:
        h=h+1
        i=0
        Q = np.zeros([action,state])
        while i < action:
            Q[i,:] = R[i,:]+discount*np.matmul(T[i,:,:],V[h-1,:])
            i=i+1
        V[h,:]  = np.amax(Q,axis=0)
        locmax = np.argmax(Q,axis=0)
        locmin = np.argmin(Q,axis=0)
        locmax[locmax==locmin] = action+1
        acplan[h,:] = locmax
        if np.amax(np.absolute(V[h,:]-V[h-1,:]))<tolerance:
            break
    V = V[~np.all(V == 0, axis=1)]
    acplan = acplan[~np.all(acplan == 0, axis=1)]
    if action == 1:
        acplan = 'nan'
    # print('Optimal value = ',V)
    # print('Action plan', acplan)
    # print('No. of itterations = ', h)
    # print('Optimal policy = ', acplan[h,:])
    # print('Value function = ', V[h,:])
    return h, acplan, V