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
