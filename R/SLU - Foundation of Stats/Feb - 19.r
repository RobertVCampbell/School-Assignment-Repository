# Binomial syntax: rbinom(trials,n,p)
trials <- 100000
# Simulate ESP testing
# Could be done with sample and replicate
replicate(100, {
  cards <- sample(1:5, 10, replace=TRUE)
  guess <- sample(1:5,10, replace=TRUE)
  sum(cards == guess)
  })

# Using rbinom
rbinom(100,10,.2)

esp <-rbinom(trials,10,.2)
mean(esp) # expected value
table(esp) # outcomes
table(esp)/trials  # percentage
plot(table(esp)/trials)  # pmf visualized

head(esp,100)
mu <- 2
head(esp-mu,100)
mean(esp-mu)
mean((esp-mu)^2) # variance
var(esp) # Shorter variance

sqrt(mean((esp-mu)^2)) # std
sd(esp) # also standard deviation
# Standard deviation is the deviation from the mean where most of your
# data will exist in


# Voting: 30% voters will vote for Reed
#   732 voters polled
# Check the expected value
# Plot the pmf
# What's the probabilitiy that < 200 voters say they will support Reed?
# What's the probability that the poll says he has 33% or more of the vote?

votes <-rbinom(trials, 732, .3)
plot(table(votes)/trials)  # pmf

ltvotes <- (votes < 200)
sum(ltvotes)/trials # lt percentage

perc <- votes/732
gtperc <- (perc >= .33)
sum(gtperc)/trials # gt percentage

732 * .33
mean(votes)
var(votes)
sd(votes)
# 1 sd greater, basically upper bound
mean(votes) + sd(votes)

# Margin of error as a percentage:
(2*sd(votes))/732
