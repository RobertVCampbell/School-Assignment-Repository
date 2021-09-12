'''
Created on Mar 29, 2016

@author: Robert Campbell
Purpose: Restructure the newton program to use three cooperating functions:
    1) Accepts an estimated sqrt
    2) Tests for tolerance
    3) Improves the estimated sqrt value
'''

'''
#Original code, as given by the book on p.113
import math

#Receive the input number from the user
x = float(input("Enter a positive number: "))

#Initialize the tolerance and estimate
tolerance = 0.000001
estimate = 1.0

#Perform the successive approximations
while True:
    estimate = (estimate + x / estimate) /2
    difference = abs(x - estimate ** 2)
    if difference <= tolerance:
        break
    
#Output the result
print("The program's estimate:", estimate)
print("Python's estimate:     ", math.sqrt(x))
'''

import math

def main():
    x = float(input("Enter a positive integer: "))
    estimate = newton(x)
    print("The square root of", x, "is: ", estimate)
    print("Python's estimate:      ", math.sqrt(x))

def newton(x):
    est = float(1.0)
    est = (est + x / est) / 2
    est = limitReached(est, x)
    return est

def limitReached(est, x):
    tol = .0000001
    while True:
        diff = abs(x - est ** 2)
        if diff <= tol:
            return est
        else:
            est = improveEstimate(est, x)

def improveEstimate(est, x):
    est = (est + x / est) /2
    return est
    
    
main()