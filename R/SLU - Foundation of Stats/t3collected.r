#--- May - 05_Class_Exercise-11-25-help-ANOVA.R ---#
# May 5, 2021

# hwk 11.25

x <- runif(30, 0, 10)
epsilon <- rnorm(30)  # std normal, mean 0 sd 1
y <- x^2 + epsilon
plot(x,y)
mod <- lm(y ~ x)
abline(mod)
plot(mod)

# predict at x=9
pi <- predict(mod, data.frame(x=9), interval="predict")
pi
xnew <- 9
ynew <- xnew^2 + rnorm(1)
ynew
# check the prediction
pi[2] < ynew & pi[3] > ynew

# PlantGrowth
library(dplyr)
PlantGrowth
boxplot(weight ~ group, data=PlantGrowth)
weight_mod <- lm(weight ~ group, data=PlantGrowth)
PlantGrowth %>% group_by(group) %>% summarize(mean(weight))
summary(weight_mod)

# perform ANOVA on the model
anova(weight_mod)
# p-value for ANOVA is Pr(>F), here 0.01591

# we have enough evidence to reject H0, and conclude
# that the means are not all the same.




#--- May - 03_Class_Traffic-Modeling.Rmd ---#
---
title: "Speed VS Precipitation check"
author: "Mustafa Attallah"
date: "4/19/2021"
output:
  pdf_document: default
  html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
library(ggplot2)
library(dplyr)
```

```{r}
data<- read.csv("https://mathstat.slu.edu/~clair/stat/data/sensor_D.csv")
```

# visualizing the data 
```{r}
data %>%  ggplot(aes(x = precipitation, y = speed_km))+geom_point()
```
We can hardly see any pattern! big chunk of the data is on **zero** precipitation and that is because most of the time it is not raining and the speed drop might be because of something else, like rush hours and incidents. 


# Checking the normality of the Speed:
```{r}
hist(data$precipitation)
qqnorm(data$precipitation)
```



```{r}
#plot(density(data$speed_km), col = "green", main= "Density plot for Speed at D", ylim = c(0,0.1))
#data %>% filter(precipitation == 0) %>% with(lines(density(speed_km), col = "red"))
#data %>% filter(precipitation >10) %>% with(lines(density(speed_km), col ="blue"))
data %>% ggplot(aes(x= speed_km))+geom_density(color ="black")+geom_density(aes(color = (precipitation >0)))

# what do you think is gonna happen if we increase the precipitation filter values?
```

Hmm, see the **blue** line which is related to heavy rain observations! the speed isn't really distributed well here. 
We can see that filtering the data for **zero** precipitation didn't really change how the data look like! however, we see that the plot looks thinner! as the speed is relatively try to be higher. Thus, we cannot apply t test on such skewed data. wilcoxon is a good approach to think about!



### the hypotheses
$H_o: \mu = 96.56$
$H_a: \mu \ne 96.56$

```{r}
with(data, wilcox.test(speed_km, conf.int = T,mu = 96.56))

data %>% 
  filter(precipitation > 10) %>% 
  with(wilcox.test(speed_km, conf.int = T,mu = 96.56))


