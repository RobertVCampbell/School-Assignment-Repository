# Wednesday, Feb 3, 2021

# fosdata library - packaged with our book
# to install, must pull it from Dr. Speegle's github
# this requires the program remotes
# remotes::install_github("speegled/fosdata")

# to use fosdata:
library(fosdata)

?bechdel
str(bechdel)

table(bechdel$test)
table(bechdel$test, bechdel$clean_test)

hist(bechdel$intgross) # right skew, meaning long small tail to the right
mean(bechdel$intgross) # NA

# If you look at the intgross data, some data is not available:
bechdel$intgross

# Since some data is not available, R will not process the mean
# Can have mean handle na values with the arguement na.rm
mean(bechdel$intgross, na.rm = TRUE)

# Or you can remove NA values from the data set with is.na function
is.na(bechdel$intgross)
# Use ! to negate T/F values
!is.na(bechdel$intgross)

# To store the cleaned up data set
cleangross <- bechdel[!is.na(bechdel$intgross),]

# Then process the mean with the cleaned data
mean(cleangross$intgross)

# na.omit does something similar
mean(na.omit(bechdel$intgross))


# Probability simulation


# the c command makes a vector
c(1,2,3,4,5)
coin <- c('H','T')

# sample chooses from a vector
sample(coin,1) # simulate one coin flip, this samples without replacement
sample(coin,10)# fails because the sample space depletes after 2 samples
sample(coin,2)# as such this will only give HT or TH, never HH or TT

sample(coin, 10, replace=TRUE) # This runs samples with replacement


# What's the probability of heads?
table(sample(coin, 10, replace=TRUE)) #easier, but not simpler
table(sample(coin, 10000, replace=TRUE)) # typically we'll use ~10,000 events

# Doing 1B events was a mistake
# Error: cannot allocate vector of size 3.7 Gb


sample(coin,10,replace = TRUE) == "H" # produce T/F vector, T when heads
mean(sample(coin,10000,replace = TRUE) == "H") #
