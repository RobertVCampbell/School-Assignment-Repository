# March 29, 2021
library(fosdata)
str(normtemp)
temp <- normtemp$temp
hist(temp)
xbar <- mean(temp)
xbar
s <- sd(temp)
s
stderror <- s/sqrt(130)
stderror
# want tcritical so that 95% of t falls between
# +/- tcritical.  129 degrees of freedom
# split the tail of 5% into two .. .025 each
tcritical <- -qt(0.025,129)
# confidence interval
xbar - tcritical * stderror  # lower
xbar + tcritical * stderror  # upper
# we are 95% confident that the true mean
# human temperature is in the interval
# [98.122, 98.37646]
t.test(temp)  # gives the 95% confidence interval

# Let's get a 99% C.I.
tcritical99 <- -qt(0.005, 129)
tcritical99
xbar - tcritical99 * stderror  # lower
xbar + tcritical99 * stderror  # upper
t.test(temp, conf.level = .99)
# just get the confidence interval
t.test(temp, conf.level = .99)$conf.int

# get a 95 and 99% conf. int for heart rate
normtemp$bpm

# Try player ratings in NBA2K21
# http://mtdb.com/21/packs/mtdb

# Let's see if the 95% C.I. really works 95% of
# the time
x <- rnorm(10) # sample size n=10 from std normal
t.test(x)$conf.int
x <- rnorm(10); t.test(x)$conf.int
x
x <- rnorm(10); ci <- t.test(x)$conf.int; ci[1] < 0 & ci[2] > 0
simdata <- replicate(100000, {
  x <- rnorm(10);
  ci <- t.test(x)$conf.int;
  ci[1] < 0 & ci[2] > 0
})
mean(simdata) # correct 95% of the time, as promised.
