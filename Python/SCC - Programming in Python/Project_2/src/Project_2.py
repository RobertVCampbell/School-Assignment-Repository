'''
Created on Apr 26, 2016

@author: Robert Campbell, Keith Birch
Purpose: To make a GUI-based Tic-Tac-Toe game that:
        - Changes to X or O, based on turn, when clicked
            using a graphic for either
        - Detects win state during endTurn()
        - Keeps Track of who's turn it is
        - Outputs a text file of who has won
        - Sets a flag for each "button" depending on which
            player clicked it
        - A button prompt for new game
'''
from tkinter import *

#xImage = PhotoImage(file = "..\img\X.gif")

class Game(Frame):
    def __init__(self):
        """Setup window and the widgets"""
        
        #Auto initialize variable in Frame class
        Frame.__init__(self)
        
        #Set the frame title
        self.master.title("Tic-Tac-Toe")
        
        #Sets grid layout manager to grid layout
        #Sets grid to stick to all 4 edges
        #Currently, sticky doesn't work
        self.grid(sticky = N+S+E+W)
        
        #Labels and Field Initial Height
        self._turnLabel = Label(self, justify="center", text = "X's Turn")
        self._turnLabel.grid(row=0, column=0, columnspan = 2)
        
        #Button to start a new game, works by rerunning the self.__intit__
        self._newGame = Button(self, text = "New Game", state = DISABLED, command = self.__init__)
        self._newGame.grid(row=0, column=2)
        
        
        #Initializes variables with the image files for the board buttons
        self._blankIcon = PhotoImage(file = "../img/blank.gif")
        self._xIcon = PhotoImage(file = "../img/X.gif")
        self._oIcon = PhotoImage(file = "../img/O.gif")
        
        
        
        ''' Sets X as the player that goes first.
            Initializes the cell tracking list with each field being blank
             - ._buttonClaim matches up with buttons in order of left to right, top to bottom
             - [1-1, 1-2, 1-3, 2-1, 2-2, 2-3, 3-1, 3-2, 3-3]'''
        self._player = "X"
        self._buttonClaim = ["","","","","","","","",""]
        
        
        
        '''Creates the 9 buttons used to play the game
            - Naming convention is self._button(row)(column)
            - Initializes each button to the blank image
            - When the button is clicked, it runs the corresponding command
               the respective cell'''
        self._button11 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn11)
        self._button11.grid(row=1, column=0, columnspan=1)
        
        self._button12 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn12)
        self._button12.grid(row=1, column=1, columnspan=1)        
        
        self._button13 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn13)
        self._button13.grid(row=1, column=2, columnspan=1)        
        
        self._button21 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn21)
        self._button21.grid(row=2, column=0, columnspan=1)        
        
        self._button22 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn22)
        self._button22.grid(row=2, column=1)
               
        self._button23 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn23)
        self._button23.grid(row=2, column=2)
                
        self._button31 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn31)
        self._button31.grid(row=3, column=0)
                
        self._button32 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn32)
        self._button32.grid(row=3, column=1)
                
        self._button33 = Button(self, height = 75, width = 75, image = self._blankIcon, state = NORMAL, command = self._turn33)
        self._button33.grid(row=3, column=2)
        
        
        
    '''The functions that run when the corresponding button is clicked: 
        - It will check if the button has been pressed before
        - If not, it will test to see whose turn it is
        - Then it will fill the cell with the appropriate image,
            as well as claiming the appropriate position in the list
        - Finally, it will connect to the _endTurn function'''  
    def _turn11(self):
        while self._buttonClaim[0] == "":
            if self._player == "X":
                self._button11["image"] = self._xIcon
                self._buttonClaim[0] = "X"
            elif self._player == "O":
                self._button11["image"] = self._oIcon
                self._buttonClaim[0] = "O"
            self._endTurn()
            
    def _turn12(self):
        while self._buttonClaim[1] == "":
            if self._player == "X":
                self._button12["image"] = self._xIcon
                self._buttonClaim[1] = "X"
            elif self._player == "O":
                self._button12["image"] = self._oIcon
                self._buttonClaim[1] = "O"         
            self._endTurn()

    def _turn13(self):
        while self._buttonClaim[2] == "":
            if self._player == "X":
                self._button13["image"] = self._xIcon
                self._buttonClaim[2] = "X"
            elif self._player == "O":
                self._button13["image"] = self._oIcon
                self._buttonClaim[2] = "O"
            self._endTurn()
        
    def _turn21(self):
        while self._buttonClaim[3] == "":
            if self._player == "X":
                self._button21["image"] = self._xIcon
                self._buttonClaim[3] = "X"
            elif self._player == "O":
                self._button21["image"] = self._oIcon
                self._buttonClaim[3] = "O"
            self._endTurn()
            
    def _turn22(self):
        while self._buttonClaim[4] == "":
            if self._player == "X":
                self._button22["image"] = self._xIcon
                self._buttonClaim[4] = "X"
            elif self._player == "O":
                self._button22["image"] = self._oIcon
                self._buttonClaim[4] = "O"
            self._endTurn()

    def _turn23(self):
        while self._buttonClaim[5] == "":
            if self._player == "X":
                self._button23["image"] = self._xIcon
                self._buttonClaim[5] = "X"
            elif self._player == "O":
                self._button23["image"] = self._oIcon
                self._buttonClaim[5] = "O"
            self._endTurn()
            
    def _turn31(self):
        while self._buttonClaim[6] == "":
            if self._player == "X":
                self._button31["image"] = self._xIcon
                self._buttonClaim[6] = "X"
            elif self._player == "O":
                self._button31["image"] = self._oIcon
                self._buttonClaim[6] = "O"
            self._endTurn()
            
    def _turn32(self):
        while self._buttonClaim[7] == "":
            if self._player == "X":
                self._button32["image"] = self._xIcon
                self._buttonClaim[7] = "X"
            elif self._player == "O":
                self._button32["image"] = self._oIcon
                self._buttonClaim[7] = "O"
            self._endTurn()

    def _turn33(self):
        while self._buttonClaim[8] == "":
            if self._player == "X":
                self._button33["image"] = self._xIcon
                self._buttonClaim[8] = "X"
            elif self._player == "O":
                self._button33["image"] = self._oIcon
                self._buttonClaim[8] = "O"
            self._endTurn()


    """This function will test if the win-state has been met:
        - If it has, then it will run self._winStatement
        - If it has not, then it will switch players and continue the game"""
    def _endTurn(self):
        #Tests to see if the current player any horizontal wins
        if self._buttonClaim[0] == self._player and self._buttonClaim[1] == self._player and self._buttonClaim[2] == self._player:
            self._winStatement(self._player)
        elif self._buttonClaim[3] == self._player and self._buttonClaim[4] == self._player and self._buttonClaim[5] == self._player:
            self._winStatement(self._player)
        elif self._buttonClaim[6] == self._player and self._buttonClaim[7] == self._player and self._buttonClaim[8] == self._player:
            self._winStatement(self._player)
        
        #Tests to see if the current player has any vertical wins    
        elif self._buttonClaim[0] == self._player and self._buttonClaim[3] == self._player and self._buttonClaim[6] == self._player:
            self._winStatement(self._player)
        elif self._buttonClaim[1] == self._player and self._buttonClaim[4] == self._player and self._buttonClaim[7] == self._player:
            self._winStatement(self._player)
        elif self._buttonClaim[2] == self._player and self._buttonClaim[5] == self._player and self._buttonClaim[8] == self._player:
            self._winStatement(self._player)
        
        #Tests to see if the current player has any diagonal wins   
        elif self._buttonClaim[0] == self._player and self._buttonClaim[4] == self._player and self._buttonClaim[8] == self._player:
            self._winStatement(self._player)
        elif self._buttonClaim[2] == self._player and self._buttonClaim[4] == self._player and self._buttonClaim[6] == self._player:
            self._winStatement(self._player)
         
        #If none of the above has been met
        #  - It tests for who the current player is
        #  - Switches the active player
        #  - Switches the label to reflect whose turn it is
        #For some reason an error occurs if these comments are made into a docstring with either ''' or """
        else:
            if self._player == "X":
                self._player = "O"
                self._turnLabel["text"] = "O's Turn"
            else:
                self._player = "X"
                self._turnLabel["text"] = "X's Turn"
                
        
        
        
    '''This function will run once a win condition has been met:
        - It will display which player has won
        - Adds the winner to ../history/gamehistory.txt
        - It will enable the New Game button so that the players can start a new game
        - It will disable the gameboard buttons from being clicked until the new game'''
    def _winStatement(self, w):
        self._turnLabel["text"] = self._player + " Wins"
        history = open("../history/gamehistory.txt", "w")
        history.write(self._player + " Wins \n")
        self._newGame["state"] = NORMAL
        self._button11["state"] = DISABLED
        self._button12["state"] = DISABLED
        self._button13["state"] = DISABLED
        self._button21["state"] = DISABLED
        self._button22["state"] = DISABLED
        self._button23["state"] = DISABLED
        self._button31["state"] = DISABLED
        self._button32["state"] = DISABLED
        self._button33["state"] = DISABLED
        

        
def main():
    Game().mainloop()
    

main()