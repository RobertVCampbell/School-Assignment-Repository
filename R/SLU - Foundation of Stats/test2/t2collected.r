#--- Homework8 scratch.r ---#
suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(ggplot2)))
suppressMessages(suppressWarnings(library(tidyr)))


library(ISwR)
react <- ISwR::react 
plot(density(react))
t.test(react,conf.level = 0.98)

xbar <- mean(react)
xbar
s <- sd(react)
s
stderror <- s/sqrt(length(react))
stderror
# want tcritical so that 95% of t falls between
# +/- tcritical.  129 degrees of freedom
# split the tail of 5% into two .. .025 each
tcritical <- -qt(0.01,(length(react)-1))
# confidence interval
xbar - tcritical * stderror  # lower
xbar + tcritical * stderror  # upper
# we are 95% confident that the true mean
# human reacterature is in the interval
# [98.122, 98.37646]
t.test(react)  # gives the 95% confidence interval

# Let's get a 99% C.I.
tcritical99 <- -qt(0.005, 129)
tcritical99
xbar - tcritical99 * stderror  # lower
xbar + tcritical99 * stderror  # upper
t.test(react, conf.level = .99)
# just get the confidence interval
t.test(react, conf.level = .99)$conf.int
#-------------------------#
child_est<- fosdata::weight_estimate %>% filter(age!= 'adult')
t.test(child_est$mean100, mu=100)
t.test(child_est$mean200, mu=200)
t.test(child_est$mean300, mu=300)
t.test(child_est$mean400, mu=400)

xbar <- mean(child_est$mean100)
xbar

stderr <- sd(child_est$mean100)/sqrt(length(child_est$mean100))
stderr
100-xbar

# xbar is much further from the null hypothesis
# >5 stderr's away
t<-(xbar-100)/stderr

x<-seq(-7,7,.1)
# recall df is num samples - 1
plot(x,dt(x,df=(length(child_est$mean100)-1)),type='l')

# 5 stderrs away is pretty far off in the tail
# calculate p-value, the area beyond t
t
1-pt(t,df=(length(child_est$mean100)-1))
# because it is symmetric, include the right tail as well by doubling it

2*(1-pt(t,df=(length(child_est$mean100)-1)))


t.test(child_est$mean100, mu=100)

#------------------#

obesity<-ISwR::bp.obese
str(obesity)

t.test(obesity$bp, mu=120)
length(obesity)
table(obesity$bp)
str(obesity)

t.test(bp ~ sex, data=obesity)
library(Sleuth3)
oil<-Sleuth3::ex0112
t.test(BP ~ Diet, data=oil)

str(oil)

size <- Sleuth3::ex0333
boxplot(BrainSize ~ LitterSize, data=size)
size %>% ggplot(aes(x=BrainSize)) + geom_histogram() + facet_grid(vars(LitterSize))
size<-mutate(size,logBrain=log(BrainSize))
boxplot(logBrain ~ LitterSize, data=size)
size %>% ggplot(aes(x=logBrain)) + geom_histogram() + facet_grid(vars(LitterSize))
t.test(logBrain ~ LitterSize,data=size)


str(size)


# Hyp: There is a significant difference in volume in the affected brain regions of schizophrenic patients.
vol<-Sleuth3::case0202
pvol<-vol %>% pivot_longer(col=Unaffected:Affected, names_to = "Diagnosis", values_to = "BrainVolume")
pvol %>% ggplot(aes(x=BrainVolume)) + geom_histogram() + facet_grid(vars(Diagnosis))
t.test(BrainVolume ~ Diagnosis, pvol)



moo<-fosdata::cows_small
t.test(moo$tk_12, moo$control, paired = TRUE)
t.test(cows_small$tk_0_75, cows_small$control, paired = TRUE)

str(moo)


child<-fosdata::child_tasks
t.test(day_night_completion_time_secs ~ gender, data=child)


x<-rnorm(10,mean=4, sd=1)
t.test(x,conf.level = 0.95)

z<-replicate(10000, {x<-rnorm(10,mean=4, sd=1);
  y<-t.test(x,conf.level = 0.95)$conf.int;
  (4 > y[1]) && (4<y[2])})
mean(z)


x<-rexp(10,0.25)
t.test(x,conf.level = 0.95)

