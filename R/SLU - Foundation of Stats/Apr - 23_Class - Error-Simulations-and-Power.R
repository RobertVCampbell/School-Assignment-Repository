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
