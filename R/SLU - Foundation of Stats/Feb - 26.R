# Feb 26, 2021
# pregnancy is Norm(280,10)
# P(pregnancy lasting more than 287 days)
pnorm(287,280,10)  # less than 287 days
1-pnorm(287,280,10) # more than 287 days
# another way:
pnorm(287,280,10,lower.tail=FALSE)

# probabilty of premature (<37 weeks)
37*7  #days
X <- rnorm(10000, 280, 10)
hist(X)
mean(X < 259)
pnorm(259, 280, 10)

# what are longest 1%?
pnorm(303.5, 280, 10)
# qnorm is the inverse pdf.  Given a probability, what is x?
qnorm(.99, 280, 10)


# Tuna Hg level ~ Norm(0.689,0.341)
1-pnorm(1,0.689,0.341)  #18% 1 ppm Hg or higher
pnorm(0.5,0.689,0.341)  #29% 0.5 ppm Hg or lower
qnorm(.99, 0.689, 0.341) # worst 1%

rnorm(21,.689,.341)
worst <- replicate(10000, max(rnorm(21, 0.689, 0.341)))
hist(worst)
mean(worst > 1.84)

students <- rnorm(10,80,5)
B<-sum(students > 85)
B > 3
#students <- 
mean(replicate(trials, sum(rnorm(10,80,5)>=85))>3)

hist(rnorm(trials, 5036, 122))
