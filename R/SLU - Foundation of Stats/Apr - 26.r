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
