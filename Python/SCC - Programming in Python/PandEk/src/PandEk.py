'''
Created on Feb 2, 2016

@author: Robert Campbell

Intent: To calculate momentum and kinetic energy using user inputs for mass and velocity.
'''

#Need to import at least the pow function from the math library to calculate the kinetic energy
from math import pow

mass = float(input("What is the object's mass in kg? "))

velocity = float(input("What is the object's velocity in m/s? "))

momentum = mass * velocity

#The SI unit for momentum is kg m/s, or, alternatively, the Newton second
print("The momentum of the object is: " + str(momentum)+ "kg m/s")

energyKinetic = .5 * mass * (pow(velocity, 2))

#The SI unit for energy is the Joule(J)
print("The kinetic energy of the object is: " + str(energyKinetic) + "J")