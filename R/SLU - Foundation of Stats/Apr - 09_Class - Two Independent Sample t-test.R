# April 9, 2021
library(dplyr)
library(ggplot2)
library(fosdata)

str(normtemp)

boxplot(normtemp$temp)
normtemp <- normtemp %>%
  mutate(gender = factor(gender, labels=c("M","F")))
normtemp %>% ggplot(aes(x=gender, y=temp))+
  geom_boxplot()
normtemp %>% ggplot(aes(x=temp))+
  geom_histogram(bins=20) + facet_grid(vars(gender))
normtemp %>% ggplot(aes(sample = temp, color=gender)) +
  geom_qq() + geom_qq_line()

# Read ~ (tilde) "as depending on"
t.test(temp ~ gender, data=normtemp)
# there is a significant difference in temp
# between M & F gender (p= 0.02394)

# same syntax works with boxplot
boxplot(temp ~ gender, data=normtemp)

# Is there a difference in heart rate between
# male and female?
t.test(bpm ~ gender, data=normtemp)
# no significant difference (p = 0.5287)


