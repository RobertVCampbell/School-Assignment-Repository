# March 19, 2021
library(fosdata)
str(pres_election)
head(pres_election)
# going to need to group by Year and Party to count the sum of votes.

# babynames - install if you need to
library(babynames)
?babynames
head(babynames)
babynames %>% filter(name == "Evelyn", sex=="F") %>%
  ggplot(aes(x=year, y=n)) + geom_line()

babynames %>% filter(name == "Mustafa", sex=="M") %>%
  ggplot(aes(x=year, y=n)) + geom_point() + geom_smooth()

babynames %>%
  filter(name %in% c("Mostafa","Mustafa"), sex=="M") %>%
  ggplot(aes(x=year, y=n, group=name)) +
  geom_point() + geom_smooth()

babynames %>%
  filter(name %in% c("Mostafa","Mustafa"), sex=="M") %>%
  ggplot(aes(x=year, y=n, color=name)) +
  geom_point() + geom_smooth()
# color also sets group and adds color + legend

# regional st pats day data, raw form
regional.raw <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-regional.csv")
str(regional.raw)
# not tidy - regions are in the variable names
# fix with pivot_longer
library(tidyr)
regional <- regional.raw %>%
  pivot_longer(!Celebration,
               names_to = "Region",
               values_to = "Percentage")
regional  # tidy data for plotting
regional %>% ggplot(aes(x = Region, y=Percentage)) +
  geom_point() + facet_wrap(vars(Celebration))

regional %>% ggplot(aes(x = Region, y=Percentage)) +
  geom_col() + facet_wrap(vars(Celebration))

assaults.raw <- read.csv("https://raw.githubusercontent.com/kjhealy/assault-deaths/master/data/oecd-assault-series-per-100k-standardized-to-2015.csv")
str(assaults.raw)
library(stringr)
assaults <- assaults.raw %>%
  pivot_longer(!Country,names_to="Year",values_to="Deaths") %>%
  mutate(Year = as.integer(str_remove(Year,"X")))
assaults %>% ggplot(aes(x = Year, y = Deaths, color=Country))+
  geom_point()
)