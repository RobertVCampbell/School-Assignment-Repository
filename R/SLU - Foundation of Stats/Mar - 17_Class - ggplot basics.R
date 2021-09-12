# March 17, 2021
stpat <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-annual.csv")
str(stpat)
stpat$Year

library(dplyr)
library(ggplot2)

ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_point()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_area()
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green")
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line() +
  labs(title="St. Pat Spending")

# Use the iris data to make a plot of petal length vs petal width
# and color the dots by species
ggplot(iris, aes(x = Petal.Length, y = Petal.Width,
                 color = Species)) +
  geom_point()

# Plot percent celebrating x and per person spending y.
# Set the size aesthetic to total spending.
# Add a geom_label geometry and set the aesthetic label to Year
# so the dots are labeled with years.
# Use the nudge_y=0.5 attribute to geom_label to move
# the labels off the dots.
stpat %>% ggplot(aes(x = Pct.celebrating,
                     y = Per.person.spending,
                     size = Total.spending,
                     label = Year)) +
  geom_point() + geom_label(nudge_y = 0.5) +
  labs(title="St. Pat's Getting Bigger!")

# Make a histogram (with ggplot) of petal widths.
# Set the fill aesthetic to Species.
# Try adjusting the binwidth attribute of geom_histogram.
iris %>% ggplot(aes(x = Petal.Width,
                    fill = Species)) +
  geom_histogram(binwidth=0.25)

