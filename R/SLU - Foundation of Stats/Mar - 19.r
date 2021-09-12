# 19 Mar
# Prepping data using dplyr for visualization

library(babynames)
library(dplyr)
head(babynames)
babynames %>% filter(name == "Evelyn", sex=="F") %>%
  ggplot(aes(x=year,y=n)) + geom_line()

babynames %>% filter(name %in% c("Mustafa", "Mostafa"), sex=="M") %>%
  ggplot(aes(x=year,y=n,group=name)) + geom_smooth() +geom_point()

babynames %>% filter(name %in% c("Robert","Bobby","Rob"), sex=="M") %>%
  ggplot(aes(x=year,y=n,color=name)) + geom_smooth() + geom_point()

babynames %>% filter(name %in% c("Rena","Reina","Rayna", "Reyna", "Raina"), sex=="F") %>%
  group_by(name) %>%  summarize(total = sum(n)) %>%  arrange(desc(total))

# Color also sets groiup
babynames %>% filter(name %in% c("Rena","Reina","Rayna", "Reyna", "Raina"), sex=="F") %>%
  ggplot(aes(x=year,y=n,color=name)) + geom_smooth() + geom_point()

# Regional st pats day data raw
regional.raw <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-regional.csv")
str(regional.raw)
# not tidy, data in var names
# fix with pivot_longer
library(tidyr)
regional.raw<- mutate(regional.raw, Celebration = ï..Celebration) %>% select(-ï..Celebration)
str(regional.raw)
regional <- regional.raw %>% pivot_longer(!Celebration, names_to="Region", values_to = "Percentage")
regional # Tidy data for plotting

regional %>% ggplot(aes(x = Region, y=Percentage, fill=Region))+ geom_col()+
    facet_wrap(vars(Celebration))


# Assaults
library(stringr)
assaults.raw <- read.csv("https://raw.githubusercontent.com/kjhealy/assault-deaths/master/data/oecd-assault-series-per-100k-standardized-to-2015.csv")
str(assaults.raw)
assaults <- assaults.raw %>% pivot_longer(!Country, names_to ="Year", values_to="Deaths") %>% 
  mutate(Year = as.integer(str_remove(Year,"X")))


assaults %>% ggplot(aes(x=Year,y=Deaths, color=Country)) + geom_point()
