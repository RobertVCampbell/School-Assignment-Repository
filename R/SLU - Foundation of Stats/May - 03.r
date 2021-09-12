data<-read.csv("https://mathstat.slu.edu/~clair/stat/data/sensor_D.csv")
str(data)
# speed(t+5)<- beta0+beta1*rain(t)+error

library(dplyr)
library(ggplot2)

data %>% ggplot(aes(x=precipitation, y = speed_km)) + geom_point()
boxplot(data$speed_km)
boxplot(data$precipitation)

data %>%  ggplot(aes(speed_km)) + geom_density()+
  geom_density(aes(color=precipitation > 0))
# This shows some sort of a trend when there is precipitation present vs not

mu<- 60 * 1.61 # Speed limit as the mu

# With takes a data set and applies a test
# Basically "are people doing the speed limit"
# 95% of drivers are not going 96.6, but are between 103.7805 and 104.5851
with(data, wilcox.test(speed_km, conf.int=T, mu=mu))

# 95% interval in heavy rain is [85.27697, 93.32201]
data %>% filter(precipitation>10) %>% with(wilcox.test(speed_km, conf.int=T, mu=mu))

# Build a model
# speed(t+5)<- beta0+beta1*rain(t)+error
speed_mod<- lm(speed_km ~ precipitation, data=data)
summary(speed_mod)


plot(speed_mod)

# Repeat for sensor C
# ------------ #

data<-read.csv("https://mathstat.slu.edu/~clair/stat/data/sensor_C.csv")
str(data)
# speed(t+5)<- beta0+beta1*rain(t)+error

data %>% ggplot(aes(x=precipitation, y = speed_km)) + geom_point()
boxplot(data$speed_km)
boxplot(data$precipitation)

data %>%  ggplot(aes(speed_km)) + geom_density()+
  geom_density(aes(color=precipitation > 0))
# This shows some sort of a trend when there is precipitation present vs not

mu<- 60 * 1.61 # Speed limit as the mu

# With takes a data set and applies a test
# Basically "are people doing the speed limit"
# 95% of drivers are not going 96.6, but are between 103.7805 and 104.5851
with(data, wilcox.test(speed_km, conf.int=T, mu=mu))

# 95% interval in heavy rain is [85.27697, 93.32201]
data %>% filter(precipitation>10) %>% with(wilcox.test(speed_km, conf.int=T, mu=mu))

# Build a model
# speed(t+5)<- beta0+beta1*rain(t)+error
speed_mod<- lm(speed_km ~ precipitation, data=data)
summary(speed_mod)
data[521,]


plot(speed_mod)