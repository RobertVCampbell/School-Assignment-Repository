pop <- HistData::MacdonellDF$height

xbar <- replicate(10000, {
  x<-sample(pop,100,replace=TRUE)
  mean(x)
})

head(xbar)
mean(xbar)
sd(xbar)
plot(density(xbar))


mean(pop)
sd(pop)
sd(xbar)
sd(pop)/(sqrt(trials))


pop<- rexp(100000, 0.5)
plot(density(pop))

n <- 10000

xbar <- replicate(10000, {
  x<-sample(pop,n,replace=TRUE)
  mean(x)
})

mean(xbar)
sd(xbar)
plot(density(xbar))

mean(pop)
sd(pop)
sd(xbar)
sd(pop)/(sqrt(n))



