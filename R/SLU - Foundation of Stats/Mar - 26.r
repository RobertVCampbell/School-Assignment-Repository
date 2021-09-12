# 26 Mar 2021

library(HistData)
trials<-10000
n<-4

pop <- MacdonellDF$height # heights of english criminals
plot(density(pop))
mu <- mean(pop)
sigma <- sd(pop)
mu
sigma
curve(dnorm(x,mu,sigma), add=TRUE, col="red")

# take samples of size n=4
x<- sample(pop,n,replace=TRUE); mean(x)
sim<-replicate(trials, {x<- sample(pop,n,replace=TRUE); mean(x)})
plot(density(sim))
mean(sim)
sd(sim)

# standardize by subtracting mu and dividing by sigma
sim<-replicate(trials, {x<- sample(pop,n,replace=TRUE);
            (mean(x)-mu) / (sigma/2)
})
plot(density(sim))
curve(dnorm(x),add=TRUE,col="red")


# replace sigma with s estimated from the sample
# sigma/2 is now s/2, the standard error
sim<-replicate(trials, {x<- sample(pop,n,replace=TRUE);
(mean(x)-mu) / (sd(x)/2)
})
plot(density(sim))
curve(dnorm(x),add=TRUE,col="red")

# this new distribution is not normal and is known as the StudentT distribution
# Recall Gosset published under the pseudonym Student
curve(dt(x,df=3),add=TRUE,col="green")

# compare t with normal
# 3 df
x<- seq(-5,5,.01)
plot(x,dnorm(x),type='l',col='blue')
plot(x,dt(x,df=3), type='l', col='green')
plot(x,dt(x,df=20),type='l',col='blue')

# as df increases, t approaches normal pdf
plot(x,dt(x,5), type='l')
curve(dt(x,df=30), add=TRUE, col="blue")
curve(dnorm(x),add=TRUE, col="red")

plot(x,pt(x,df=5), type="l")
plot(x,pt(x,df=30), type="l")

# prob that t is  < -2
pt(-2,df=5)
pt(-2,df=30)

# the value where 2.5% is to the left
qt(0.025, df=30)

?qt
