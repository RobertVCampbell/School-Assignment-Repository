# March 22, 2021
# data types
?mtcars
str(mtcars)

library(ggplot2)
library(dplyr)
mtcars %>% ggplot(aes(x=am, y=hp)) +
  geom_point()

# factors are variables that can take one
# of a few specified levels
# factor() makes a variable into a factor.
mtcars %>% mutate(am = factor(am)) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_point()

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_point()

mtcars %>% ggplot(aes(x=am, y=hp)) +
  geom_boxplot()  # bad, am is not continuous

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_boxplot() + geom_point(color="blue")

mtcars %>%
  mutate(am = factor(am, labels=c("Auto","Man"))) %>%
  ggplot(aes(x=am, y=hp)) +
  geom_violin() + geom_point(color="blue")

# qq plots
library(fosdata)
str(brake)
brake %>% ggplot(aes(x=confidence)) + geom_histogram(bins=15)

# check against a normal (or other) distribution with qq plot
brake %>% ggplot(aes(sample=confidence)) + geom_qq() + geom_qq_line()
sort(brake$confidence)

brake %>% ggplot(aes(sample=age)) + geom_qq() + geom_qq_line()

brake %>% ggplot(aes(sample=latency_p3)) + geom_qq() + geom_qq_line()
brake %>% ggplot(aes(x=latency_p3)) + geom_histogram(bins=15)

# Ch 7 #20
# want data that looks like:
# Year Sex Numberofname
# 1880 M 50
# 1880 F 75
# 1881 M 57
# 1881 F 82
# ....
library(babynames)
babynames %>% group_by(year, sex) %>% summarize(n())
# n() counts rows in the group. Each row is a name.

# For complicated plots, you can save the plot in
# a variable and add to it.

maryplot <- babynames %>% filter(name == "Mary", sex == "F") %>%
  ggplot(aes(x=year, y=n)) + geom_line()
maryplot <- maryplot + labs(title="The story of Mary.")
print(maryplot)
print(maryplot + theme_bw())

# Mustafa will have office hours 12-1 Wednesday in
# this room, or ping him on discord.