z<-replicate(10000, {x<-rexp(10,0.25);
  y<-t.test(x,conf.level = 0.95)$conf.int;
  (4 > y[1]) && (4<y[2])})
mean(z)


z<-replicate(10000, {x<-rexp(100,0.25);
y<-t.test(x,conf.level = 0.95)$conf.int;
(4 > y[1]) && (4<y[2])})
mean(z)


pval<- replicate(10000,{x<-rnorm(20,0,1);
  y<-convolve(x, c(1, 1), type = "filter");
  t.test(y, mu=0)$p.value})
mean(pval>0.05)



# notes from class:
mtcars$logmpg <- log(mtcars$mpg)

mutate(mtcars,logmpg=log(mpg) ) %>%  boxplot(logmpg ~ vs, data=.)
##
# Simulate effective type1 error rate for a t-test

groups <- c(rep("g1",10),rep("g2", 10))
groups
x <- rnorm(20)
t.test(x~groups)$p.value
boxplot(x~groups)
pvals<-replicate(10000, {x <- rnorm(20);t.test(x~groups)$p.value})
mean(pvals < 0.01)
hist(pvals)

pvals<-replicate(10000, {x <- rexp(20);t.test(x~groups)$p.value})
mean(pvals < 0.01)
hist(pvals)

#--- Apr - 14.r ---#
# April 14, 2021
library(Stat2Data)
library(dplyr)
library(ggplot2)
data("Backpack")

USJudgeRatings
boxplot(USJudgeRatings) # Base R can make the plot
# ggplot would need you to turn column names into a variable
# to use x as the x aesthetic

intake <- ISwR::intake
# Rotates all columns
intake %>%  tidyr::pivot_longer((cols=everything()))

intake %>%  tidyr::pivot_longer((cols=everything())) %>%  ggplot(aes(x=name, y=value)) + geom_boxplot()


head(Backpack)

Backpack %>% filter(Sex=="Female") %>% group_by(Year) %>% summarize(students = n())

Backpack %>% group_by(Major) %>% summarize(students = n()) %>% arrange(desc(students))

# Note, may need extra work to add labels to the factor, probably do it outside of the ggplot call
# something like factor(BackProblems, levels = c("0","1"), labels = c("No back problems", "Back Problems))
# inside of a mutate call
Backpack %>% ggplot(aes(x=BodyWeight,y=BackpackWeight, color=factor(BackProblems))) + geom_point() +
  scale_color_manual( values=c("gray", "red") )
# Can add "breaks" to set specific values for color manual if you want to reorder the list
# The above is satisfactory

t.test(BodyWeight ~ Sex, data=Backpack)

t.test(BackpackWeight ~ Sex, data=Backpack)

t.test(BackpackWeight ~ BackProblems, data=Backpack)


#--- Apr - 09_Class - Two Independent Sample t-test.R ---#
# April 9, 2021
library(dplyr)
library(ggplot2)
library(fosdata)

str(normtemp)

boxplot(normtemp$temp)
normtemp <- normtemp %>%
  mutate(gender = factor(gender, labels=c("M","F")))
normtemp %>% ggplot(aes(x=gender, y=temp))+
  geom_boxplot()
normtemp %>% ggplot(aes(x=temp))+
  geom_histogram(bins=20) + facet_grid(vars(gender))
normtemp %>% ggplot(aes(sample = temp, color=gender)) +
  geom_qq() + geom_qq_line()

# Read ~ (tilde) "as depending on"
t.test(temp ~ gender, data=normtemp)
# there is a significant difference in temp
# between M & F gender (p= 0.02394)

# same syntax works with boxplot
boxplot(temp ~ gender, data=normtemp)

# Is there a difference in heart rate between
# male and female?
t.test(bpm ~ gender, data=normtemp)
# no significant difference (p = 0.5287)




#--- Apr - 12_Class - Creating new Variables_Effective Type I.R ---#
# April 12, 2021
mtcars
mtcars$logmpg <- log(mtcars$mpg)
mtcars
library(dplyr)
rm(mtcars)
mtcars <- mutate(mtcars, logmpg = log(mpg))
mtcars
rm(mtcars)
mutate(mtcars, logmpg = log(mpg)) %>% t.test(logmpg ~ vs, data=.)
mutate(mtcars, logmpg = log(mpg)) %>% boxplot(logmpg ~ vs, data=.)

