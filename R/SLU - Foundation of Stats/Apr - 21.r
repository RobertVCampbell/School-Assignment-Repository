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

