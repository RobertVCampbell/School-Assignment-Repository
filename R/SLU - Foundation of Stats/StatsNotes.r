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


# Command to send Ctrl + L to the console to clear it
cat("\014")

hot_dogs <- read.csv("https://mathstat.slu.edu/~clair/stat/data/hot-dogs.csv")
str(hot_dogs)

hot_dogs$sodium
summary(hot_dogs)

hist(hot_dogs$sodium)
hist(hot_dogs$calories)

max(hot_dogs$sodium)


plot(table(hot_dogs$sodium))

summary(hot_dogs$calories)
hot_dogs$calories > 180
hot_dogs[hot_dogs$calories > 180 , ] # returns each row containing hotogs w/ > 180 cal
hot_dogs[hot_dogs$sodium> 500, ]

cereal <- read.csv("https://mathstat.slu.edu/~clair/stat/data/cereal.csv")
str(cereal)
summary(cereal)
cereal$sugars
table(cereal$sugars)
cereal[cereal$sugars == -1, ]

plot(hot_dogs$sodium, hot_dogs$calories, col=table(hot_dogs$type))
table(hot_dogs$type) # how to get row from table?


# Wednesday, Feb 3, 2021

# fosdata library - packaged with our book
# to install, must pull it from Dr. Speegle's github
# this requires the program remotes
# remotes::install_github("speegled/fosdata")

# to use fosdata:
library(fosdata)

?bechdel
str(bechdel)

table(bechdel$test)
table(bechdel$test, bechdel$clean_test)

hist(bechdel$intgross) # right skew, meaning long small tail to the right
mean(bechdel$intgross) # NA

# If you look at the intgross data, some data is not available:
bechdel$intgross

# Since some data is not available, R will not process the mean
# Can have mean handle na values with the arguement na.rm
mean(bechdel$intgross, na.rm = TRUE)

# Or you can remove NA values from the data set with is.na function
is.na(bechdel$intgross)
# Use ! to negate T/F values
!is.na(bechdel$intgross)

# To store the cleaned up data set
cleangross <- bechdel[!is.na(bechdel$intgross),]

# Then process the mean with the cleaned data
mean(cleangross$intgross)

# na.omit does something similar
mean(na.omit(bechdel$intgross))


# Probability simulation


# the c command makes a vector
c(1,2,3,4,5)
coin <- c('H','T')

# sample chooses from a vector
sample(coin,1) # simulate one coin flip, this samples without replacement
sample(coin,10)# fails because the sample space depletes after 2 samples
sample(coin,2)# as such this will only give HT or TH, never HH or TT

sample(coin, 10, replace=TRUE) # This runs samples with replacement


# What's the probability of heads?
table(sample(coin, 10, replace=TRUE)) #easier, but not simpler
table(sample(coin, 10000, replace=TRUE)) # typically we'll use ~10,000 events

# Doing 1B events was a mistake
# Error: cannot allocate vector of size 3.7 Gb


sample(coin,10,replace = TRUE) == "H" # produce T/F vector, T when heads
mean(sample(coin,10000,replace = TRUE) == "H") #


# Feb 10, 2021

# Simulating a test with 98% specificity

# 10% of people have the disease
people <- sample(0:1, 100000, prob=c(.9,.1), replace=TRUE)
head(people,n=100)

# ifelse(vectorname, if, else)
# If the person has it (1, or true), then the test is 1
# Else (0 or false) the test is random with 98% chance of 0.
test <- ifelse(people, 1, sample(0:1, 100000, prob=c(.98,.02), replace=TRUE))
table(people, test)

# num positive tests
sum(test)

# number of false positives
sum(test & !people)

# probability taht a positive test is a false positive
sum(test & !people)/sum(test)


# Try w/ 1% prevalence
people <- sample(0:1, 100000, prob=c(.9,.01), replace=TRUE)
head(people,n=100)

# ifelse(vectorname, if, else)
# If the person has it (1, or true), then the test is 1
# Else (0 or false) the test is random with 98% chance of 0.
test <- ifelse(people, 1, sample(0:1, 100000, prob=c(.98,.02), replace=TRUE))
table(people, test)

# num positive tests
sum(test)

# number of false positives
sum(test & !people)

# probability taht a positive test is a false positive
sum(test & !people)/sum(test)

# Try w/ 0.1% prevalence
people <- sample(0:1, 100000, prob=c(.9,.001), replace=TRUE)
head(people,n=100)

# ifelse(vectorname, if, else)
# If the person has it (1, or true), then the test is 1
# Else (0 or false) the test is random with 98% chance of 0.
test <- ifelse(people, 1, sample(0:1, 100000, prob=c(.98,.02), replace=TRUE))
table(people, test)

# num positive tests
sum(test)

# number of false positives
sum(test & !people)

# probability taht a positive test is a false positive
sum(test & !people)/sum(test)


# Conclusion: The rarer the disease, the much larger the proportion of false positives

# ------------------------- 

