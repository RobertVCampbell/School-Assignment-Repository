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
