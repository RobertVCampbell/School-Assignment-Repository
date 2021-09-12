```{r}
suppressWarnings(suppressMessages())
```

suppressWarnings(suppressMessages({library(dplyr)
library(ggplot2)
library(babynames)
library(tidyr)
library(stringr)}
))

str(quakes)

quakes %>% ggplot(aes(x=lat, y=long, color=depth, size=mag)) + geom_point()

brakes <- fosdata::brake
str(brakes)

brakes %>% ggplot(aes(x=p1_p2)) + geom_density()
brakes %>% ggplot(aes(sample=p1_p2)) + geom_qq()+geom_qq_line()
brakes %>% ggplot(aes(sample=latency_p1)) + geom_qq() + geom_qq_line()
fosdata::austen %>% filter(novel=="Pride and Prejudice") %>% group_by(chapter) %>% 
  summarize(sentiment = mean(sentiment_score)) %>% ggplot(aes(x=sentiment, y=chapter, color=chapter)) + geom_col()
str(ISwR::juul)

ISwR::juul %>% ggplot(aes(x=age, y=igf1,color=tanner)) + geom_point() + geom_smooth()

fosdata::pres_election %>% mutate(party=factor(party)) %>%
  group_by(party, year) %>% summarize(votes=sum(candidatevotes,na.rm=TRUE)) %>%
  ggplot(aes(x=party, y=votes,fill=party)) + geom_col() + facet_wrap(vars(year))

str(Lahman::Batting)
?Lahman::Batting

Lahman::Batting %>% group_by(yearID) %>% ggplot(aes(x=yearID, y=X2B, color=yearID)) + geom_point()
Lahman::Batting %>% group_by(yearID,lgID) %>% filter(lgID == c("AL", "NL")) %>%
  ggplot(aes(x=yearID, y=X2B, color=lgID)) + geom_point() + scale_color_manual(values = c("red1","blue"))

str(babynames)

babynames %>% group_by(year, sex) %>% summarize(births = sum(n)) %>% 
  ggplot(aes(x=year, y=births, color=sex)) + geom_line()

babynames %>% group_by(year, sex) %>% summarize(u_names = n()) %>% 
  ggplot(aes(x=year, y=u_names, color=sex)) + geom_line()

babynames %>% filter(name %in% "Robert", sex=="M") %>%
  ggplot(aes(x=year,y=n)) + geom_line()

babynames %>% filter(name %in% c("Bryan", "Brian"), sex=="M") %>%
  ggplot(aes(x=year,y=n, color=name)) + geom_line()

babynames %>% filter(name %in% "Jessie") %>%
  ggplot(aes(x=year,y=n, color=sex)) + geom_line()

str(fosdata::scotland_births)
tidy_data<-fosdata::scotland_births %>% pivot_longer(!age, names_to="Year", values_to="Births")
tidy_data$Year<-str_remove(tidy_data$Year, "x")
tidy_data$Year<-as.integer(tidy_data$Year)
tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) + geom_line()

tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) + geom_line()
tidy_20<-tidy_data %>% filter(age == 20)
tidy_30<-tidy_data %>% filter(age==30)
tidy_data %>% group_by(age,Year) %>% ggplot(aes(x=Year,y=Births, group=age)) +
  geom_line() +geom_line(data=tidy_20, aes(x=Year,y=Births),color='red')+
  geom_line(data=tidy_30, aes(x=Year,y=Births),color='blue') + labs(title="Scotland Births Over Time by Mother's Age \nRed: Age 20 \tBlue: Age 30")