# Bayes rule in action
# Pic a coin which may be fair (50-50) or unfair ~80% heads.
p <- sample(c(.5,.8), 1)
p

# flip it a lot
sample(c("H","T"), 100, prob=c(p,1-p), replace=TRUE)

# For Bayes' theorem, goal it to sample a few times only
pfair <- .5
# flip it once
sample(c("H","T"), 1, prob=c(p,1-p), replace=TRUE)
# got heads
# compute the probability that I have a fair coin, given I got heads
# P(fair|heads)= P(heads|fair) * P(fair)/P(heads)
pheads <- .5 * pfair + .8*(1-pfair)

# This is because there are 2 ways you could get heads.
# 50% of the times with a fair coin, it'll be heads
# 80% of the times, it'll be unfair or 1 - probability of it being fair
pheads
# update pfair
pfair <- .5*pfair/pheads

# If second flip is then tails
ptails <- .5*pfair + .2*(1-pfair)
ptails


# Binomial syntax: rbinom(trials,n,p)
trials <- 100000
# Simulate ESP testing
# Could be done with sample and replicate
replicate(100, {
  cards <- sample(1:5, 10, replace=TRUE)
  guess <- sample(1:5,10, replace=TRUE)
  sum(cards == guess)
  })

# Using rbinom
rbinom(100,10,.2)

esp <-rbinom(trials,10,.2)
mean(esp) # expected value
table(esp) # outcomes
table(esp)/trials  # percentage
plot(table(esp)/trials)  # pmf visualized

head(esp,100)
mu <- 2
head(esp-mu,100)
mean(esp-mu)
mean((esp-mu)^2) # variance
var(esp) # Shorter variance

sqrt(mean((esp-mu)^2)) # std
sd(esp) # also standard deviation
# Standard deviation is the deviation from the mean where most of your
# data will exist in


# Voting: 30% voters will vote for Reed
#   732 voters polled
# Check the expected value
# Plot the pmf
# What's the probabilitiy that < 200 voters say they will support Reed?
# What's the probability that the poll says he has 33% or more of the vote?

votes <-rbinom(trials, 732, .3)
plot(table(votes)/trials)  # pmf

ltvotes <- (votes < 200)
sum(ltvotes)/trials # lt percentage

perc <- votes/732
gtperc <- (perc >= .33)
sum(gtperc)/trials # gt percentage

732 * .33
mean(votes)
var(votes)
sd(votes)
# 1 sd greater, basically upper bound
mean(votes) + sd(votes)

# Margin of error as a percentage:
(2*sd(votes))/732


# Monday Feb 22, 2021

trials <- 10000

# problem 3.19
# 200 voters, 55% approve
# simulate with rbinom

X <- rbinom(trials, 200, .55)
plot(table(X))
mean(X)
var(X)
# sd is sqrt(np(1-p))
sd(X)
# margin of error
2*sd(X)
X < 100 # This is the event that prop A looks like it will fail

# Can test the lottery in simulation, but it is difficult
# Probably just do it by hand




# Check Properties of variance
X <- rbinom(trials, 50, .3)
# Making an independent Y
Y <- rbinom(trials, 50, .3)

var(X)
var(Y)
var(X+Y)

X <- rbinom(trials, 50, .3)
# Making an independent Y
Y <- sample(1:20, trials, replace=TRUE)

var(X)
var(Y)
var(X+Y)


X <- rbinom(trials, 50, .3)
# Making an dependent Y, so the var should not be addtitive
Y <- rbinom(trials, 50, .3) + X

var(X)
var(Y)
var(X+Y)


# Proving computational formula for variance
# var(X) = E[X^2] - E[X]^2

head(X)
mean(X)
head(X^2)
mean(X^2)
mean(X^2) - (mean(X))^2
var(X)


# Bernoulli / Binomial
# p = probability of success
# q = 1-p
# X ~ Binom(n,p)
# E(X) = np
# var(X) = npq
# sd = sqrt(npq)


# Won't do much with Geometric random variables
# Copying notes from slide

# Repeat Bernoulli trials until first success
# X is the number of failures before the first success. X = 0,1,2,3,4,...
# Say that X is a geometric random variable with probability of success p.
# X ~ Geom(p)
# (Also common to see Y = number of total trials, Y = X + 1)
# Example: Roll a die until you get a 6. X ~ Geom(1/6)

# Geometric simulation
rolls <- sample(1:6, 100, replace=TRUE)
# Need to find first 6
# Since 6 is max, it will return the first 6 
# need - 1 because R indexes from 1
rolls
which.max(rolls) - 1

# Could use a while loop to test until the first component
# Example in end of ch 5(?)
# Or just use rgeom(trials, probability)
# Simulates 100 values of X ~ Geom(1/6)
rgeom(100,1/6)

# larger simulation
X <- rgeom(trials,1/6)
plot(table(X))
mean(X)

test <- c(1,2,2,4,8)
test

sum(test == 2)