# Simulate the effective type I error rate for a t-test
groups <- c(rep("g1",10),rep("g2",10))
groups
x <- rnorm(20)
t.test(x ~ groups)$p.value
boxplot(x ~ groups)

pvals <- replicate(10000, {x <- rnorm(20); t.test(x ~ groups)$p.value})
mean(pvals < 0.01)
hist(pvals)
# effective type I error rate is 0.0103, close to 0.01 as it should be

pvals <- replicate(10000, {x <- rexp(20); t.test(x ~ groups)$p.value})
mean(pvals < 0.01)
hist(pvals)
# effective type I error rate is 0.0055 rather than 0.01 as it should be


#--- Apr - 08.r ---#
# April 8, 2021
library(dplyr)
library(ggplot2)
library(fosdata)
str(normtemp)

boxplot(normtemp$temp)

normtemp<- normtemp %>% mutate(gender = factor(gender, labels=c("M","F")))
normtemp %>% ggplot(aes(x=gender,y=temp)) + geom_boxplot()

normtemp %>%  ggplot(aes(x=temp)) + geom_histogram(bins=20) + facet_grid(vars(gender))

normtemp %>% ggplot(aes(sample=temp,color=gender)) + geom_qq() +geom_qq_line()

# Read ~ "as depending on"
t.test(temp ~ gender, data=normtemp)
# There is a significant difference in temp between M & F gendered people
# p = 0.02394

# same syntax works with boxplot
boxplot(temp ~ gender, data=normtemp)

# is there a difference in heartrate
boxplot(bpm ~ gender, data=normtemp)
t.test(bpm ~ gender, data=normtemp)



bal<-read.csv("https://mathstat.slu.edu/~clair/stat/data/balance.csv")
str(bal)
table(bal$forward.back)

bal %>% ggplot(aes(x=side.side,y=forward.backward, color=age.group)) + geom_point()

bal <- bal %>% filter(side.side <30, forward.backward <40) 

boxplot(side.side ~ age.group, data=bal)
boxplot(forward.backward ~ age.group, data=bal)



t.test(side.side ~ age.group, data=bal)
t.test(forward.backward ~ age.group, data=bal)


#--- Apr - 05.R ---#
temp <- fosdata::normtemp$temp

# str(temp)
# Null hypothesis (mu0) is 98.6F

plot(density(temp))
hist(temp)

xbar <- mean(temp)
xbar

stderr <- sd(temp/sqrt(length(temp)))
stderr
98.6-xbar

# xbar is much further from the null hypothesis
# >5 stderr's away
t<-(xbar-98.6)/stderr

x<-seq(-7,7,.1)
# recall df is num samples - 1
plot(x,dt(x,df=129),type='l')

# 5 stderrs away is pretty far off in the tail
# calculate p-value, the area beyond t
t
pt(t,df=129)
# because it is symmetric, include the right tail as well by doubling it

2*pt(t,df=129)
# p value is 2.4 * 10^-7

# very unlikely, rejecut H0 and conclude that mean is not 98.6 (p = 2.4x10^-7)

# R function to output all of the stuff we've done so far
t.test(temp, mu=98.6)

# ----------------- #

#str(morley)
speed <- morley$Speed
speed <- speed + 299000;

c<- 299792.5

# Relatively normal
plot(density(speed))
hist(speed)

xbar<-mean(speed)
stderr<-sd(speed)/sqrt(length(speed))
xbar
stderr

t<-(xbar - c)/stderr

# generate an x-scale for plot
# make sure wide enough to view the t-value
x<-seq(-8,8,.1)

plot(x,dt(x,df=(length(speed)-1)),type='l')

# pretty far out in the tail

t
1-pt(t,df=(length(speed)-1))
# because it is symmetric, include the right tail as well by doubling it
2*(1-pt(t,df=(length(speed)-1)))
# p value is 1.871636x10^-11

# very unlikely, rejecut H0 and conclude
# that mean is not modern c (p = 1.871636x10^-11)

t.test(speed, mu=c)


# --------------- #

miss<-read.csv("https://mathstat.slu.edu/~clair/stat/data/miss-america.csv")
str(miss)

hist(miss$age)
mean(miss$age,na.rm=TRUE)

