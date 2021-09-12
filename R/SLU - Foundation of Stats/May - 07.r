# May 7, ANOVA


suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(ggplot2)))

sleep <- ggplot2::msleep
str(sleep)

sleep %>% ggplot(aes(x=bodywt)) + geom_histogram()
sleep %>% ggplot(aes(sample=bodywt)) + geom_qq()

boxplot(sleep$bodywt)
boxplot(log(sleep$bodywt))
# Log looks relatively normal

sleep %>% ggplot(aes(x=bodywt)) + geom_boxplot() + facet_grid(vars(vore))

sleep %>% ggplot(aes(x=log(bodywt))) + geom_boxplot() + facet_grid(vars(vore))
boxplot(log(bodywt) ~ vore, data=sleep)

logwt_mod <- lm(log(bodywt) ~ vore, data=sleep)
summary(logwt_mod)
anova(logwt_mod)
# find a significant difference in mean log(bodywt)
# among the different diets (p = 0.03355)
#    SIDENOTE: IRL nobody actually reports p-values that far out, they'd usually
#    the above as 0.03 or /maybe/ 0.034

# What is ANOVA?
# Assumptions:
#   Normally distributed, variances of the groups are equal,
#   and observations are independent
# Check 1 and two by plotting by checking residuals:

lm(log(bodywt) ~ vore, data=sleep) %>%  plot()
# graph one looks decent, with the red line close to a straight
# line (data is plotted by subtracting mean)

# Graph 2 does a normal qq plot, since it was logged this plot looks really good

# Graph 3 shows variance, if you see a trend the variance are probably unequal
#   This data has minor changes between the values, but overall is pretty close

# Graph 4 for outliers, residuals vs outliers for leverage
# This data is close enough to ideal that you can barely see the cooks line

sleep %>% ggplot(aes(x=sleep_total)) + geom_histogram()
# Is pretty normal

boxplot(sleep$sleep_total)
boxplot(sleep_total ~ vore, data=sleep)
# variance by category is pretty different

sleep_mod <- lm(sleep_total ~ vore, data=sleep)
summary(sleep_mod)
anova(sleep_mod)
# p-value shows that it is not normal p: 0.09143

lm(sleep_total ~ vore, data=sleep) %>%  plot()
# Graph 1 looks fine
# Graph 2 looks somewhat normal, though it does skew at the edges
# Graph 3 shows that the variances are pretty different
# Graph 4 shows the outliers are not a problem


# oneway.test is an djusted ANOVA that does not assume equal variances
# WARNING: When ANOVA fails, it fails with a /lower/ p-value, showing significance
#     when there is none.


# Pairwise.t.test can perform all the t-tests with correction for pvalues

pairwise.t.test(log(sleep$bodywt), sleep$vore)
# shows no specific pair shows significant difference despite the overall data 
# showing that diet on the whole /does/ effect weight