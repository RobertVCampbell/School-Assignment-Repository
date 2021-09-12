'''
Created on Feb 29, 2016

@author: regen
'''
import drawHangman
import turtle

window = turtle.Screen()
window.setup(400, 400, 200, 200)
HG = turtle.Turtle()
drawHangman.default(HG)
drawHangman.drawHead(HG)
drawHangman.drawLeftArm(HG)
drawHangman.drawRightArm(HG)
drawHangman.drawLeftLeg(HG)
drawHangman.drawRightLeg(HG)
what = input("Something")


turtle.done()