table(miss$age)
hist(miss$height)
hist(miss$weight)

t.test(miss$height, mu=64)
t.test(miss$weight, mu=162)


#--- Mar - 31_Class-Hypothesis-testing.R ---#
# March 31, 2021
# ch 5 problem 30
mean(rt(10000,1))
xbar <- replicate(10000,mean(rt(100,1)))
plot(density(xbar))
hist(xbar)

# 26
# sum 20 exponential rv's with rate 2
# mean of sum of 20 is 20*mean of one
# same for variance
# use that to calculute the mean and
# sd of xbar and plot normal curve
library(dplyr)
replicate(10000,sum(rexp(20,2))) %>%
  density() %>% plot()

# ch 8 # 4
x <- seq(-5,5,.1)
plot(x,dnorm(x),type='l')
plot(x,dt(x,40),type='l')

# dice
dice <- scan()
dice <- c(dice, 3)
dice
# 1 5 6 1 6 5 4 6 6 6 5 6 6 3
sum(dice == 6)
# got seven sixes
# H0: all six numbers equally likely
# Ha: they aren't
# probablyity of rolling seven (or more)
# sixes on 13 dice?
1-pbinom(6,13,1/6)
# P = 0.0024 probability of doing this by chance
# reject H0.. accept Ha, these dice are messed up.

library(HistData)
str(Arbuthnot)
# data is not tidy.. Sex is stored in variable names
births <- Arbuthnot %>% tidyr::pivot_longer(c(Males, Females),
                                    names_to = "Sex",
                                    values_to ="Births")
library(ggplot2)
births %>% ggplot(aes(x=Year, y=Births, color=Sex)) + geom_line()

# 82 years in a row, more male than female births
# suppose H0: male & female births equally likely.
# probability of 82 male majorities in a row is
.5^82
# P value is about 10^-25.. very small.
# reject H0




#--- hw7_scratch.R ---#
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


#--- Mar - 29_Class - Confidence-Intervals.R ---#
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


#--- Mar - 26_Class - Simulation-and-t.R ---#
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


#--- Mar - 26.r ---#
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


#--- hw6.r ---#
```{r}
suppressWarnings(suppressMessages())
```

suppressWarnings(suppressMessages({library(dplyr)
library(ggplot2)
library(babynames)
library(tidyr)
library(stringr)}
))

str(quakes)

quakes %>% ggplot(aes(x=lat, y=long, color=depth, size=mag)) + geom_point()

brakes <- fosdata::brake
str(brakes)

brakes %>% ggplot(aes(x=p1_p2)) + geom_density()
brakes %>% ggplot(aes(sample=p1_p2)) + geom_qq()+geom_qq_line()
brakes %>% ggplot(aes(sample=latency_p1)) + geom_qq() + geom_qq_line()
fosdata::austen %>% filter(novel=="Pride and Prejudice") %>% group_by(chapter) %>% 
  summarize(sentiment = mean(sentiment_score)) %>% ggplot(aes(x=sentiment, y=chapter, color=chapter)) + geom_col()
str(ISwR::juul)

ISwR::juul %>% ggplot(aes(x=age, y=igf1,color=tanner)) + geom_point() + geom_smooth()

fosdata::pres_election %>% mutate(party=factor(party)) %>%
  group_by(party, year) %>% summarize(votes=sum(candidatevotes,na.rm=TRUE)) %>%
  ggplot(aes(x=party, y=votes,fill=party)) + geom_col() + facet_wrap(vars(year))

str(Lahman::Batting)
?Lahman::Batting

Lahman::Batting %>% group_by(yearID) %>% ggplot(aes(x=yearID, y=X2B, color=yearID)) + geom_point()
Lahman::Batting %>% group_by(yearID,lgID) %>% filter(lgID == c("AL", "NL")) %>%
  ggplot(aes(x=yearID, y=X2B, color=lgID)) + geom_point() + scale_color_manual(values = c("red1","blue"))

str(babynames)

babynames %>% group_by(year, sex) %>% summarize(births = sum(n)) %>% 
  ggplot(aes(x=year, y=births, color=sex)) + geom_line()

babynames %>% group_by(year, sex) %>% summarize(u_names = n()) %>% 
  ggplot(aes(x=year, y=u_names, color=sex)) + geom_line()

