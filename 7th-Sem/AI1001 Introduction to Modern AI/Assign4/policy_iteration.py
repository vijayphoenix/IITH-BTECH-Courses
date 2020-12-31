import numpy as np


def policy_iteration(T,R,discount):


    [action,state]=R.shape
    # print('No. of Actions = ', action) # gives number of actions
    # print('No. of States = ', state) # gives number of states.
    # A variable to start an infinite loop.
    dono = 1
    # A variable to see the length of horizon.
    h = 0
    # The upper limit on the length of the horizon.
    limit=1000 # 1000 can be changed as per requirement.
    # To exit the loop we need tolerance.
    tolerance = 0.01
    # V is the max value function
    V = np.zeros([limit,state])
    V_hat = np.zeros([limit,state])
    acplan = np.zeros([limit,state])
    V[h,:] = np.amax(R,axis=0)
    locmax = np.argmax(R,axis=0)
    acplan[h,:] = locmax
    br=0
    
    while dono == 1:
    
        # value evaluation for a given policy
        
        donod = 1
        R_pi = np.zeros([1,state]) 
        T_pi = np.zeros([state,state])
        for x in range(state):
            T_pi[x,:] = T[int(acplan[h,x]),x,:] # Create state transition matrix as per policy
            R_pi[:,x] = R[int(acplan[h,x]),x] # Create reward as per policy
        V_hat[br,:]=V[h,:]
        while donod == 1:
            br=br+1
            V_hat[br,:] = R_pi+discount*np.matmul(T_pi,V_hat[br-1,:])
            if np.amax(np.absolute(V_hat[br,:] - V_hat[br-1,:]))< tolerance:
                break
                
        # Policy evaluation
        h=h+1
        V[h,:] = V_hat[br,:]
        i=0
        Q = np.zeros([action,state])
        while i < action:
            Q[i,:] = R[i,:]+discount*np.matmul(T[i,:,:],V[h,:])
            i=i+1
        locmax = np.argmax(Q,axis=0)
        acplan[h,:] = locmax
        if np.amax(np.absolute(V[h,:]-V[h-1,:]))< tolerance:
            break
            
    V = V[~np.all(V == 0, axis=1)]
    V_hat = V_hat[~np.all(V_hat == 0, axis=1)]
    acplan = acplan[~np.all(acplan == 0, axis=1)]
    acplan[acplan==action+1]=np.nan
    return h, acplan, V, V_hat 
