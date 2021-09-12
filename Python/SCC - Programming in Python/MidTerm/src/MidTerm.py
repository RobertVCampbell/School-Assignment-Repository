'''
Created on Mar 3, 2016

@author: Robert Campbell
Purprose: To test a sentence to see if it is a palindrome. Output if it is or is not,
          and ask if the user would like to input another sentence.

St. Simon sees no mists. Test one
Hello world, I love Python. Test 2
racecar Test 3
A man, a plan, a canal -- Panama Test 4
'''

sentence = ""
user = "yes"

print("This program will test to see if a sentence is a palindrome.")

while user == "yes":
    enteredList = []
    reversedList = []
    index = int()
    sentence = input("Enter a sentence you would like to test:")
    for character in sentence.strip():
        #Check for end sentence punctuation
        if character.isalpha() == True:
            character = character.lower()
            enteredList.append(character)
    index = len(enteredList) - 1
    
    for count in range(0, index + 1):
        reversedList.append(enteredList[index - count])
    
    if enteredList == reversedList:
        print("'", sentence, "' is a palindrome.\n")
    else:
        print("'", sentence, "' is not a palindrome.\n")
    
    user = input("Would you like to enter another sentence, Yes or No?")
    user = user.lower()
    if user != "yes" and user != "no":
        print("ERROR: Please enter a valid response.")
        user = input("Would you like to enter another sentence, Yes or No?")
        user = user.lower()
