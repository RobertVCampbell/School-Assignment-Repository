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