babynames %>% filter(name %in% "Robert", sex=="M") %>%
  ggplot(aes(x=year,y=n)) + geom_line()

babynames %>% filter(name %in% c("Bryan", "Brian"), sex=="M") %>%
  ggplot(aes(x=year,y=n, color=name)) + geom_line()

babynames %>% filter(name %in% "Jessie") %>%
  ggplot(aes(x=year,y=n, color=sex)) + geom_line()

str(fosdata::scotland_births)
tidy_data<-fosdata::scotland_births %>% pivot_longer(!age, names_to="Year", values_to="Births")
tidy_data$Year<-str_remove(tidy_data$Year, "x")
tidy_data$Year<-as.integer(tidy_data$Year)
tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) + geom_line()

tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) + geom_line()
tidy_20<-tidy_data %>% filter(age == 20)
tidy_30<-tidy_data %>% filter(age==30)
tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) +
  geom_line() +geom_line(data=tidy_20, aes(x=Year,y=Births),color='red')+
  geom_line(data=tidy_30, aes(x=Year,y=Births),color='blue') + labs(title="Scotland Births Over Time by Mother's Age \nRed: Age 20 \tBlue: Age 30")



#--- Mar - 23.r ---#
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





#--- Mar - 19.r ---#
# 19 Mar
# Prepping data using dplyr for visualization

library(babynames)
library(dplyr)
head(babynames)
babynames %>% filter(name == "Evelyn", sex=="F") %>%
  ggplot(aes(x=year,y=n)) + geom_line()

babynames %>% filter(name %in% c("Mustafa", "Mostafa"), sex=="M") %>%
  ggplot(aes(x=year,y=n,group=name)) + geom_smooth() +geom_point()

babynames %>% filter(name %in% c("Robert","Bobby","Rob"), sex=="M") %>%
  ggplot(aes(x=year,y=n,color=name)) + geom_smooth() + geom_point()

babynames %>% filter(name %in% c("Rena","Reina","Rayna", "Reyna", "Raina"), sex=="F") %>%
  group_by(name) %>%  summarize(total = sum(n)) %>%  arrange(desc(total))

# Color also sets groiup
babynames %>% filter(name %in% c("Rena","Reina","Rayna", "Reyna", "Raina"), sex=="F") %>%
  ggplot(aes(x=year,y=n,color=name)) + geom_smooth() + geom_point()

# Regional st pats day data raw
regional.raw <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-regional.csv")
str(regional.raw)
# not tidy, data in var names
# fix with pivot_longer
library(tidyr)
regional.raw<- mutate(regional.raw, Celebration = ï..Celebration) %>% select(-ï..Celebration)
str(regional.raw)
regional <- regional.raw %>% pivot_longer(!Celebration, names_to="Region", values_to = "Percentage")
regional # Tidy data for plotting

regional %>% ggplot(aes(x = Region, y=Percentage, fill=Region))+ geom_col()+
    facet_wrap(vars(Celebration))


# Assaults
library(stringr)
assaults.raw <- read.csv("https://raw.githubusercontent.com/kjhealy/assault-deaths/master/data/oecd-assault-series-per-100k-standardized-to-2015.csv")
str(assaults.raw)
assaults <- assaults.raw %>% pivot_longer(!Country, names_to ="Year", values_to="Deaths") %>% 
  mutate(Year = as.integer(str_remove(Year,"X")))


assaults %>% ggplot(aes(x=Year,y=Deaths, color=Country)) + geom_point()


#--- Mar - 17.r ---#
# Mar 17
stpat <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-annual.csv")
str(stpat)

suppressMessages(library(dplyr))
library(ggplot2)

# simple plot total spending over time with different geometry
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_point()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_area()

ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green")

# note: aesthetic maps data to different things
#       attributes are declarations (e.g. fill = "green" is declaring an attribute)


# You can keep adding more geometries
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line() +
  labs(title="St. Pat Spending")


ggplot(stpat, aes(x = Year, y = Pct.celebrating)) +
  geom_point() + geom_line(color="green") + labs(title="St. Pat Celebrating")


# Use the iris data to make a plot of petal length vs petal width and color the plots by species
ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Species)) + geom_point()


