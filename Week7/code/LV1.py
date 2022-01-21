"""
This script demonstrates the Lotka-Volterra model.
"""

import scipy as sc
import scipy.integrate as integrate
import numpy as np

# create array
y = np.array([5, 20, 18, 19, 18, 7, 4])

# define a function that returns the growth rate of consumer and resource population at any given time step.
def dCR_dt(pops, t=0):
    """
    This function returns the growth rate of consumer and resource population at any given time.
    """

    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C 
    dCdt = -z * C + e * a * R * C
    
    return np.array([dRdt, dCdt])

# assign parameter values
r = 1.
a = 0.1 
z = 1.5
e = 0.75

# define the time vector
t = np.linspace(0, 15, 1000)

# set the intial conditions for the two populations and convert the two into an array
R0 = 10
C0 = 5 
RC0 = np.array([R0, C0])

# now numerically integrate this system forward from those starting conditions
pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

import matplotlib.pylab as p

# open an empty figure object
f1 = p.figure()

# plot graph
p.plot(t, pops[:,0], 'g-', label='Resource density') # Plot
p.plot(t, pops[:,1]  , 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')

# save figure as pdf
f1.savefig('../results/LV_model.pdf') #Save figure

# open an empty figure object
f2 = p.figure()

# plot graph
p.plot(pops[:,0], pops[:,1], 'r-') # Plot
p.grid()
p.xlabel('Resource density')
p.ylabel('Consumer density')
p.title('Consumer-Resource population dynamics')

# save figure as pdf
f2.savefig('../results/LV2_model.pdf') #Save figure