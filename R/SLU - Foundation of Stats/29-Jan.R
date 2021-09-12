#In-class Fri. Jan 29
#Comment syntax 


2+3
6/2*(1+2)

# R works with "vectors"
# Creates a 20-length vector starting at 1 incrementing by 1
# Similar to matlab, the most basic data types used are vectors

1:20


# You can name objects called "variables"
# = also does work as an assignment, but using <- is the
# accepted standard (kind of like VHDL <=)

x <- -10:10
x
x^2
y <- x^2
y
plot(x,y)


# Built-in variables

#Lengths of Major North American Rivers from built-in datasets
# From world of facts 1975
rivers

#Pulls help on the variable
?rivers

#Generates a histogram
hist(rivers)

# Finds the max value in the provided object
max(rivers)


# Data frames
# Variables in colums, observations in rows

# Motor Trend Car Road Tests - 1974
mtcars
?mtcars

# Structure function
str(mtcars)

# Runs the examples in the variable's help page
example(mtcars)


# Libraries
# Easiest way to import is from the packages tab
# GUI version is simplest:
  # Click install, type in the package name, and install it

# CLI Command is:
  # install.packages("HistData")

# Only import a package one time.

# To use it, once persession run:
library(HistData)

# HistData from 1710
Arbuthnot
example(Arbuthnot)