# Plot percent celebrating x and per person spending y.
ggplot(stpat, aes(x = Pct.celebrating, y = Per.person.spending)) + geom_point()
# Set the size aesthetic to total spending
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending)) + geom_point()
# Add a geom_lable geometry and set the aesthetic label to year so the dots are labeled with years
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending, label=Year)) +
  geom_point() + geom_label()
# Use the nudge_y=0.5 attribute to geom_lable to move the labels off the dots
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending, label=Year)) +
  geom_point() + geom_label(nudge_y=0.5)


# Make a histogram (with ggplot) of petal widths.
ggplot(iris, aes(x=Petal.Width)) + geom_histogram()
# Set the fill aesthetic to species.
ggplot(iris, aes(x=Petal.Width,fill=Species)) + geom_histogram()
# Try adjusting the binwidth attribute of geom_histogram
ggplot(iris, aes(x=Petal.Width,fill=Species)) + geom_histogram(binwidth = 0.5)


#--- Mar - 22_Class - plotting factors storing plots.R ---#
# March 22, 2021
# data types
?mtcars
str(mtcars)

library(ggplot2)
library(dplyr)
mtcars %>% ggplot(aes(x=am, y=hp)) +
  geom_point()

# factors are variables that can take one
# of a few specified levels
# factor() makes a variable into a factor.
mtcars %>% mutate(am = factor(am)) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_point()

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_point()

mtcars %>% ggplot(aes(x=am, y=hp)) +
  geom_boxplot()  # bad, am is not continuous

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_boxplot() + geom_point(color="blue")

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_violin() + geom_point(color="blue")

# qq plots
library(fosdata)
str(brake)
brake %>% ggplot(aes(x=confidence)) + geom_histogram(bins=15)

# check against a normal (or other) distribution with qq plot
brake %>% ggplot(aes(sample=confidence)) + geom_qq() + geom_qq_line()
sort(brake$confidence)

brake %>% ggplot(aes(sample=age)) + geom_qq() + geom_qq_line()

brake %>% ggplot(aes(sample=latency_p3)) + geom_qq() + geom_qq_line()
brake %>% ggplot(aes(x=latency_p3)) + geom_histogram(bins=15)

# Ch 7 #20
# want data that looks like:
# Year Sex Numberofname
# 1880 M 50
# 1880 F 75
# 1881 M 57
# 1881 F 82
# ....
library(babynames)
babynames %>% group_by(year, sex) %>% summarize(n())
# n() counts rows in the group. Each row is a name.

# For complicated plots, you can save the plot in
# a variable and add to it.

maryplot <- babynames %>% filter(name == "Mary", sex == "F") %>%
  ggplot(aes(x=year, y=n)) + geom_line()
maryplot <- maryplot + labs(title="The story of Mary.")
print(maryplot)
print(maryplot + theme_bw())

# Mustafa will have office hours 12-1 Wednesday in
# this room, or ping him on discord.



#--- Mar - 19_Class - babynames st pat and assaults.R ---#
# March 19, 2021
library(fosdata)
str(pres_election)
head(pres_election)
# going to need to group by Year and Party to count the sum of votes.

# babynames - install if you need to
library(babynames)
?babynames
head(babynames)
babynames %>% filter(name == "Evelyn", sex=="F") %>%
  ggplot(aes(x=year, y=n)) + geom_line()

babynames %>% filter(name == "Mustafa", sex=="M") %>%
  ggplot(aes(x=year, y=n)) + geom_point() + geom_smooth()

babynames %>%
  filter(name %in% c("Mostafa","Mustafa"), sex=="M") %>%
  ggplot(aes(x=year, y=n, group=name)) +
  geom_point() + geom_smooth()

babynames %>%
  filter(name %in% c("Mostafa","Mustafa"), sex=="M") %>%
  ggplot(aes(x=year, y=n, color=name)) +
  geom_point() + geom_smooth()
# color also sets group and adds color + legend

# regional st pats day data, raw form
regional.raw <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-regional.csv")
str(regional.raw)
# not tidy - regions are in the variable names
# fix with pivot_longer
library(tidyr)
regional <- regional.raw %>%
  pivot_longer(!Celebration,
               names_to = "Region",
               values_to = "Percentage")
regional  # tidy data for plotting
regional %>% ggplot(aes(x = Region, y=Percentage)) +
  geom_point() + facet_wrap(vars(Celebration))

