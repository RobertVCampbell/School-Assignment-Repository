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


