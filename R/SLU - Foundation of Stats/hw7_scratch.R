n<-8
trials<-10000
mu<-.5*(0+1)
sigma<- sqrt((1/12)*(1-0)^2)
sim<-replicate(trials, {x<-runif(n,0,1);
(mean(x)-mu) / (sigma/sqrt(n))
})
plot(density(sim))
curve(dnorm(x),add=TRUE,col="red")


sumExpData <- replicate(10000, sum(rexp(20, 2)))
plot(density(sumExpData),
     main = "Density of Sum of 20 Exponentials",
     xlab = "X1 + ... + X20"
)

mean(sumExpData)
sd(sumExpData)

#Central
mu<-10
sigma<-2.5
n<-100
sumNorm<-replicate(10000,{x <- replicate(n, x<-sum(rexp(20, 2)));
                  (mean(x)-mu)/(sigma/sqrt(n))})
plot(density(sumNorm))
plot(density(sumExpData),
     main = "Density of Sum of 20 Exponentials",
     xlab = "X1 + ... + X20"
)


#```{r}
n<-36
trials<-10000
k<-2
mu<-k
sigma<- sqrt(2*k)
sim<-replicate(trials, {x<-rchisq(n,df=k);
(mean(x)-mu) / (sigma/sqrt(n))
})
plot(density(sim))
curve(dnorm(x),add=TRUE,col="red")
#```

curve(dt(x, 1), from = -5, to = 5)

x<-replicate(10,mean(rt(100,1)))
y<-replicate(10,mean(rt(1000,1)))
z<-replicate(10,mean(rt(10000,1)))

plot(density(x))
plot(density(y))
plot(density(z))


n<-8
trials<-10000
mu<-2
sim<-replicate(trials, {x<-rnorm(n,2,3);
(mean(x)-mu) / (sd(x)/sqrt(n))
})
plot(density(sim))
curve(dt(x,df=7),add=TRUE,col="red")


n<-12
mu<-1
sigma<-3
sim<-replicate(10000, {x<-rnorm(n,1,sigma);
(mean(x)-mu) / (sigma/sqrt(n))
})
plot(density(sim))
curve(dt(x,df=11),add=TRUE,col="red")


x<-rt(10000,df=6)
plot(density(x))

qt(0.1, df=6)
pt(-1.439756,df=6)
1-pt(1.439756,df=6)


1-pnorm(2)
1-pt(2,df=40)
1-pt(2,df=20)
1-pt(2,df=10)
1-pt(2,df=5)

curve(dnorm(x), from = -5, to = 5, lwd=2)
curve(dt(x,df=40),add=TRUE,col="red")
curve(dt(x,df=20),add=TRUE,col="blue")
curve(dt(x,df=10),add=TRUE,col="green")
curve(dt(x,df=5),add=TRUE,col="yellow")

library(dplyr)
plastics <- fosdata::plastics %>% filter(!is.na(diameter))
diam <- plastics$diameter
xbar<-mean(diam)
s<-sd(diam)
stderror<- s/sqrt(length(diam))
tcritical = -qt(0.005, df=(length(diam)-1))
xbar - tcritical * stderror
xbar + tcritical * stderror

str(morley)
table(morley$Expt)
morley$Speed
light <- morley$Speed + 299000
xbar<-mean(light)
s<-sd(light)
stderror<- s/sqrt(length(light))
tcritical = -qt(0.025, df=(length(light)-1))
xbar - tcritical * stderror
xbar + tcritical * stderror


lambda<-0.5
mu <- (1/lambda)
sigma <- sqrt(1/(lambda^2))
y<-t.test(rexp(10,lambda),mu=2)$conf.int
str(y)
y
y[1]

z<-replicate(1000, {y<-t.test(rexp(100,lambda),mu=2)$conf.int;
      (mu >= y[1]) & (mu <=y[2])})
sum(z)/length(z)

zz<-replicate(10000, {xx<-rexp(10,lambda); mean(xx)})
plot(density(zz))

curve(dexp(x,lambda), from=-1, to=10)
