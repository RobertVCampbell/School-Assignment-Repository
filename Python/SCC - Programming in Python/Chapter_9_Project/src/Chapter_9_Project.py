'''
Created on Apr 22, 2016

@author: Robert Campbell
Purpose: Make a program that functions as the
        GUI-based Bouncy program described in Ch 9.1
        
        This is a GUI-based variation on Project 4
        from Chapter 3
'''

from tkinter import *
from math import *


class Bouncy(Frame):
    def __init__(self):
        """Setup window and the widgets"""
        
        #Auto initialize variable in Frame class
        Frame.__init__(self)
        
        #Set the frame title
        self.master.title("Bouncy Calculator")
        
        #Sets grid layout manager to grid layout
        #Sets grid to stick to all 4 edges
        self.grid(sticky = N+S+E+W)
        
        #Labels and Field Initial Height
        self._initialLabel = Label(self, text = "Initial Height")
        self._initialLabel.grid(row=0, column=0)
        self._initialVar = DoubleVar()
        self._initialEntry = Entry(self, textvariable = self._initialVar)
        self._initialEntry.grid(row=0, column=1)
        
        #Label and fields bounciness index
        self._indexLabel = Label(self, text = "Bounciness Index")
        self._indexLabel.grid(row=1, column=0)
        self._indexVar = DoubleVar()
        self._indexEntry = Entry(self, textvariable = self._indexVar)
        self._indexEntry.grid(row=1, column=1)
        
        #Label and fields number of bounces
        self._bouncesLabel = Label(self, text = "Number of bounces")
        self._bouncesLabel.grid(row=2, column=0)
        self._bouncesVar = DoubleVar()
        self._bouncesEntry = Entry(self, textvariable = self._bouncesVar)
        self._bouncesEntry.grid(row=2, column=1)
        
        #Button Creation
        self._button = Button(self, text = "Compute", command = self._bounce)
        self._button.grid(row=3, column=0, columnspan=2)
        
        
        #Label and fields Distance
        self._distanceLabel = Label(self, text = "Total Distance")
        self._distanceLabel.grid(row=4, column=0)
        self._distanceVar = DoubleVar()
        self._distanceEntry = Entry(self, textvariable = self._distanceVar)
        self._distanceEntry.grid(row=4, column=1)

    def _bounce(self):
        """Event handler for button
            Calculates the Total Distance traveled"""
        distance = 0
        count = 0
        initial = self._initialVar.get()
        index = self._indexVar.get()
        bounces = self._bouncesVar.get()
        while count < bounces:
            distance += initial + (index * initial)
            initial = index * initial
            count += 1
        self._distanceVar.set(distance)


def main():
    """Instance and popup window"""
    Bouncy().mainloop()
    

main()