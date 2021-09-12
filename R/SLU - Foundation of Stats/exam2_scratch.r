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