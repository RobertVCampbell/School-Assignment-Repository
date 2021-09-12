mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
  ((x[1] == (2 * x[2])) || (x[2] == (2* x[1])))
  }))

# can also pretty easily use a 6x6 sample space (in onenote)
# --------- #
mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
  abs(x[1] - x[2]) == 0
}))

mean(replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
abs(x[1] - x[2]) == 4
}))

# --------- #
mm<- c("y","r","o","br","g","bl")
pb<-c(.14,.13,.2,.12,.2,.21)
MM <- sample(mm, 100000, prob=pb, replace=TRUE)
mean(MM!="g")

MM <- replicate(10000, {x<-sample(mm, 4, prob=pb, replace=TRUE);
  sum(x=="bl") > 1
})
mean(MM)

mean(replicate(10000, {x<-sample(mm, 6, prob=pb, replace=TRUE);
  ((sum(x=="y") == 1) & (sum(x=="r") == 1) & (sum(x=="o") == 1) &
    (sum(x=="br") == 1) & (sum(x=="g") == 1) & (sum(x=="bl") == 1)) 
}) )

# --------- #

mean(replicate(10000, {x<-sample(mm, 30, prob=pb, replace=TRUE);
  ( (sum(x=="bl") > 8) & (sum(x=="o") > 5)) 
}) )

# --------- #

type<- c("o","a","b","ab")
pb<-c(.45,.40,.11,.04)

mean(replicate(10000, {x<-sample(type,2,prob=pb,replace=TRUE);
  x[1] == x[2]
})) * 16
3/8

# --------- #
x<-sample(1:6, 5, replace=TRUE)
sum(x)
14 < sum(x) & sum(x) < 21

mean(replicate(10000, {x<-sample(1:6, 5, replace=TRUE)
  ((14 < sum(x)) & (sum(x) < 21))
}))

# --------- #

mean(replicate(10000, {x<-sample(1:6, 20, replace=TRUE)
  y<-cumsum(x)
  sum(y == 20)
}))

# --------- #

y <- replicate(10000, {x<-sample(1:6, 2, replace=TRUE)
sum(x)
})

hist(y, breaks=12)

y <- replicate(10000, {x<-sample(c(2,6), replace=TRUE)
  x + 5
})

hist(y)

y <- replicate(10000, {x<-sample(c(1,2,2,3,3,4), replace=TRUE)
  z<-sample(c(1,3,4,5,6,8), replace=TRUE)
  x + z
})

hist(y, breaks=12)

# --------- #
mean(replicate(10000, {x<-sample(1:365, 200, replace=TRUE)
  sum(x==1) > 1
}))
# --------- #
s<-fosdata::scrabble

mean(replicate(10000, {x<-sample(s$piece,7,replace=FALSE)
  ((sum(x=='A')==0)&(sum(x=='E')==0)&(sum(x=='I')==0)&(sum(x=='O')==0)&(sum(x=='U')==0))
}))

# --------- #
p<-seq(0,1,0.1)
y<- p^3 - 2*(p^2) + p
plot(p, y)

flip<-c("v", "c")
pb<-c(.45,(1-.45))

mean(replicate(10000, {x<-sample(flip,2, prob=pb,replace=TRUE)
  (x[1]==x[2])
}))

# --------- #

people <- sample(0:1, 100000, prob=c(.99,.01), replace=TRUE)
test <- ifelse(people, 1, sample(0:1, 100000, prob=c(.99,.01), replace=TRUE))
1-(sum(test & !people)/sum(test))


# --------- #
# P(B|A) = P(A|B) * (P(B)/P(A))
# If there is a second tree, there will always be a first tree
  1 * (.85/.91)


# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
# --------- #
