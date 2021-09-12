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