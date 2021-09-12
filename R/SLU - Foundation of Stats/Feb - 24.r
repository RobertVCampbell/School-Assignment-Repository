# runif(trials,a,b) for uniform probability
# note: Using mean(x == ..) is easier than sum(x ==)/trials
# Suppose X ~ Unif[0,10]
trials <- 100
runif(trials,0,10)

# Unif[0,3]
# Height of the pi function is 1/3
# P(X<= 1) = int from 0 - 1 = 1/3
x <- runif(trials,0,3)
(sum(x<=1)/trials)
# returned 0.3346


# P(X>2.5) = 1/6 (integral)
(sum(x>2.5)/trials)
mean(x>2.5)
# returned 0.168 ~~ 1/6

# E[X] mean, should be 1.5
# int from -inf to inf of xf(x)dx
# integral 1/3 * x dx  = 1/2 * 1/3 x^2|0 to 3 =  9/6 = 3/2
mean(x)
# Returned 1.497

# E[X^2]
# 1/3 * x^2 integral = 1/3 * 1/3 x^3|0 to 3 =  27/9 = 3/1
mean(x^2)
# returned 2.989697
var(x) + mean(x)^2
# Returned 2.98672

# E[X^2] - E[X]^2 = 3 - (3/2)^2 = 3 - 9/4 = 3 - 2.25 = .75
var(x)
# 0.74

# sd = sqrt(0.75) = 0.8660254
sd(x)
#returned 0.864


# cdf is given by p versions of our random functions, r prefix meant random
# pbinom(x,n,p), pgeom(x,p), punif(x,a,b)

# 80% freethrow shooter making < 5 shots
pbinom(4,10,.8)

# probability of 80% freethrow shooter make more than 10 shots before first miss
# X - # of makes until first miss geom(.2)
pgeom(9,.2) # Prob of 9 or less before first miss
1 - pgeom(9,.2) # Prob of 10 or more

# Prob a goal is scored in first 10 min in a 1-0 soccer game
# X - time goal scored in 90min soccer game, unif(0,90)
punif(10,0,90)