sum((0:999)>=0)

18/38


# runif(trials,a,b) for uniform probability
# note: Using mean(x == ..) is easier than sum(x ==)/trials
# Suppose X ~ Unif[0,10]
trials <- 100
runif(trials,0,10)

# Unif[0,3]
# Height of the pi function is 1/3
# P(X<= 1) = int from 0 - 1 = 1/3
x <- runif(trials,0,3)
(sum(x<=1)/trials)
# returned 0.3346


# P(X>2.5) = 1/6 (integral)
(sum(x>2.5)/trials)
mean(x>2.5)
# returned 0.168 ~~ 1/6

# E[X] mean, should be 1.5
# int from -inf to inf of xf(x)dx
# integral 1/3 * x dx  = 1/2 * 1/3 x^2|0 to 3 =  9/6 = 3/2
mean(x)
# Returned 1.497

# E[X^2]
# 1/3 * x^2 integral = 1/3 * 1/3 x^3|0 to 3 =  27/9 = 3/1
mean(x^2)
# returned 2.989697
var(x) + mean(x)^2
# Returned 2.98672

# E[X^2] - E[X]^2 = 3 - (3/2)^2 = 3 - 9/4 = 3 - 2.25 = .75
var(x)
# 0.74

# sd = sqrt(0.75) = 0.8660254
sd(x)
#returned 0.864


# cdf is given by p versions of our random functions, r prefix meant random
# pbinom(x,n,p), pgeom(x,p), punif(x,a,b)

# 80% freethrow shooter making < 5 shots
pbinom(4,10,.8)

# probability of 80% freethrow shooter make more than 10 shots before first miss
# X - # of makes until first miss geom(.2)
pgeom(9,.2) # Prob of 9 or less before first miss
1 - pgeom(9,.2) # Prob of 10 or more

# Prob a goal is scored in first 10 min in a 1-0 soccer game
# X - time goal scored in 90min soccer game, unif(0,90)
punif(10,0,90)


# Feb 26, 2021
# pregnancy is Norm(280,10)
# P(pregnancy lasting more than 287 days)
pnorm(287,280,10)  # less than 287 days
1-pnorm(287,280,10) # more than 287 days
# another way:
pnorm(287,280,10,lower.tail=FALSE)

# probabilty of premature (<37 weeks)
37*7  #days
X <- rnorm(10000, 280, 10)
hist(X)
mean(X < 259)
pnorm(259, 280, 10)

# what are longest 1%?
pnorm(303.5, 280, 10)
# qnorm is the inverse pdf.  Given a probability, what is x?
qnorm(.99, 280, 10)


# Tuna Hg level ~ Norm(0.689,0.341)
1-pnorm(1,0.689,0.341)  #18% 1 ppm Hg or higher
pnorm(0.5,0.689,0.341)  #29% 0.5 ppm Hg or lower
qnorm(.99, 0.689, 0.341) # worst 1%

rnorm(21,.689,.341)
worst <- replicate(10000, max(rnorm(21, 0.689, 0.341)))
hist(worst)
mean(worst > 1.84)

students <- rnorm(10,80,5)
B<-sum(students > 85)
B > 3
#students <- 
mean(replicate(trials, sum(rnorm(10,80,5)>=85))>3)

hist(rnorm(trials, 5036, 122))


# March 1, 2021

# question 15, but with normal
# PDF is dnorm  (dunif for #15)
# CDF is pnorm  (punif for #15)

x <- seq(-1,2,.1)
x
plot(x, dnorm(x,1,.5), type='l')  # PDF
plot(x, pnorm(x,1,.5))  # CDF

# Can also do #15 with simulation
X <- rnorm(10000,1,.5)  # except, use runif
hist(X)
plot(density(X))
plot(quantile(X,probs=seq(0,1,.01)),seq(0,1,.01),type='l')

goals <- scan()  # paste in goals by hand
mean(goals)
table(goals)
plot(table(goals))

# dpois(x, rate) gives the poissson distribution.
x <- 0:8
points(x,dpois(x, 2.67)*64)
# how many 0 goal games do we expect?
dpois(0, 2.67)  # 7% of games should have 0 goals
dpois(0, 2.67)*64  # expect 4.43 games with 0 goals in 64 games

# how many games do we expect to have 5 or more goals?
dpois(5:8, 2.67)
sum(dpois(5:8, 2.67)*64)
sum(goals >= 5)

# simulate the tournament
rpois(64, 2.67)
plot(table(rpois(64, 2.67)))

# exponential random variable measures time between events
# 2.67 goals per game.. how long do you expect to wait for 1st goal
1/2.67
# minutes:
(1/2.67)*90

# what's the probability of a goal in the first 5 minutes?
# simulate T = time to first goal
Tgoal <- rexp(10000,2.67)
hist(Tgoal)
mean(Tgoal)
mean(Tgoal < 5/90)
pexp(5/90, 2.67) # P(time of first goal < 5/90ths of the game)
