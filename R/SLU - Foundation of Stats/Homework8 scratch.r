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