regional %>% ggplot(aes(x = Region, y=Percentage)) +
  geom_col() + facet_wrap(vars(Celebration))

assaults.raw <- read.csv("https://raw.githubusercontent.com/kjhealy/assault-deaths/master/data/oecd-assault-series-per-100k-standardized-to-2015.csv")
str(assaults.raw)
library(stringr)
assaults <- assaults.raw %>%
  pivot_longer(!Country,names_to="Year",values_to="Deaths") %>%
  mutate(Year = as.integer(str_remove(Year,"X")))
assaults %>% ggplot(aes(x = Year, y = Deaths, color=Country))+
  geom_point()
)

#--- Mar - 17_Class - ggplot basics.R ---#
# March 17, 2021
stpat <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-annual.csv")
str(stpat)
stpat$Year

library(dplyr)
library(ggplot2)

ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_point()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_area()
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green")
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line() +
  labs(title="St. Pat Spending")

# Use the iris data to make a plot of petal length vs petal width
# and color the dots by species
ggplot(iris, aes(x = Petal.Length, y = Petal.Width,
                 color = Species)) +
  geom_point()

# Plot percent celebrating x and per person spending y.
# Set the size aesthetic to total spending.
# Add a geom_label geometry and set the aesthetic label to Year
# so the dots are labeled with years.
# Use the nudge_y=0.5 attribute to geom_label to move
# the labels off the dots.
stpat %>% ggplot(aes(x = Pct.celebrating,
                     y = Per.person.spending,
                     size = Total.spending,
                     label = Year)) +
  geom_point() + geom_label(nudge_y = 0.5) +
  labs(title="St. Pat's Getting Bigger!")

# Make a histogram (with ggplot) of petal widths.
# Set the fill aesthetic to Species.
# Try adjusting the binwidth attribute of geom_histogram.
iris %>% ggplot(aes(x = Petal.Width,
                    fill = Species)) +
  geom_histogram(binwidth=0.25)



#--- Mar - 12_mine.R ---#
suppressMessages(library(dplyr))

suppressMessages(library(stringr))

movies <-tibble(fosdata::movies)

# movie with the longest title
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length))

movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length)) %>%
  select(title) %>% distinct()


# genre search
# find the best thrillers
movies %>% filter(str_detect(genres,"Thriller")) %>%
  group_by(title, genres) %>% summarize(ratingcount = n(), meanrating =mean(rating)) %>% 
  filter(ratingcount >20) %>% arrange(desc(meanrating))

# What is the movie with the longest title w/o parantheticals
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length)) %>%
  select(title) %>% distinct() %>% mutate(parens = str_count(title, "(")) # <-- error

# patterns are "regular experessions or regex
# ( is a special character in regex, must escape w/ `\\`
movies %>% mutate(title_length = str_length(title)) %>% select(title, title_length) %>%
  distinct() %>% mutate(parens = str_count(title, "\\(")) %>% filter(parens == 1) %>% 
  arrange(desc(title_length))


#--- murder.r ---#
suppressMessages(library(dplyr))
library(dplyrmurdermystery)
data("dplyr_murder_mystery")
library(tidyr)
jan_murd<-crime_scene_report %>% filter(date=="2018-01-15") %>% filter(type=="murder") %>% group_by(date)
rel_report<-jan_murd$description[3]
rel_report
wit_2<-person %>% filter(id==16371)
wit_1<-person %>% filter(address_street_name=="Northwestern Dr") %>% filter(address_number>4000 | address_number<310)
wit_1
wit_2
wit_ids<-drivers_license %>% filter(id == 118009 | id==51009 | id==490173)
wit_1<-wit_1 %>% filter(license_id==118009)
wit_interview<-interview %>% filter(person_id == 14887 | person_id==16371)


#--- Mar - 15_Class - dplyr and pivoting.R ---#
# March 15, 2021
library(stringr)

# chapter 6 #26
words
str(words)
str_detect(words,"ff")
words[797]
# use the T?F vector as an index into words[]

# regex .. ^ means beginning of word, $ means end of word.
# words that end in ff:
words[str_detect(words,"ff$")]

# 6.28

fruit
truefruits <- fruit[str_detect(fruit,"fruit$")]
str_remove(truefruits,"g")  # remove all the g's...why???