```

**Decision** : There is enough evidence to **reject** the null hypothesis as **p_value** is less than **0.05**. 

Interpretation: according to wilcoxen test above, We believe that the average speed is less than 96.56 km/h when it is raining. 




In this step, a model is being built to check if there is any kind of correlation between the speed and precipitation rate.

```{r}
mod_D<- lm(speed_km~precipitation, data=data)
summary(mod_D)
ggplot(data, aes(x = precipitation, y = speed_km))+geom_point()+geom_smooth(method = "lm")
```
Some interpretations:
```{r}
plot(mod_D)
data[520,]
```




#--- Apr - 30_Class_Inference-with-regression.r ---#
# April 30, 2021
library(dplyr)
library(ggplot2)
brain <- read.csv("https://mathstat.slu.edu/~clair/stat/data/brain.csv")
str(brain)
cor(brain$FSIQ, brain$MRICount)
cor(brain$MRICount, brain$FSIQ)

# want to test the null hypothesis that the correlation is 0,
# there is no (linear) relationship between FSIQ and brain size

IQ_mod <- lm(FSIQ ~ MRICount, data=brain)
IQ_mod
# FSIQhat = 5.17 + 0.00012 * MRICount
# Says that for every pixel of MRI there is increase 0.00012 of FSIQ

# H0 : correlation is 0

# slope of the regression line is r * (sy/sx), so r == 0 is the same
# as the slope of the line is 0.

# we will test H0: b = 0 (the slope)
summary(IQ_mod)
# p-value is the slope (MRICount coefficient) Pr(>|t|)
# Here p = 0.0235, significant at the 0.05 level.
# conclude there is a linear relationship between FSIQ and brain size.

# 1970 draft
load(url("https://mathstat.slu.edu/~clair/stat/data/draft-1970.rda"))
draft %>% ggplot(aes(x=DayofYear, y=DraftNo)) + geom_point()
draft_mod <- lm(DraftNo ~ DayofYear, data=draft)
cor(draft$DraftNo, draft$DayofYear)
lm(DraftNo ~ DayofYear, data=draft) %>% summary()
# do have a significant relationship between DayofYear
# and DraftNo (p = .0000126)

# check residuals
plot(draft_mod)

library(Sleuth3)
ex1111 %>% ggplot(aes(x=Soil, y=Mushroom)) + geom_point() +
  geom_smooth(method="lm")
mush_mod <- lm(Mushroom ~ Soil, data=ex1111)
summary(mush_mod)
plot(mush_mod)



#--- Apr - 28_Class_Correlation.R ---#
# April 28, 2021
library(dplyr)
library(ggplot2)
pearson <- read.csv("http://math.slu.edu/~clair/stat/data/pearson-father-son.csv")
head(pearson)
pearson %>% ggplot(aes(x=father, y=son)) + geom_point() +
  geom_smooth(method="lm")
son_mod <- lm(son ~ father, data=pearson)
son_mod
# son^ = 33.8866 + 0.5141 * father
33.8866 + 0.5141 * 75
predict(son_mod, data.frame(father=75))
predict(son_mod, data.frame(father=60))
predict(son_mod, data.frame(father=75), interval="predict")
predict(son_mod, data.frame(father=65), interval="predict")

cor(pearson$father, pearson$son)
cor(pearson$son, pearson$father)  # order makes no diff
cor(Formaldehyde$carb, Formaldehyde$optden)

pearson %>% ggplot(aes(x=son, y=father)) + geom_point() +
  geom_smooth(method="lm")  # order makes a difference



#--- Apr - 26_Class_Linear-Regression.R ---#
# April 26, 2021
library(dplyr)
library(ggplot2)
?Formaldehyde
Formaldehyde
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point()
# guess slope of .8, intercept of .1
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.8, intercept = .1)
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.8, intercept = .05)
# For carb = .1 his line predicts an optden of 0.13:
.05 + .8 * .1
# actual value is 0.086
Formaldehyde[1,]
# the error is the epsilon in our y = a + bx + epsilon
# model.. called the "residual"
# want a line that minimizes these residual errors
# square all the errors and find the mean
Formaldehyde %>%
  mutate(optden_hat = .05 + .8 * carb,
         resid = optden - optden_hat)
Formaldehyde %>%
  mutate(optden_hat = .05 + .8 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# pick a better line, beat my error!
Formaldehyde %>%
  mutate(optden_hat = .02 + .85 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.85, intercept = .02)
Formaldehyde %>%
  mutate(optden_hat = .01 + .865 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# the line that minimizes the Mean Squared Error (MSE)
# is called the least-squares regression line.

# can find with the lm command, "linear model"
lm(optden ~ carb, data=Formaldehyde)
# best fit line has slope .876286, intercept 0.005086
Formaldehyde %>%
  mutate(optden_hat = .005086 + .876286 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# can plot regression lines with geom_smooth(method="lm")
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_smooth(method="lm")

# can use the line to make predictions
# predict optden when carb is 0.4?
.005086 + .876286 * 0.4  # by hand, with coefficients
optden_mod <- lm(optden ~ carb, data=Formaldehyde)
predict(optden_mod, newdata = data.frame(carb = 0.4))
# both methods.. 0.3556



#--- Apr - 19_Class - Wilcoxon signed-rank test.R ---#
# April 19, 2021
library(fosdata)
library(ggplot2)
library(dplyr)

masks %>% ggplot(aes(x=mask_fine)) +
  geom_histogram()
masks %>% filter(mask_fine < 1000) %>% 
  ggplot(aes(x=mask_fine)) +
  geom_histogram()

t.test(masks$mask_fine, masks$no_mask_fine, paired=TRUE)
# p = 0.18.. not significant difference

wilcox.test(masks$mask_fine, masks$no_mask_fine, paired=TRUE)
# p = 0.0002, definitely a significant difference wearing masks

# skew data can be (sometimes) improved with a log transform
masks <- masks %>%
  mutate(log_mask = log(1 + mask_fine), log_no_mask = log(1 + no_mask_fine))
masks

masks %>% ggplot(aes(x=log_mask)) +
  geom_histogram()
masks %>% ggplot(aes(x=log_no_mask)) +
  geom_histogram()
boxplot(masks$log_mask, masks$log_no_mask)

t.test(masks$log_mask, masks$log_no_mask, paired=TRUE)
# p = 0.0003
wilcox.test(masks$log_mask, masks$log_no_mask, paired=TRUE)
# p = 0.0005

# overall, conclude that mask wearing reduces fine influenza particles

# Wilcoxon signed rank test
corn <- read.csv("https://mathstat.slu.edu/~clair/stat/data/gosset_corn.csv")
corn
t.test(corn$KILN, corn$REG, paired=TRUE)
wilcox.test(corn$KILN, corn$REG, paired=TRUE)

corn$d <- corn$KILN - corn$REG
corn
corn$d
abs(corn$d)
corn$ranks <- rank(abs(corn$d))
corn
corn %>% filter(d > 0) %>% summarize(sum(ranks))


#--- Apr - 23_Class - Error-Simulations-and-Power.R ---#
# April 23, 2021
# Type I error:  H0 is true, but we reject

# both populations standard normal(0,1), 2 sample t test with n=10, alpha=0.05
pvals <- replicate(100000,{
x<-rnorm(10)
y<-rnorm(10)
 # boxplot(x,y)
t.test(x,y)$p.value
})
hist(pvals)
mean(pvals < 0.05)
mean(pvals < 0.01)

# try it with
x <- rt(10,2); y <- rt(10,2)
# and then with
x <- rexp(10); y <- rexp(10)

pvals <- replicate(100000,{
  x <- rt(10,2); y <- rt(10,2)
  t.test(x,y)$p.value
})
hist(pvals)
mean(pvals < 0.05)
mean(pvals < 0.01)

x <- rnorm(10, mean=86, sd=15)
boxplot(x)
t.test(x, mu=100)

# replicate to calculuate the power
pvals <- replicate(100000,{
  x <- rnorm(10, mean=86, sd=15)
  t.test(x, mu=100)$p.value
})
hist(pvals)
mean(pvals < 0.05)
# reject H0 about 75% of the time.. power is 0.75
# (beta is 0.25, prob of type II error)

# for a t.test with correct assumptions (normal data)
# you can use power.t.test to calcluate this
power.t.test(n=10, delta=100-86, sd=15, type="one.sample")

# Try when
x <- rnorm(20, mean=86, sd=15)
power.t.test(n=20, delta=100-86, sd=15, type="one.sample")

x <- rnorm(20, mean=96, sd=15)
power.t.test(n=20, delta=100-96, sd=15, type="one.sample")

# how large does n need to be to have a power of .95
# when x is normal(96,15)
power.t.test(delta=100-96, sd=15, power=0.95, type="one.sample")

x <- rnorm(20)
y <- rnorm(20,1)
boxplot(x,y)
t.test(x,y)$p.value
power.t.test(n=20, delta=1, sd=1, type="two.sample")
# 87% power
# model an outlier by multiplying one of the x values by 100
boxplot(x[-1],y)
pvals <- replicate(10000,{
x <- rnorm(20); x[1] <- x[1]*100;
y <- rnorm(20,1)
t.test(x,y)$p.value
})
mean(pvals < 0.05)
# power dropped to 7.5% with the outlier

pvals <- replicate(10000,{
  x <- rnorm(20); x[1] <- x[1]*100;
  y <- rnorm(20,1)
  wilcox.test(x,y)$p.value
})
mean(pvals < 0.05)
# Wilcoxon has 82% power - resistant to outliers.


#--- Apr - 26.r ---#
# April 26, beginning linear regression
library(dplyr)
library(ggplot2)
Formaldehyde
# Simple and small looking dataset with a clear relationship
# As more formaldehyde is added, the higher the density (harder to see)

Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point()

# guess slope of .8, intercept of .1

Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point() +
  geom_abline(slope=0.8, intercept=0.05)

# Adjusted from 0.1 to 0.05 because the line was above all of the data

# For carb = .1, this line predicts an optden of:
.05 + .8 *.1
# Actual optden is
Formaldehyde[1,]
# Made up line is value is too large, further along the line, the value is too small

# the error is epsilong in our y=a+bx+epsilon model
# This is also known as the residual or residual error
# we want a line that some how minimizes these residual error
# Could sum the errors, but positive and negative would cancel out
# could sum abs(), but that is not a smooth function
# Summing the squares (like var) solves that issue

form <- Formaldehyde
form %>% mutate(optden_hat = 0.05 + .8 * carb, resid = optden - optden_hat) %>% 
  summarize(mean(resid^2))
# Pick a better line

form %>% mutate(optden_hat = 0.0 + .88 * carb, resid = optden - optden_hat) %>% 
  summarize(mean(resid^2))

Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point() +
  geom_abline(slope=.88, intercept=0)


# The line that minimizes the Mean Squared Error (MSE) is called
# the least-squares regression line
# Can find this with R using the "linear model" command, lm()
# Syntax is the formula we've used in t.test
lm(optden ~ carb, data=form)

# Best fit line has slope: 0.876286, intercept: 0.005086
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point() +
  geom_abline(slope=.876286, intercept=0.005086)

form %>% mutate(optden_hat = 0.005086 + .876286 * carb, resid = optden - optden_hat) %>% 
  summarize(mean(resid^2))

# Can plot with geom_smooth as well
# this includes error from the center of the line
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point() +
  geom_smooth(method="lm")

# Can use the line to make predictions, such as
# predict optden when carb is 0.47
# Manually:
0.005086 + .876286 * 0.47
# Command is called predict(), but do use it you have to save the results of the linear model
optden_mod <-lm(optden ~ carb, data=form)
predict(optden_mod, newdata = data.frame(carb = 0.4))
# Both methods produce 0.3556

missam<- read.csv("https://mathstat.slu.edu/~clair/stat/data/miss-america.csv")
str(missam)

missam %>% ggplot(aes(x=year, y=age)) + geom_point()
table(missam$age)

ages<-lm(age ~ year, data=missam)
missam %>% ggplot(aes(x=year, y=age)) + geom_point() + geom_smooth(method="lm")
predict(ages, newdata=data.frame(year = 1925))
predict(ages, newdata=data.frame(year = 2025))
predict(ages, newdata=data.frame(year = c(1925,2025)))


#--- Apr - 21.r ---#
# April 21, 2021
corn <- read.csv('https://mathstat.slu.edu/~clair/stat/data/gosset_corn.csv')

corn
t.test(corn$KILN, corn$REG, paired=TRUE)
wilcox.test(corn$KILN, corn$REG, paired=TRUE)

corn$d<- corn$KILN - corn$REG
corn$ranks <- rank(abs(corn$d))
corn
sum(corn$ranks[corn$d >0])
# Sum of the assigned ranks follows a signed rank disctribution

x<-0:80
plot(x,dsignrank(x,11))
# the 51 appears relatively inside the bump (not far into the tail)

sum(dsignrank(51:80,11))
2*sum(dsignrank(51:80,11))
# This gives the p-value of the wilcoxon 2-tail test
# We can generate this distribution via simulation as well

# Ranks are 1:11
# If the null hypothesis is true, the ranks should be plus or minus randomly
# i.e. 50-50 per rank

ranks <- 1:11
v<-replicate(10000, {
  flips <- sample(c(TRUE, FALSE), 11, replace=TRUE)
#ranks[flips]
  sum(ranks[flips])
})
hist(v)
mean(v>=51)
2*mean(v>=51)

# Generates the wilcoxon signed rank test p-value

#---- End of Wilcoxon signed rank intro ----#

# Wilcoxon rank sum test tests independent samples
# One data variable xi and two-valued group variable
# rank all the xi from smallest to largest 1:n
# Compute the test statistic W, the sum all ranks of the data in group 1

cloud<- Sleuth3::case0301
str(cloud)
hist(cloud$Rainfall)
# not normal, t.test is inappropriate
t.test(Rainfall ~ Treatment, data=cloud)
wilcox.test(Rainfall ~ Treatment, data=cloud)
cloud$log_rain <- log(cloud$Rainfall)

t.test(log_rain ~ Treatment, data=cloud)
wilcox.test(log_rain ~ Treatment, data=cloud)

# Wilcoxon p-test ends up the same with and without the log because the rankings
# do not change.
# The t.test normalized through a log is closely in line with the Wilcoxon test

#---- End of Wilcoxon Rank Sum ----#

# If the null hypothesis is true, but your sample rejects the null, Type I Error occurs
# If the null is false, but your sample fails to reject the null, Type II Error occurs



#--- hw2_scratch.r ---#
mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
  ((x[1] == (2 * x[2])) || (x[2] == (2* x[1])))
  }))

# can also pretty easily use a 6x6 sample space (in onenote)
# --------- #
mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
  abs(x[1] - x[2]) == 0
}))

mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
abs(x[1] - x[2]) == 4
}))

# --------- #
mm<- c("y","r","o","br","g","bl")
pb<-c(.14,.13,.2,.12,.2,.21)
MM <- sample(mm, 100000, prob=pb, replace=TRUE)
mean(MM!="g")

MM <- replicate(10000, {x<-sample(mm, 4, prob=pb, replace=TRUE);
  sum(x=="bl") > 1
})
mean(MM)

mean(replicate(10000, {x<-sample(mm, 6, prob=pb, replace=TRUE);
  ((sum(x=="y") == 1) & (sum(x=="r") == 1) & (sum(x=="o") == 1) &
    (sum(x=="br") == 1) & (sum(x=="g") == 1) & (sum(x=="bl") == 1)) 
}) )

# --------- #

mean(replicate(10000, {x<-sample(mm, 30, prob=pb, replace=TRUE);
  ( (sum(x=="bl") > 8) & (sum(x=="o") > 5)) 
}) )

# --------- #

type<- c("o","a","b","ab")
pb<-c(.45,.40,.11,.04)

mean(replicate(10000, {x<-sample(type,2,prob=pb,replace=TRUE);
  x[1] == x[2]
})) * 16
3/8

# --------- #
x<-sample(1:6, 5, replace=TRUE)
sum(x)
14 < sum(x) & sum(x) < 21

mean(replicate(10000, {x<-sample(1:6, 5, replace=TRUE)
  ((14 < sum(x)) & (sum(x) < 21))
}))

# --------- #

mean(replicate(10000, {x<-sample(1:6, 20, replace=TRUE)
  y<-cumsum(x)
  sum(y == 20)
}))

# --------- #

y <- replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
sum(x)
})

hist(y, breaks=12)

y <- replicate(10000, {x<-sample(c(2,6), replace=TRUE)
  x + 5
})

hist(y)

y <- replicate(10000, {x<-sample(c(1,2,2,3,3,4), replace=TRUE)
  z<-sample(c(1,3,4,5,6,8), replace=TRUE)
  x + z
})

hist(y, breaks=12)

# --------- #
mean(replicate(10000, {x<-sample(1:365, 200, replace=TRUE)
  sum(x==1) > 1
}))
# --------- #
s<-fosdata::scrabble

mean(replicate(10000, {x<-sample(s$piece,7,replace=FALSE)
  ((sum(x=='A')==0)&(sum(x=='E')==0)&(sum(x=='I')==0)&(sum(x=='O')==0)&(sum(x=='U')==0))
}))

# --------- #
p<-seq(0,1,0.1)
y<- p^3 - 2*(p^2) + p
plot(p, y)


flip<-c("v", "c")
pb<-c(.45,(1-.45))

mean(replicate(10000, {x<-sample(flip,2, prob=pb,replace=TRUE)
  (x[1]==x[2])
}))

# --------- #

people <- sample(0:1, 100000, prob=c(.99,.01), replace=TRUE)
test <- ifelse(people, 1, sample(0:1, 100000, prob=c(.99,.01), replace=TRUE))
1-(sum(test & !people)/sum(test))


# --------- #
# P(B|A) = P(A|B) * (P(B)/P(A))
# If there is a second tree, there will always be a first tree
  1 * (.85/.91)


# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #


#--- May - 16_Final_Notes.R ---#
# You can use R and any written or internet resources. Ask Dr. Clair questions, 
# no one else.
# Template distributed, -10pts if not knit
# Include code, results, and clear answer. Linear regression, rewrite as an equation


# Sidenote added after the overview:
#   there are 4 possible questions between Probability and RV, so there are either
#   are 2 prob 2 rv, or 1 prob 2 rv


# Probability, 1+ questions
# Experiments, probabilities, replications, 

# Random Variables 2+ questions
# Discrete v continues
# Do ocmputations and know the main rv classes
# Simulate with the known rv classes (rnorm, runif, rbinom, etc)
# Note this is all exam one. Table and RV info is in Onenote
# Dnorm plots the pdf/pmf
# pnorm plots the cdf/cmf

# Data and visualization 3 questions
# dpylr, ggplot. COmfortable with group_by %>% summarize()

# Hypothesis testing 3 questsions
# State results clearly "There is a significant different in [thing tested] with
#   P=.... "
# IF PVALUE IS LESS THAN .05 YOU HAVE A SIGNIFICANT DIFFERENCE FOR THIS TEST AND
# YOU REJECT THE NULL HYPOTHESIS
# One, paired 2sample, two independent sample t.test
# One: Sample space plus some known to test against (e.g. a known mu)
# Paired: Basically, you'll have one individual tested in two environments (x1,x2)
# Two independent: two separate variables and grouping by one (x1 ~ x2)
# Confidence intervale on the mean

# Test assumptions 2 Questions
# Ttest:
#   Normal or n is large
#   No/few outliers
# If not meeting ttest assumptions (often skewed or outliers):
#   Log transforms
#   Wilcoxon rank based tests (focusing on median)
# Type I (null true) and II (null false) errors
# Power and sample size (power.t.test)
#
# Probability of Type II error is 1 - Power
#  Power is the probability of finding something that is there (hypothesis is true)

# Linear regression 2 questions
# Create scatter plot + regression line (use ggplot and geom_smooth)
# find equation of linear regression line
# use regression models to make predictions (use predict or by hand)
# Make and interpret residual plots to check regression assumptions (plot(model))

# ANOVA 1 question
# Used when explanatory x variable is categorical
# Run anoca(lm(y~x,data=dataset)) and interpret results
# Categoric data will not need conversion from numeric to factor

# Reviewing the random variables
# What is the underlying process?
#   Bernoulli: Repeated binary-state trials
#     Generates binomial and geometric
#   Poisson: Waiting for an event to happen:
#     Generates poisson and exponential
#   If not really either, it's probably normal
#   Uniform doesn't really show up in the real world
#     It's really just Normal with strict limits
#
# Bernoulli: Binomial is how many successes, Geom is how many tries to get a succes
# Poisoson: Poisson is how many events, exponential is time until the first event
# Key think to watch out for discrete v continuous
#   Binomial, geometric, Poisson are discrete (counting something)
#   Normal, uniform, exponential are continuous (measuring something)
# Uniform /can/ be discrete (e.g. a die roll), though you'd model that with sample
#   Sample is a discrete uniform distribution unless otherwise specified.

# 3. on practice exam
#   given a pdf, find the constant and then sketch the cdf
#   set the integral of the function to 1 and solve to find c
# Graph pdf, for cdf find the y=0, y=1 asymptotes and then connect with some function
#   This example was done by hand and didn't require specific code to solve, mostly
#     conceptual

# 4. What is the probability of the above function x > 0; By observation .5
#    Probability x < .5, Integrate from -1 to .5

# Bechdel data is slightly changed since the review test was written.

# 15. Make a histogram or boxplot of the budget variable. Fancy woulod be qqplot


# Computing type I error rate
# You must know your population

# assume population is t w/ 3df
# what's the type I error rate for a t.test of mu=0 with n=10

# Generate a sample
rt(10,df=3)

# test it against mu=0, when run repeatedly it may generate p-vale < 0.05
t.test(rt(10,df=3), mu=0)

# Test against p-value, replicate a large amount of time, take the mean
mean(replicate(10000, t.test(rt(10,df=3), mu=0)$p.value < .05))




# Plot PDF of a normal with mean 10 sd 4
x <- seq(-10,30,.1)
plot(x, dnorm(x,mean=10,sd=4), type='l')

#  Plotting CDF of normal
plot(x, pnorm(x,mean=10,sd=4), type='l')



# Find x which is the 75th percentile with pnorm and guessing
pnorm(15, 10, 4) # keep changing the first number and generating percentiles

qnorm(.75, 10, 4) # First number is the perctile you're finding.


# Poisson with rate 7 PDF (we expect 7) Discrete
x <- 0:20
plot(x, dpois(x, lambda=7))

# CMF (though we rarely look at CMF for discrete)
plot(x, dpois(x, lambda=7))




#--- homework10_scratch.r ---#
library(dplyr)
library(ggplot2)


str(faithful)

faith_mod<-lm(waiting ~ eruptions, data=faithful)

faithful %>%  ggplot(aes(x=eruptions, y=waiting)) + geom_point() + geom_smooth(method="lm")

predict(faith_mod, newdata = data.frame(eruptions=4.3))

# -------- #

j <- ISwR::juul
j<-j %>% filter(tanner==5, age<20)
model <- lm(igf1 ~ age, data=j)
model

# -------- #

# correlation coefficient is the ratio of the lm to a 1sdy / 1sdx line and can be between -1 and 1

# --------- #

d<-datasauRus::datasaurus_dozen
d %>% group_by(dataset) %>% summarize(correlation = cor(x, y, use="complete.obs"),
        xbar=mean(x), sx = (sd(x)/sqrt(142)), ybar=mean(y), sy=(sd(y)/sqrt(142)))

d %>% ggplot(aes(x=x, y=y, color=dataset)) + geom_point() + facet_wrap(vars(dataset))

# ------- #
# 10 is f(b) = sum over i of (yi-B-xi). Take derivative of B with respect to B
#  -2 sum (yi-B-xi) = -2(sum(yi-xi) - n*B) = -2(ybar - xbar -nB) = 0
# ybar-xbar = nB, (ybar-xbar)/n = B


# --------- #

a <- carData::Anscombe
cor(a$education, a$young)

model <- lm(education ~ young, data=a)
summary(model)$coefficients

str(a)
row.names(a)

a<-a %>% filter(rownames(.)!="AK")
model <- lm(education ~ young, data=a)
summary(model)$coefficients

plot(model)

# ----------- #
c <- fosdata::cern
c<-c %>% filter(platform=="Twitter") %>% head()
model<-lm(likes ~ shares, data=c)
plot(model)

l_model<-lm(log(likes) ~ shares, data=c)
plot(l_model)

# ----------- # 

crit <- fosdata::crit_period
crit <- crit %>% filter(locale=="North America")
crit %>% ggplot(aes(x=aoa, y=gjt)) + geom_point()


model <- lm(gjt ~ aoa, data=crit)
model
crit %>% ggplot(aes(x=aoa, y=gjt)) + geom_point() + geom_smooth(method="lm")

# ------------ #
library(quantreg)
data(engel)
e<-engel
e %>%  ggplot(aes(x=income,y=foodexp)) + geom_point() + geom_smooth(method="lm")

model<-lm(foodexp ~ income, data=e)
plot(model)

# ------------ #

pen <- palmerpenguins::penguins
pen<-pen %>% filter(species=="Gentoo")
model<-lm(body_mass_g ~ flipper_length_mm, data=pen)
summary(model)$coefficients

# ----------- #

hot <- fosdata::hot_dogs
hot %>% ggplot(aes(x=calories,y=sodium, color=type)) + geom_point()

hot<-hot %>% filter(type!="Poultry")
model<-lm(sodium ~ calories, data=hot)
model

predict(model, newdata=data.frame(calories=140))

# ----------- #

bat<-Lahman::Batting
dat<-bat %>% group_by(yearID) %>% summarize(HR=sum(HR), R=sum(R))
dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point()

dat<-dat %>% filter(yearID>1969)
dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point()

model<-lm(R ~ HR, data=dat)
model
summary(model)

dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point() + geom_smooth(method="lm")

predict(model, newdata=data.frame(HR=4000))


# -------- #

e <- Sleuth2::ex0728
e %>% ggplot(aes(x=Stories, y=Height, color=Year)) + geom_point() + geom_smooth(method="lm")

# -------- #
e <- Sleuth3::ex0823
e %>% ggplot(aes(x=Mortality, y=Wine, color=Country)) + geom_point()
e %>% ggplot(aes(x=log(Wine), y=Mortality)) + geom_point()

model <- lm(Mortality ~ log(Wine), data=e)
summary(model)$coefficients
cor(log(e$Wine), e$Mortality)

#------------#

x <- runif(30, 0, 10)
epsilon <- rnorm(30)  # std normal, mean 0 sd 1
y <- x^2 + epsilon
plot(x,y)
mod <- lm(y ~ x)

# predict at x=5
pi <- predict(mod, data.frame(x=5), interval="predict")
rate<-replicate(10000000, {xnew <- 5;
ynew <- xnew^2 + rnorm(1);
# check the prediction
(pi[2] < ynew & pi[3] > ynew)})
mean(rate)

# predict at x=10
pi <- predict(mod, data.frame(x=10), interval="predict")
rate<-replicate(10000000, {xnew <- 10;
ynew <- xnew^2 + rnorm(1);
# check the prediction
(pi[2] < ynew & pi[3] > ynew)})
mean(rate)

# ----------------- #
x = seq(0,10,length.out = 21)

test<- replicate(10000, {epsilon <- rnorm(21, sd=3);
y = 1 + 2*x + epsilon;
model<-lm(y~x);
y[x==5.5] - predict(model, newdata=data.frame(x=5.5))})

sd(test)

test<- replicate(10000, {epsilon <- rnorm(21, sd=3);
y = 1 + 2*x + epsilon;
model<-lm(y~x);
y[x==10] - predict(model, newdata=data.frame(x=10))})

sd(test)


#--- homework11_scratch.r ---#
library(dplyr)
library(ggplot2)

pen<-palmerpenguins::penguins
boxplot(bill_depth_mm ~ species, data=pen)

depth_mod<-lm(bill_depth_mm ~ species, data=pen)
anova(depth_mod)
# -------------- #

weight<-fosdata::weight_estimate
str(weight)
boxplot(mean300 ~ age, data=weight)

anova(lm(mean300 ~ age, data=fosdata::weight_estimate))

# -------------- #
judge_perc <- Sleuth3::case0502
boxplot(Percent ~ Judge, data=judge_perc)
judge_perc %>% filter(Judge != "Spock's") %>% lm(Percent ~ Judge, data=.) %>% anova()

judge_perc %>% mutate(Spock = (Judge=="Spock's")) %>%
  t.test(Percent ~ Spock, data=.) 


head(judge_perc)
table(judge_perc$Spock)

# ------------ #

str(chickwts)
boxplot(weight ~ feed, data=chickwts)
table(chickwts$feed)

# ----------- #
str(morley)
anova(lm(Speed ~ Expt, data=morley))
boxplot(Speed ~ Expt, data=morley)

# --------------- #


flint_pb <- fosdata::flint
boxplot(log(Pb1) ~ Ward, data=flint_pb)
flint_pb<- flint_pb %>% filter(Ward != 0)
boxplot(log(Pb1) ~ Ward, data=flint_pb)



str(flint_pb)

#--- May - 07.r ---#
# May 7, ANOVA


suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(ggplot2)))

sleep <- ggplot2::msleep
str(sleep)

sleep %>% ggplot(aes(x=bodywt)) + geom_histogram()
sleep %>% ggplot(aes(sample=bodywt)) + geom_qq()

boxplot(sleep$bodywt)
boxplot(log(sleep$bodywt))
# Log looks relatively normal

sleep %>% ggplot(aes(x=bodywt)) + geom_boxplot() + facet_grid(vars(vore))

sleep %>% ggplot(aes(x=log(bodywt))) + geom_boxplot() + facet_grid(vars(vore))
boxplot(log(bodywt) ~ vore, data=sleep)

logwt_mod <- lm(log(bodywt) ~ vore, data=sleep)
summary(logwt_mod)
anova(logwt_mod)
# find a significant difference in mean log(bodywt)
# among the different diets (p = 0.03355)
#    SIDENOTE: IRL nobody actually reports p-values that far out, they'd usually
#    the above as 0.03 or /maybe/ 0.034

# What is ANOVA?
# Assumptions:
#   Normally distributed, variances of the groups are equal,
#   and observations are independent
# Check 1 and two by plotting by checking residuals:

lm(log(bodywt) ~ vore, data=sleep) %>%  plot()
# graph one looks decent, with the red line close to a straight
# line (data is plotted by subtracting mean)

# Graph 2 does a normal qq plot, since it was logged this plot looks really good

# Graph 3 shows variance, if you see a trend the variance are probably unequal
#   This data has minor changes between the values, but overall is pretty close

# Graph 4 for outliers, residuals vs outliers for leverage
# This data is close enough to ideal that you can barely see the cooks line

sleep %>% ggplot(aes(x=sleep_total)) + geom_histogram()
# Is pretty normal

boxplot(sleep$sleep_total)
boxplot(sleep_total ~ vore, data=sleep)
# variance by category is pretty different

sleep_mod <- lm(sleep_total ~ vore, data=sleep)
summary(sleep_mod)
anova(sleep_mod)
# p-value shows that it is not normal p: 0.09143

lm(sleep_total ~ vore, data=sleep) %>%  plot()
# Graph 1 looks fine
# Graph 2 looks somewhat normal, though it does skew at the edges
# Graph 3 shows that the variances are pretty different
# Graph 4 shows the outliers are not a problem


# oneway.test is an djusted ANOVA that does not assume equal variances
# WARNING: When ANOVA fails, it fails with a /lower/ p-value, showing significance
#     when there is none.


# Pairwise.t.test can perform all the t-tests with correction for pvalues

pairwise.t.test(log(sleep$bodywt), sleep$vore)
# shows no specific pair shows significant difference despite the overall data 
# showing that diet on the whole /does/ effect weight

#--- homework9_scratch.r ---#
v<-0:700
plot(v,dsignrank(v,40))
2*sum(dsignrank(601:1000,40))
# the 51 appears relatively inside the bump (not far into the tail)

sum(dsignrank(51:80,11))
2*sum(dsignrank(51:80,11))
# This gives the p-value of the wilcoxon 2-tail test
# We can generate this distribution via simulation as well

x <- c(-1,0,2,8)
mu <- 3
xdif <- x-mu
xrank<-rank(abs(xdif))
sum(xrank[xdif > 0])
v<-0:10
plot(v,dsignrank(v,4))
2*(sum(dsignrank(0:4, 4)))

wilcox.test(x, mu=mu)

#-----------#
weight<- fosdata::weight_estimate$mean200
boxplot(weight)

#---------#
sparrow<-Sleuth3::ex0221
boxplot(sparrow$Humerus[sparrow$Status == "Perished"])
boxplot(sparrow$Humerus[sparrow$Status == "Survived"])

wilcox.test(Humerus ~ Status, data=sparrow)

#-----------#
flower<- Sleuth3::ex0428
wilcox.test(flower$Cross, flower$Self)

table(flower$Cross)
table(flower$Self)
boxplot(flower$Cross)
boxplot(flower$Self)

#----------#

malaria <- ISwR::malaria
wilcox.test(ab ~ mal, data=malaria)

hist(malaria$ab[malaria$mal == 0])
hist(malaria$ab[malaria$mal == 1])

#--------#
test<-replicate(10000,{x<-rnorm(100,0.1,1); t.test(x, mu=0)$p.value})
mean(test<0.05)
test<-replicate(10000,{x<-rnorm(100,0.1,1); wilcox.test(x, mu=0)$p.value})
mean(test<0.05)

test<-replicate(10000,{x<-rnorm(1000,0.1,1); t.test(x, mu=0)$p.value})
mean(test<0.05)
test<-replicate(10000,{x<-rnorm(1000,0.1,1); wilcox.test(x, mu=0)$p.value})
mean(test<0.05)

#--------#
x<-rt(20,df=3)

pvals <- replicate(10000, {
  x <- rt(20, df=86)
  t.test(x, mu=1)$p.value
})
power<- mean(pvals < 0.05)
1 - power

pvals <- replicate(10000, {
  x <- rt(20, df=86)
  wilcox.test(x, mu=1)$p.value
})
power<- mean(pvals < 0.05)
1 - power

#--- May - 03.r ---#
data<-read.csv("https://mathstat.slu.edu/~clair/stat/data/sensor_D.csv")
str(data)
# speed(t+5)<- beta0+beta1*rain(t)+error

library(dplyr)
library(ggplot2)

data %>% ggplot(aes(x=precipitation, y = speed_km)) + geom_point()
boxplot(data$speed_km)
boxplot(data$precipitation)

data %>%  ggplot(aes(speed_km)) + geom_density()+
  geom_density(aes(color=precipitation > 0))
# This shows some sort of a trend when there is precipitation present vs not

mu<- 60 * 1.61 # Speed limit as the mu

# With takes a data set and applies a test
# Basically "are people doing the speed limit"
# 95% of drivers are not going 96.6, but are between 103.7805 and 104.5851
with(data, wilcox.test(speed_km, conf.int=T, mu=mu))

# 95% interval in heavy rain is [85.27697, 93.32201]
data %>% filter(precipitation>10) %>% with(wilcox.test(speed_km, conf.int=T, mu=mu))

# Build a model
# speed(t+5)<- beta0+beta1*rain(t)+error
speed_mod<- lm(speed_km ~ precipitation, data=data)
summary(speed_mod)


plot(speed_mod)

# Repeat for sensor C
# ------------ #

data<-read.csv("https://mathstat.slu.edu/~clair/stat/data/sensor_C.csv")
str(data)
# speed(t+5)<- beta0+beta1*rain(t)+error

data %>% ggplot(aes(x=precipitation, y = speed_km)) + geom_point()
boxplot(data$speed_km)
boxplot(data$precipitation)

data %>%  ggplot(aes(speed_km)) + geom_density()+
  geom_density(aes(color=precipitation > 0))
# This shows some sort of a trend when there is precipitation present vs not

mu<- 60 * 1.61 # Speed limit as the mu

# With takes a data set and applies a test
# Basically "are people doing the speed limit"
# 95% of drivers are not going 96.6, but are between 103.7805 and 104.5851
with(data, wilcox.test(speed_km, conf.int=T, mu=mu))

# 95% interval in heavy rain is [85.27697, 93.32201]
data %>% filter(precipitation>10) %>% with(wilcox.test(speed_km, conf.int=T, mu=mu))

# Build a model
# speed(t+5)<- beta0+beta1*rain(t)+error
speed_mod<- lm(speed_km ~ precipitation, data=data)
summary(speed_mod)
data[521,]


plot(speed_mod)

#--- quiz3_scratch.r ---#
test<- data.frame(time=c(53, 58, 69, 78, 87, 140), swear<- c(0, 0, 1, 1, 1, 1))
wilcox.test(time~swear, data=test)


#-------------#
# n=20, mu=25,sd=7

power.t.test(n=20, delta=20-25, sd=7, type="one.sample")

power.t.test(delta=20-25, sd=7, power=0.95, type="one.sample")

#---------#

acorns <- read.csv("https://mathstat.slu.edu/~clair/stat/data/acorns.csv")

str(acorns)

range_mod <-lm(Range ~ Acorn_size, data=acorns)
range_mod
acorns %>% ggplot(aes(x=Acorn_size, y=Range)) + geom_point() +
  geom_abline(slope=1218, intercept=7399)

# Can plot with geom_smooth as well
# this includes error from the center of the line
# Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + geom_point() +
#  geom_smooth(method="lm")

predict(range_mod, newdata = data.frame(Acorn_size=3.6))
summary(range_mod)


#--- exam2_scratch.r ---#
library(ggplot2)
library(dplyr)
library(stringr)

Arb<-HistData::Arbuthnot
Arb %>% group_by(Year) %>% summarize(DeathRatio = Plague/Mortality) %>% filter(DeathRatio >= .20)

Arb %>% ggplot(aes(x=Year,y=Mortality,size=Plague, color=Plague)) + geom_point() + 
  scale_color_gradient(low="black", high="red")


bech <- fosdata::bechdel
fosdata::bechdel %>% mutate(profit=(intgross_2013 - budget_2013)) %>%
  group_by(title) %>% summarize(profit, binary) %>% arrange(profit) %>%
  head(15) %>% filter(binary=="PASS")

fosdata::bechdel %>% mutate(profit=(intgross_2013 - budget_2013)) %>%
  group_by(year) %>% summarize(TotalProfit=sum(profit,na.rm=TRUE)) %>% 
  ggplot(aes(x=year,y=TotalProfit)) + geom_line()


fosdata::bechdel %>% filter(str_detect(title, "Girl")) %>% group_by(binary) %>%
  summarize(ratio = n()/15)

fosdata::bechdel %>% filter(str_detect(title, "Boy")) %>% group_by(binary) %>%
  summarize(ratio = n()/7)

x<-seq(-5,5,.1)
qnorm(.75)
1-pnorm(4)

1-pnorm(4)
1-pt(4,df=2)
(1-pnorm(4))/(1-pt(4,df=2))


?faithful
shoes <- read.csv("http://mathstat.slu.edu/~clair/stat/data/shoes.csv")

?shoes
str(shoes)

male<-shoes %>% filter(Sex=="M")
t.test(male$Speed.own)

t.test(Speed.own ~ Sex, data=shoes)

pop <- faithful$waiting
sim <- replicate(10000,{
  x <- sample(pop,2,replace=TRUE); mean(x)
})
plot(density(sim))
sim <- replicate(10000,{
  x <- sample(pop,5,replace=TRUE); mean(x)
})
plot(density(sim))
sim <- replicate(10000,{
  x <- sample(pop,15,replace=TRUE); mean(x)
})
plot(density(sim))

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

