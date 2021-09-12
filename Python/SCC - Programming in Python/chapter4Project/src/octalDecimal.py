'''
Created on Feb 23, 2016

@author: Robert Campbell
Purpose: A program that can converts to octal from decimal
'''

start = int(0)
end = int(3)
i = True
binary = int(0)
decimal = int(0)
conv = int(0)
octal = ""

octal = input("Please enter an Octal value:")

exp = len(octal) - 1
for digit in octal:
    decimal = decimal + int(digit) * 8 ** exp
    exp = exp - 1
print ("The integer value is", decimal)