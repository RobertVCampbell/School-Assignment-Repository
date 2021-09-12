'''
Created on Apr 12, 2016

@author: rc215088
Purpose: Uses Turtle to draw a Koch Snowflake, using recursive functions
'''
from turtle import Turtle
import math
import sys


def main():
    level = int(input("Enter the level: "))
    drawKochFractal(level, 400, 400, 300)
    #drawFractalLine()
    
    
def drawKochFractal(level, width, height, size):
    """Draw a Koch fractal of the given level and size"""
    t = Turtle()
    t.hideturtle()
    t.speed(900)
    t.up()
    x = -width // 3
    y = height // 4
    t.goto(x, y)
    t.down()
    drawFractalLine(t, size, 0, level)
    drawFractalLine(t, size, -120, level)
    drawFractalLine(t, size, 120, level)
    

def drawFractalLine(t, distance, theta, level):
    """Either draws a single line in a given direction
    or four fractal lines in new directions."""
    #Draws 3 lines, initial angles 0, -120, 120, any size
    #recursive
    #Draws 4 lines if not level 0, 1/3 of the distance, -1 level, angle
    if (level == 0):
        drawPolarLine(t, distance, theta)
    else:
        drawFractalLine(t, distance // 3, theta, level - 1)
        drawFractalLine(t, distance // 3, theta + 60, level - 1)
        drawFractalLine(t, distance // 3, theta - 60, level - 1)
        drawFractalLine(t, distance // 3, theta, level - 1)
    

def drawPolarLine(t, distance, theta):
    """Moves a given distance in a given direction"""
    #t.down()
    t.setheading(theta)
    t.forward(distance)
    #t.up()
    return


main()
input()