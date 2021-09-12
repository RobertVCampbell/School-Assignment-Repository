# March 26, 2021

library(HistData)
pop <- MacdonellDF$height # heights of english criminals
plot(density(pop))
mu <- mean(pop)
sigma <- sd(pop)
mu
sigma
curve(dnorm(x,mu,sigma), add=TRUE, col="red")

# take samples of size n=4
x <- sample(pop,4,replace=TRUE); mean(x)
sim <- replicate(10000,{
  x <- sample(pop,4,replace=TRUE); mean(x)
})
plot(density(sim))

# standardize by subtracting mu and dividing by sigma/2
sim <- replicate(10000,{
  x <- sample(pop,4,replace=TRUE);
  (mean(x) - mu)/(sigma/2)
})
plot(density(sim))
curve(dnorm(x),add=TRUE, col="red")

# Replace sigma with s estimated from the sample.
# sigma/2 is now s/2, the standard error
sim <- replicate(10000,{
  x <- sample(pop,4,replace=TRUE);
  (mean(x) - mu)/(sd(x)/2)
})
plot(density(sim))
curve(dnorm(x),add=TRUE, col="red")
plot(density(sim))
curve(dt(x,df=3),add=TRUE, col="green")

# compare t with normal
# 3 df
x <- seq(-5,5,.01)
plot(x, dnorm(x), type='l')
plot(x, dt(x,df=3), type='l')
plot(x, dt(x,df=20), type='l')

# get P(t < -2)
pt(-2, df=5)
pnorm(-2)  # for comparison

# get C with 95% between -C and C
# need C so P(t < -C) is 2.5%
qt(0.025, df=5)
pt(-2.57, df=5)
