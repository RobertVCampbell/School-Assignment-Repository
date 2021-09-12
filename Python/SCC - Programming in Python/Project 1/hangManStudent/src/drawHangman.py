'''
Created on Sep 19, 2015

@author: rmckanry

This modules create the hangman stand and then each function draws
the parts of the hangman game including head, body, right arm,
left arm, right leg, and left leg

List of Functions:
Default - creates the stand
drawHead - creates a circle for the head
drawBody - draws a line straight down for the body
drawRightArm - draws the right arm and returns to the body
drawLeftArm - draws the left arm and returns to the body
drawRightLeg - draws the right leg and returns to the body
drawsLeftLeg - draws the left leg (the last body part to draw
reset - Resets the screen and redraws the stand to replay

'''
  
def default(babbage):
    #Start drawing stand
    babbage.penup()
    babbage.setpos(0,-50)
    babbage.pendown()
    babbage.back(100)
    babbage.fd(50)
    babbage.left(90)
    babbage.forward(175)
    babbage.right(90)
    babbage.forward(50)
    babbage.right(90)
    babbage.forward(25)
    babbage.right(90)
    #End drawing stand

def drawHead(babbage):
    babbage.pencolor("red")
    babbage.circle(15)
    babbage.penup()
    babbage.left(90)
    babbage.forward(30)
    babbage.pendown()

def drawBody(babbage):
    babbage.forward(65)
    babbage.back(40)
    babbage.right(90)

def drawRightArm(babbage):
    babbage.forward(30)
    babbage.right(180)
    babbage.forward(30)

def drawLeftArm(babbage):
    babbage.forward(30)
    babbage.back(30)


def drawRightLeg(babbage):
    #Move to lower body
    babbage.right(90)
    babbage.forward(40)
    #Draws the leg
    babbage.right(45)
    babbage.forward(40)
    babbage.right(180)
    babbage.forward(40)
    babbage.right(90)

def drawLeftLeg(babbage):
    babbage.forward(40)
    
def reset(babbage):
    babbage.reset()
    default(babbage)