# 6.35
scot <- tibble(fosdata::scotland_births)
str(scot)
head(scot)
# data is stored in the variable names x1945, x1946, ...
# want each row to be a single count of births, with age and year
# as variables
# pivot_longer from tidyr can do this.
library(tidyr)
pivot_longer(scot)  # error - need to choose columns
pivot_longer(scot, !age)  # ! means not.. so all columns but age
# can improve by renaming the incoming columns
pivot_longer(scot, !age, names_to = "year", values_to = "births")

# use str_remove to remove the x from year
# as.integer converts a string to a number



#--- Mar - 12_Class - deplyr and stringr.R ---#
# March 12, 2021
library(dplyr)
library(stringr)
movies <- tibble(fosdata::movies)
movies
# movie with the longest title
movies %>% mutate(title_length = str_length(title))
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length))
movies %>% mutate(title_length = str_length(title)) %>%
  arrange(desc(title_length)) %>% select(title) %>% distinct()

# find the best thrillers
movies %>% filter(str_detect(genres, "Thriller")) %>%
  group_by(title, genres) %>% summarize(ratingcount = n(), meanrating = mean(rating)) %>%
  filter(ratingcount > 20) %>% arrange(desc(meanrating))

# find the longest title with no parenthetical remarks
movies %>% mutate(title_length = str_length(title)) %>%
  arrange(desc(title_length)) %>% select(title) %>% distinct() %>%
  mutate(parens = str_count(title, "("))  # <-- error

# patterns are "regular expressions" or regex
# in regex, ( is a special character.  To use it, we need to "escape" it with \\
movies %>% mutate(title_length = str_length(title)) %>%
  select(title, title_length) %>% distinct() %>%
  mutate(parens = str_count(title, "\\(")) %>%
  filter(parens == 1) %>%
  arrange(desc(title_length))


#--- Mar - 10.r ---#
suppressMessages(library(dplyr))


#movieLens data
movies <- tibble(fosdata::movies)
str(movies)
movies %>% filter(movieId==1)
movies %>% group_by(title) %>% summarize(mr = mean(rating)) %>% arrange(desc(mr))
# This resulted in a lot of movies with few ratings

# n(), when used in summarize, counts rows in groups
movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  arrange(desc(mr))

# Filter out for at least 20 ratings
movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  filter(numratings>= 20) %>% arrange(desc(mr))

# best with at least 50 reviews is Shawshank

movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  filter(numratings>= 50) %>% arrange(mr)

# worst with at least 50 is Wild Wild West

movies %>%  group_by(userId) %>% summarize(numratings=n()) %>% arrange(desc(numratings))

# User with most reviews is id:414 with 2698 ratings

movies %>%  group_by(userId) %>% summarize(numratings=n(), mr=mean(rating)) %>% arrange(mr)
# User 442 has the lowest average rating of 1.27

movies %>%  group_by(title) %>% filter(userId==442) %>% summarize(title, rating)%>% arrange(desc(rating))
# Likes Jungle Book and Tootsie
                                                                                            

#--- Mar - 08.R ---#
# March 8, 2021
suppressMessages(library(dplyr))

# dplyr has verbs (fliter, arrange, ...) that are connected by pipes
# a pipe is %>% (can type with ctrl-shift-m)
# data goes in the left of a pipe and comes out the right

?iris
str(iris)
head(iris)
iris %>% head()  # same as head(iris)
iris %>% head(n=3)  # same as head(iris,n=3)

# pipe takes left side data and makes it the first argument of right side function

# some dplyr verbs
# filter: filters rows of the data frame
iris %>% filter(Species == "setosa")
# arrange: sort rows
iris %>% arrange(Sepal.Length)
iris %>% arrange(desc(Sepal.Length))  # descending order

# combine with multiple pipes
iris %>% arrange(desc(Sepal.Length)) %>% head(n=5)

# mutate: create or change variables
iris %>% mutate(Sepal.Area = Sepal.Length * Sepal.Width)

# select: select columns (variables)
iris %>% mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  select(Sepal.Area, Species) %>% arrange(Sepal.Area) %>% head(n=5)

# what is the largest petal area for any setosa iris? 25.08


# US nuclear reactors
reactors <- read.csv("https://mathstat.slu.edu/~clair/stat/data/us-reactors.csv")
str(reactors)


