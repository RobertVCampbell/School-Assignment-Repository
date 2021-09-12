'''
Created on Feb 6, 2016

@author: Robert Campbell
Purpose: Build a code that will guess a user's inputed number, using conditional statements and loops.
'''

'''
Example code from class:

import random

smaller = int(input("Enter the smaller number: "))
larger = int(input("Enter the larger number: "))
myNumber = random.randint(smaller, larger)
count = 0

while True:
    count += 1
    userNumber = int(input("Enter your guess: "))
    if userNumber < myNumber:
        print("Too small.")
    elif userNumber > myNumber:
        print("Too large:")
    else:
        print("Congratulations! You got it in", count, "tries!")
        break
'''


#This is all that is required for the homework
import random

smaller = int(input("Enter the smaller number: "))
larger = int(input("Enter the larger number: "))

count = 0
done = False

while not done:
    userNumber = int(input("Enter a number for the computer to guess: "))
    if userNumber >= smaller and userNumber <= larger:  
        while True:
            count += 1
            myNumber = random.randint(smaller, larger)
            if myNumber < userNumber:
                print("Guess number", count, "is:", myNumber, "\nLooks like it's too small, I'll try again.")
                smaller = myNumber
            elif myNumber > userNumber:
                print("Guess number", count, "is:", myNumber, "\nLooks like it's too big, I'll try again.")
                larger = myNumber
            else:
                print("Your number is", myNumber, "right?\nOnly took me", count, "tries!")
                done = True
                break
    else:
        print("ERROR: Please enter a value between", smaller, "and", larger)



'''
#A more interactive version with the user having the choice between guessing or letting the computer guess
import random

#all of the variables that are needed for both codes, they are just set to 0 for their declaration
smaller = int(input("Welcome to High/Low\nPlease enter the smaller number: "))
larger = int(input("Please enter the larger number: "))
userNumber = 0
myNumber = 0
count = 0
done = False
gameType = int(input("Please enter 1 if you would like to guess or 0 if you would like me to: "))

if gameType == 1:
    myNumber = random.randint(smaller, larger)
    while True:
        count += 1
        userNumber = int(input("Please enter your guess: "))
        if userNumber < myNumber:
            print("Too low.")
        elif userNumber > myNumber:
            print("Too high.")
        else:
            print("Congratulations! You got it in", count, "tries!")
            break
elif gameType == 0:
    while not done:
        userNumber = int(input("Please input a number for me to guess: "))
        if userNumber <= larger and userNumber >= smaller:
            while True:
                count += 1
                myNumber = random.randint(smaller, larger)
                if myNumber < userNumber:
                    print("Guess number", count, "is:", myNumber, "\nLooks like it's too low, I'll try again.")
                    smaller = myNumber
                elif myNumber > userNumber:
                    print("Guess number", count, "is:", myNumber, "\nLooks like it's too high, I'll try again.")
                    larger = myNumber
                else:
                    print("Your number is", myNumber, "right?", "\nOnly took me", count, "tries!")
                    done = True
                    break
        else:
            print("ERROR: Value must be between", smaller, "and", larger, ".")
'''

''' 
#Alternative way of having the computer guess, using the median instead of a random Number

smaller = int(input("Please enter the smaller number: "))
larger = int(input("Please enter the larger number: "))
count = 0
userNumber = int(input("Please enter a number for me to guess"))

while True:
    count += 1
    myNumber = ((larger - smaller) / 2) + smaller
    if myNumber < userNumber:
        print("Guess number", count, "is:", myNumber, "\nLooks like it's too low, I'll try again.")
        smaller = myNumber
    elif myNumber > userNumber:
        print("Guess number", count, "is:", myNumber, "\nLooks like it's too high, I'll try again.")
        larger = myNumber
    else:
        print("Your number is", myNumber, ", right?\nOnly took me", count, "tries!")
        break
'''