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
