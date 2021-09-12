# Mar 17
stpat <- read.csv("https://mathstat.slu.edu/~clair/stat/data/stpat-annual.csv")
str(stpat)

suppressMessages(library(dplyr))
library(ggplot2)

# simple plot total spending over time with different geometry
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_point()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_line()
ggplot(stpat, aes(x = Year, y = Total.spending)) + geom_area()

ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green")

# note: aesthetic maps data to different things
#       attributes are declarations (e.g. fill = "green" is declaring an attribute)


# You can keep adding more geometries
ggplot(stpat, aes(x = Year, y = Total.spending)) +
  geom_area(fill="green") + geom_point() + geom_line() +
  labs(title="St. Pat Spending")


ggplot(stpat, aes(x = Year, y = Pct.celebrating)) +
  geom_point() + geom_line(color="green") + labs(title="St. Pat Celebrating")


# Use the iris data to make a plot of petal length vs petal width and color the plots by species
ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Species)) + geom_point()


# Plot percent celebrating x and per person spending y.
ggplot(stpat, aes(x = Pct.celebrating, y = Per.person.spending)) + geom_point()
# Set the size aesthetic to total spending
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending)) + geom_point()
# Add a geom_lable geometry and set the aesthetic label to year so the dots are labeled with years
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending, label=Year)) +
  geom_point() + geom_label()
# Use the nudge_y=0.5 attribute to geom_lable to move the labels off the dots
ggplot(stpat, aes(x=Pct.celebrating, y=Per.person.spending, size=Total.spending, label=Year)) +
  geom_point() + geom_label(nudge_y=0.5)


# Make a histogram (with ggplot) of petal widths.
ggplot(iris, aes(x=Petal.Width)) + geom_histogram()
# Set the fill aesthetic to species.
ggplot(iris, aes(x=Petal.Width,fill=Species)) + geom_histogram()
# Try adjusting the binwidth attribute of geom_histogram
ggplot(iris, aes(x=Petal.Width,fill=Species)) + geom_histogram(binwidth = 0.5)
