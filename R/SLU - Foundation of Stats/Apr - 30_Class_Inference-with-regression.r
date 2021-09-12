# April 30, 2021
library(dplyr)
library(ggplot2)
brain <- read.csv("https://mathstat.slu.edu/~clair/stat/data/brain.csv")
str(brain)
cor(brain$FSIQ, brain$MRICount)
cor(brain$MRICount, brain$FSIQ)

# want to test the null hypothesis that the correlation is 0,
# there is no (linear) relationship between FSIQ and brain size

IQ_mod <- lm(FSIQ ~ MRICount, data=brain)
IQ_mod
# FSIQhat = 5.17 + 0.00012 * MRICount
# Says that for every pixel of MRI there is increase 0.00012 of FSIQ

# H0 : correlation is 0

# slope of the regression line is r * (sy/sx), so r == 0 is the same
# as the slope of the line is 0.

# we will test H0: b = 0 (the slope)
summary(IQ_mod)
# p-value is the slope (MRICount coefficient) Pr(>|t|)
# Here p = 0.0235, significant at the 0.05 level.
# conclude there is a linear relationship between FSIQ and brain size.

# 1970 draft
load(url("https://mathstat.slu.edu/~clair/stat/data/draft-1970.rda"))
draft %>% ggplot(aes(x=DayofYear, y=DraftNo)) + geom_point()
draft_mod <- lm(DraftNo ~ DayofYear, data=draft)
cor(draft$DraftNo, draft$DayofYear)
lm(DraftNo ~ DayofYear, data=draft) %>% summary()
# do have a significant relationship between DayofYear
# and DraftNo (p = .0000126)

# check residuals
plot(draft_mod)

library(Sleuth3)
ex1111 %>% ggplot(aes(x=Soil, y=Mushroom)) + geom_point() +
  geom_smooth(method="lm")
mush_mod <- lm(Mushroom ~ Soil, data=ex1111)
summary(mush_mod)
plot(mush_mod)

