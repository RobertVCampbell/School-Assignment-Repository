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
