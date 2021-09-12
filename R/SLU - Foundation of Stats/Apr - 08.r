# April 8, 2021
library(dplyr)
library(ggplot2)
library(fosdata)
str(normtemp)

boxplot(normtemp$temp)

normtemp<- normtemp %>% mutate(gender = factor(gender, labels=c("M","F")))
normtemp %>% ggplot(aes(x=gender,y=temp)) + geom_boxplot()

normtemp %>%  ggplot(aes(x=temp)) + geom_histogram(bins=20) + facet_grid(vars(gender))

normtemp %>% ggplot(aes(sample=temp,color=gender)) + geom_qq() +geom_qq_line()

# Read ~ "as depending on"
t.test(temp ~ gender, data=normtemp)
# There is a significant difference in temp between M & F gendered people
# p = 0.02394

# same syntax works with boxplot
boxplot(temp ~ gender, data=normtemp)

# is there a difference in heartrate
boxplot(bpm ~ gender, data=normtemp)
t.test(bpm ~ gender, data=normtemp)



bal<-read.csv("https://mathstat.slu.edu/~clair/stat/data/balance.csv")
str(bal)
table(bal$forward.back)

bal %>% ggplot(aes(x=side.side,y=forward.backward, color=age.group)) + geom_point()

bal <- bal %>% filter(side.side <30, forward.backward <40) 

boxplot(side.side ~ age.group, data=bal)
boxplot(forward.backward ~ age.group, data=bal)



t.test(side.side ~ age.group, data=bal)
t.test(forward.backward ~ age.group, data=bal)
