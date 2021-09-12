library(dplyr)
library(ggplot2)


str(faithful)

faith_mod<-lm(waiting ~ eruptions, data=faithful)

faithful %>%  ggplot(aes(x=eruptions, y=waiting)) + geom_point() + geom_smooth(method="lm")

predict(faith_mod, newdata = data.frame(eruptions=4.3))

# -------- #

j <- ISwR::juul
j<-j %>% filter(tanner==5, age<20)
model <- lm(igf1 ~ age, data=j)
model

# -------- #

# correlation coefficient is the ratio of the lm to a 1sdy / 1sdx line and can be between -1 and 1

# --------- #

d<-datasauRus::datasaurus_dozen
d %>% group_by(dataset) %>% summarize(correlation = cor(x, y, use="complete.obs"),
        xbar=mean(x), sx = (sd(x)/sqrt(142)), ybar=mean(y), sy=(sd(y)/sqrt(142)))

d %>% ggplot(aes(x=x, y=y, color=dataset)) + geom_point() + facet_wrap(vars(dataset))

# ------- #
# 10 is f(b) = sum over i of (yi-B-xi). Take derivative of B with respect to B
#  -2 sum (yi-B-xi) = -2(sum(yi-xi) - n*B) = -2(ybar - xbar -nB) = 0
# ybar-xbar = nB, (ybar-xbar)/n = B


# --------- #

a <- carData::Anscombe
cor(a$education, a$young)

model <- lm(education ~ young, data=a)
summary(model)$coefficients

str(a)
row.names(a)

a<-a %>% filter(rownames(.)!="AK")
model <- lm(education ~ young, data=a)
summary(model)$coefficients

plot(model)

# ----------- #
c <- fosdata::cern
c<-c %>% filter(platform=="Twitter") %>% head()
model<-lm(likes ~ shares, data=c)
plot(model)

l_model<-lm(log(likes) ~ shares, data=c)
plot(l_model)

# ----------- # 

crit <- fosdata::crit_period
crit <- crit %>% filter(locale=="North America")
crit %>% ggplot(aes(x=aoa, y=gjt)) + geom_point()


model <- lm(gjt ~ aoa, data=crit)
model
crit %>% ggplot(aes(x=aoa, y=gjt)) + geom_point() + geom_smooth(method="lm")

# ------------ #
library(quantreg)
data(engel)
e<-engel
e %>%  ggplot(aes(x=income,y=foodexp)) + geom_point() + geom_smooth(method="lm")

model<-lm(foodexp ~ income, data=e)
plot(model)

# ------------ #

pen <- palmerpenguins::penguins
pen<-pen %>% filter(species=="Gentoo")
model<-lm(body_mass_g ~ flipper_length_mm, data=pen)
summary(model)$coefficients

# ----------- #

hot <- fosdata::hot_dogs
hot %>% ggplot(aes(x=calories,y=sodium, color=type)) + geom_point()

hot<-hot %>% filter(type!="Poultry")
model<-lm(sodium ~ calories, data=hot)
model

predict(model, newdata=data.frame(calories=140))

# ----------- #

bat<-Lahman::Batting
dat<-bat %>% group_by(yearID) %>% summarize(HR=sum(HR), R=sum(R))
dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point()

dat<-dat %>% filter(yearID>1969)
dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point()

model<-lm(R ~ HR, data=dat)
model
summary(model)

dat %>% ggplot(aes(x=HR, y=R, color=yearID)) + geom_point() + geom_smooth(method="lm")

predict(model, newdata=data.frame(HR=4000))


# -------- #

e <- Sleuth2::ex0728
e %>% ggplot(aes(x=Stories, y=Height, color=Year)) + geom_point() + geom_smooth(method="lm")

# -------- #
e <- Sleuth3::ex0823
e %>% ggplot(aes(x=Mortality, y=Wine, color=Country)) + geom_point()
e %>% ggplot(aes(x=log(Wine), y=Mortality)) + geom_point()

model <- lm(Mortality ~ log(Wine), data=e)
summary(model)$coefficients
cor(log(e$Wine), e$Mortality)

#------------#

x <- runif(30, 0, 10)
epsilon <- rnorm(30)  # std normal, mean 0 sd 1
y <- x^2 + epsilon
plot(x,y)
mod <- lm(y ~ x)

# predict at x=5
pi <- predict(mod, data.frame(x=5), interval="predict")
rate<-replicate(10000000, {xnew <- 5;
ynew <- xnew^2 + rnorm(1);
# check the prediction
(pi[2] < ynew & pi[3] > ynew)})
mean(rate)

# predict at x=10
pi <- predict(mod, data.frame(x=10), interval="predict")
rate<-replicate(10000000, {xnew <- 10;
ynew <- xnew^2 + rnorm(1);
# check the prediction
(pi[2] < ynew & pi[3] > ynew)})
mean(rate)

# ----------------- #
x = seq(0,10,length.out = 21)

test<- replicate(10000, {epsilon <- rnorm(21, sd=3);
y = 1 + 2*x + epsilon;
model<-lm(y~x);
y[x==5.5] - predict(model, newdata=data.frame(x=5.5))})

sd(test)

test<- replicate(10000, {epsilon <- rnorm(21, sd=3);
y = 1 + 2*x + epsilon;
model<-lm(y~x);
y[x==10] - predict(model, newdata=data.frame(x=10))})

sd(test)
