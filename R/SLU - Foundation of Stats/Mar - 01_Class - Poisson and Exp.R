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
