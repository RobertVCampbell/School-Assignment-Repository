'''
Using Turtle
'''
import drawHangman
import turtle
import random
#from pip._vendor.html5lib.ihatexml import letter

#using a file for a wordbank and using a dictionary for storing the word and guesses
wordBank = {}
wordFile = open('..\data\wordBank.txt', 'r')


'''

#using a dictionary as my word bank
wordBank = {}
wordBank['1'] = 'to'
wordBank['2'] = 'from'
wordBank['3'] = 'here'
wordBank['4'] = 'we'
wordBank['5'] = 'three'
wordBank['6'] = 'readline'
wordBank['7'] = 'who'
wordBank['8'] = 'wednesday'
wordBank['9'] = 'python'
wordBank['10'] = 'java'
wordBank['11'] = 'processor'
wordBank['12'] = 'string'
'''
#The gameloop for the user guessing the letters in the word
def guessLetter(wordList, guessList, attempt):
    #The i variable keeps the loop running until the user guesses incorrectly
    i = True
    while i is True:
        wrong = 1
        index = 0
        #takes users guessed letter and makes it lowercase
        guess = input("Guess a letter:")
        guess = guess.lower()

        #checks the user's guess against each letter in the word. Updates the guessList with correct guesses. If incorrect, changes wrong flag to 1
        for letter in wordList:
            if guess == letter:
                guessList[index] = letter
                wrong = 0
            elif wrong == 0:
                wrong = 0
            else:
                wrong = 1
            index += 1

        #Checks to see if the user has correctly guessed the word and will exit the loop if guessed correctly
        if wordList == guessList:
            i = False

        #If the user has guessed incorrectly, the wrong flag will be 1. Displays relevant message and updated guessList
        elif wrong == 0:
            print("Correct! So far you have:\n", guessList)
        elif wrong == 1:
            print("Sorry,", guess, "is not in the word.\n So far you have:\n", guessList)
            i = False
            attempt[0] = attempt[0] + 1

    return #wordList, guessList, attempt


#Module to select a random word from wordBank, make it into a list, as well as create a matching and blank guessList
#it passes the total index values for wordBank as well as the global lists wordList and guessList
def createWord(bankIndex, wordList, guessList):
    
    #creates a random int using the bankIndex as max value and then selects the word that corresponds
    wordLine = str(random.randint(0, bankIndex - 1))
    word = wordBank[wordLine]
    
    #takes each letter in a word stripped of whitespace and adds it to wordList
    #for each letter added to wordList, an _ is added to guessList
    for letter in word.strip():
        wordList.append(letter)
        guessList.append("_")
    #print(wordList,"\n",word,"\n",guessList)
    return


def main():
    #Do not change or remove code from here
    window = turtle.Screen()
    window.setup(400, 400, 200, 200)
    HG = turtle.Turtle()
    drawHangman.default(HG)
    #To here

    #copies all words from wordFile into dict wordBank after stripping whitespace
    #index is stored as the dict keys 
    bankIndex = 0
    for word in wordFile:
        word = word.strip()
        wordBank[str(bankIndex)] = word
        bankIndex +=1

    #Outtermost loop. as long as the user choose yes, the loop will continue
    user = "yes"
    while user == "yes":

        #lists that need to be reset during each game
        wordList = []
        guessList = []
        attempt = [0]
        
        createWord(bankIndex, wordList, guessList)

        #prints the blank guessList so that users can see the number of letters in the word
        print(guessList)
        
        #loops the guessLetter module until either the user guess the whole word correctly or reaches six attempts
        while attempt[0] < 6:
            guessLetter(wordList, guessList, attempt)
            
            if wordList == guessList:
                break
            elif attempt[0] == 1:
                drawHangman.drawHead(HG)
            elif attempt[0] == 2:
                drawHangman.drawBody(HG)
            elif attempt[0] == 3:
                drawHangman.drawRightArm(HG)
            elif attempt[0] == 4:
                drawHangman.drawLeftArm(HG)
            elif attempt[0] == 5:
                drawHangman.drawRightLeg(HG)

        #Winstate message and gives the option to play again
        if wordList == guessList:
            print("Congratulations! The word was:", "".join(wordList))
            user = input("Would you like to play again?\nYes or No:")
            user = user.lower()
            while user != "yes" and user != "no":
                print("Please enter a valid response.")
                user = input("Would you like to play again?\nYes or No:")
                user = user.lower()
            if user == "yes":
                drawHangman.reset(HG)

        #Failstate message and gives the option to play again
        elif attempt[0] == 6:
            drawHangman.drawLeftLeg(HG)
            print("Out of tries.\nThe word was", ''.join(wordList))
            user = input("Would you like to play again?\nYes or No:")
            user = user.lower()
            while user != "yes" and user != "no":
                print("Please enter a valid response.")
                user = input("Would you like to play again?\nYes or No:")
                user = user.lower()
            if user == "yes":
                drawHangman.reset(HG)
            
    input("")
    
    #Start your program below here You may still need other imports
    


    return#End of the main function
    
main()
