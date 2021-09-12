# March 8, 2021
suppressMessages(library(dplyr))

# dplyr has verbs (fliter, arrange, ...) that are connected by pipes
# a pipe is %>% (can type with ctrl-shift-m)
# data goes in the left of a pipe and comes out the right

?iris
str(iris)
head(iris)
iris %>% head()  # same as head(iris)
iris %>% head(n=3)  # same as head(iris,n=3)

# pipe takes left side data and makes it the first argument of right side function

# some dplyr verbs
# filter: filters rows of the data frame
iris %>% filter(Species == "setosa")
# arrange: sort rows
iris %>% arrange(Sepal.Length)
iris %>% arrange(desc(Sepal.Length))  # descending order

# combine with multiple pipes
iris %>% arrange(desc(Sepal.Length)) %>% head(n=5)

# mutate: create or change variables
iris %>% mutate(Sepal.Area = Sepal.Length * Sepal.Width)

# select: select columns (variables)
iris %>% mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  select(Sepal.Area, Species) %>% arrange(Sepal.Area) %>% head(n=5)

# what is the largest petal area for any setosa iris? 25.08


# US nuclear reactors
reactors <- read.csv("https://mathstat.slu.edu/~clair/stat/data/us-reactors.csv")
str(reactors)
