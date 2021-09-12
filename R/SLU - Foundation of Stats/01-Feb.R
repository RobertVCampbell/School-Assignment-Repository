# Command to send Ctrl + L to the console to clear it
cat("\014")

hot_dogs <- read.csv("https://mathstat.slu.edu/~clair/stat/data/hot-dogs.csv")
str(hot_dogs)

hot_dogs$sodium
summary(hot_dogs)

hist(hot_dogs$sodium)
hist(hot_dogs$calories)

max(hot_dogs$sodium)


plot(table(hot_dogs$sodium))

summary(hot_dogs$calories)
hot_dogs$calories > 180
hot_dogs[hot_dogs$calories > 180 , ] # returns each row containing hotogs w/ > 180 cal
hot_dogs[hot_dogs$sodium> 500, ]

cereal <- read.csv("https://mathstat.slu.edu/~clair/stat/data/cereal.csv")
str(cereal)
summary(cereal)
cereal$sugars
table(cereal$sugars)
cereal[cereal$sugars == -1, ]

plot(hot_dogs$sodium, hot_dogs$calories, col=table(hot_dogs$type))
table(hot_dogs$type) # how to get row from table?
