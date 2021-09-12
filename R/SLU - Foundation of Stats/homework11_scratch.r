library(dplyr)
library(ggplot2)

pen<-palmerpenguins::penguins
boxplot(bill_depth_mm ~ species, data=pen)

depth_mod<-lm(bill_depth_mm ~ species, data=pen)
anova(depth_mod)
# -------------- #

weight<-fosdata::weight_estimate
str(weight)
boxplot(mean300 ~ age, data=weight)

anova(lm(mean300 ~ age, data=fosdata::weight_estimate))

# -------------- #
judge_perc <- Sleuth3::case0502
boxplot(Percent ~ Judge, data=judge_perc)
judge_perc %>% filter(Judge != "Spock's") %>% lm(Percent ~ Judge, data=.) %>% anova()

judge_perc %>% mutate(Spock = (Judge=="Spock's")) %>%
  t.test(Percent ~ Spock, data=.) 


head(judge_perc)
table(judge_perc$Spock)

# ------------ #

str(chickwts)
boxplot(weight ~ feed, data=chickwts)
table(chickwts$feed)

# ----------- #
str(morley)
anova(lm(Speed ~ Expt, data=morley))
boxplot(Speed ~ Expt, data=morley)

# --------------- #


flint_pb <- fosdata::flint
boxplot(log(Pb1) ~ Ward, data=flint_pb)
flint_pb<- flint_pb %>% filter(Ward != 0)
boxplot(log(Pb1) ~ Ward, data=flint_pb)



str(flint_pb)