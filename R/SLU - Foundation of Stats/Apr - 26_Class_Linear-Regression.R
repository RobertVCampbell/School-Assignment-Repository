# April 26, 2021
library(dplyr)
library(ggplot2)
?Formaldehyde
Formaldehyde
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point()
# guess slope of .8, intercept of .1
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.8, intercept = .1)
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.8, intercept = .05)
# For carb = .1 his line predicts an optden of 0.13:
.05 + .8 * .1
# actual value is 0.086
Formaldehyde[1,]
# the error is the epsilon in our y = a + bx + epsilon
# model.. called the "residual"
# want a line that minimizes these residual errors
# square all the errors and find the mean
Formaldehyde %>%
  mutate(optden_hat = .05 + .8 * carb,
         resid = optden - optden_hat)
Formaldehyde %>%
  mutate(optden_hat = .05 + .8 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# pick a better line, beat my error!
Formaldehyde %>%
  mutate(optden_hat = .02 + .85 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_abline(slope=.85, intercept = .02)
Formaldehyde %>%
  mutate(optden_hat = .01 + .865 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# the line that minimizes the Mean Squared Error (MSE)
# is called the least-squares regression line.

# can find with the lm command, "linear model"
lm(optden ~ carb, data=Formaldehyde)
# best fit line has slope .876286, intercept 0.005086
Formaldehyde %>%
  mutate(optden_hat = .005086 + .876286 * carb,
         resid = optden - optden_hat) %>%
  summarize(mean(resid^2))
# can plot regression lines with geom_smooth(method="lm")
Formaldehyde %>% ggplot(aes(x=carb, y=optden)) + 
  geom_point() + geom_smooth(method="lm")

# can use the line to make predictions
# predict optden when carb is 0.4?
.005086 + .876286 * 0.4  # by hand, with coefficients
optden_mod <- lm(optden ~ carb, data=Formaldehyde)
predict(optden_mod, newdata = data.frame(carb = 0.4))
# both methods.. 0.3556

