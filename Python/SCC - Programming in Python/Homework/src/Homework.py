'''
Created on Feb 2, 2016

@author: Robert Campbell

Intent: To accept and display user input for their name and age.
'''

userName = input("Hello. What is your name? ")

#userColor = input("What is your favorite color? ")
#print("I meant yelloooooooowwwww!!!!!")

userAge = int(input("How old are you? "))

print("Hello, " + userName +". You seem much younger than " + str(userAge) + ".")