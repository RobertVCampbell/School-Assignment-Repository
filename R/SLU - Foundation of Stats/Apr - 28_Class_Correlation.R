# April 28, 2021
library(dplyr)
library(ggplot2)
pearson <- read.csv("http://math.slu.edu/~clair/stat/data/pearson-father-son.csv")
head(pearson)
pearson %>% ggplot(aes(x=father, y=son)) + geom_point() +
  geom_smooth(method="lm")
son_mod <- lm(son ~ father, data=pearson)
son_mod
# son^ = 33.8866 + 0.5141 * father
33.8866 + 0.5141 * 75
predict(son_mod, data.frame(father=75))
predict(son_mod, data.frame(father=60))
predict(son_mod, data.frame(father=75), interval="predict")
predict(son_mod, data.frame(father=65), interval="predict")

cor(pearson$father, pearson$son)
cor(pearson$son, pearson$father)  # order makes no diff
cor(Formaldehyde$carb, Formaldehyde$optden)

pearson %>% ggplot(aes(x=son, y=father)) + geom_point() +
  geom_smooth(method="lm")  # order makes a difference

