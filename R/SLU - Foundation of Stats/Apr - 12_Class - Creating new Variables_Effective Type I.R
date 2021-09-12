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
