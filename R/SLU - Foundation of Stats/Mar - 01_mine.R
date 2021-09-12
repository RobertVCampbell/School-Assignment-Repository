# March 1, 2021

# q 15, but with normal rather than unif
# PDF is dnorm (dunif for p)
# CDF is pnorm (punif for p)

x <- seq(-1,2,.1)
x
plot(x, dnorm(x,1,.5)) # pdf, type='l' makes it a line rather than scatter
plot(x, pnorm(x,1,.5),type='l') #cdf


# Can do pdf with simulation, but not necessarily cdf (easily)
X <- rnorm(10000, 1,.5)
hist(X)
plot(desnity(X))
quantile(X) # Gives percentile in quarters
quantile(X,probs=seq(0,1,.01)) # Percentile by percent

plot(quantile(X,probs=seq(0,1,.01)), seq(0,1,.01), type='l') # plots percentile from 0to1

 # -------- #


