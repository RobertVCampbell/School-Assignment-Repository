# You can use R and any written or internet resources. Ask Dr. Clair questions, 
# no one else.
# Template distributed, -10pts if not knit
# Include code, results, and clear answer. Linear regression, rewrite as an equation


# Sidenote added after the overview:
#   there are 4 possible questions between Probability and RV, so there are either
#   are 2 prob 2 rv, or 1 prob 2 rv


# Probability, 1+ questions
# Experiments, probabilities, replications, 

# Random Variables 2+ questions
# Discrete v continues
# Do ocmputations and know the main rv classes
# Simulate with the known rv classes (rnorm, runif, rbinom, etc)
# Note this is all exam one. Table and RV info is in Onenote
# Dnorm plots the pdf/pmf
# pnorm plots the cdf/cmf

# Data and visualization 3 questions
# dpylr, ggplot. COmfortable with group_by %>% summarize()

# Hypothesis testing 3 questsions
# State results clearly "There is a significant different in [thing tested] with
#   P=.... "
# IF PVALUE IS LESS THAN .05 YOU HAVE A SIGNIFICANT DIFFERENCE FOR THIS TEST AND
# YOU REJECT THE NULL HYPOTHESIS
# One, paired 2sample, two independent sample t.test
# One: Sample space plus some known to test against (e.g. a known mu)
# Paired: Basically, you'll have one individual tested in two environments (x1,x2)
# Two independent: two separate variables and grouping by one (x1 ~ x2)
# Confidence intervale on the mean

# Test assumptions 2 Questions
# Ttest:
#   Normal or n is large
#   No/few outliers
# If not meeting ttest assumptions (often skewed or outliers):
#   Log transforms
#   Wilcoxon rank based tests (focusing on median)
# Type I (null true) and II (null false) errors
# Power and sample size (power.t.test)
#
# Probability of Type II error is 1 - Power
#  Power is the probability of finding something that is there (hypothesis is true)

# Linear regression 2 questions
# Create scatter plot + regression line (use ggplot and geom_smooth)
# find equation of linear regression line
# use regression models to make predictions (use predict or by hand)
# Make and interpret residual plots to check regression assumptions (plot(model))

# ANOVA 1 question
# Used when explanatory x variable is categorical
# Run anoca(lm(y~x,data=dataset)) and interpret results
# Categoric data will not need conversion from numeric to factor

# Reviewing the random variables
# What is the underlying process?
#   Bernoulli: Repeated binary-state trials
#     Generates binomial and geometric
#   Poisson: Waiting for an event to happen:
#     Generates poisson and exponential
#   If not really either, it's probably normal
#   Uniform doesn't really show up in the real world
#     It's really just Normal with strict limits
#
# Bernoulli: Binomial is how many successes, Geom is how many tries to get a succes
# Poisoson: Poisson is how many events, exponential is time until the first event
# Key think to watch out for discrete v continuous
#   Binomial, geometric, Poisson are discrete (counting something)
#   Normal, uniform, exponential are continuous (measuring something)
# Uniform /can/ be discrete (e.g. a die roll), though you'd model that with sample
#   Sample is a discrete uniform distribution unless otherwise specified.

# 3. on practice exam
#   given a pdf, find the constant and then sketch the cdf
#   set the integral of the function to 1 and solve to find c
# Graph pdf, for cdf find the y=0, y=1 asymptotes and then connect with some function
#   This example was done by hand and didn't require specific code to solve, mostly
#     conceptual

# 4. What is the probability of the above function x > 0; By observation .5
#    Probability x < .5, Integrate from -1 to .5

# Bechdel data is slightly changed since the review test was written.

# 15. Make a histogram or boxplot of the budget variable. Fancy woulod be qqplot


# Computing type I error rate
# You must know your population

# assume population is t w/ 3df
# what's the type I error rate for a t.test of mu=0 with n=10

# Generate a sample
rt(10,df=3)

# test it against mu=0, when run repeatedly it may generate p-vale < 0.05
t.test(rt(10,df=3), mu=0)

# Test against p-value, replicate a large amount of time, take the mean
mean(replicate(10000, t.test(rt(10,df=3), mu=0)$p.value < .05))




# Plot PDF of a normal with mean 10 sd 4
x <- seq(-10,30,.1)
plot(x, dnorm(x,mean=10,sd=4), type='l')

#  Plotting CDF of normal
plot(x, pnorm(x,mean=10,sd=4), type='l')



# Find x which is the 75th percentile with pnorm and guessing
pnorm(15, 10, 4) # keep changing the first number and generating percentiles

qnorm(.75, 10, 4) # First number is the perctile you're finding.


# Poisson with rate 7 PDF (we expect 7) Discrete
x <- 0:20
plot(x, dpois(x, lambda=7))

# CMF (though we rarely look at CMF for discrete)
plot(x, dpois(x, lambda=7))


