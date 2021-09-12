# April 14, 2021
library(Stat2Data)
library(dplyr)
library(ggplot2)
data("Backpack")

USJudgeRatings
boxplot(USJudgeRatings) # Base R can make the plot
# ggplot would need you to turn column names into a variable
# to use x as the x aesthetic

intake <- ISwR::intake
# Rotates all columns
intake %>%  tidyr::pivot_longer((cols=everything()))

intake %>%  tidyr::pivot_longer((cols=everything())) %>%  ggplot(aes(x=name, y=value)) + geom_boxplot()


head(Backpack)

Backpack %>% filter(Sex=="Female") %>% group_by(Year) %>% summarize(students = n())

Backpack %>% group_by(Major) %>% summarize(students = n()) %>% arrange(desc(students))

# Note, may need extra work to add labels to the factor, probably do it outside of the ggplot call
# something like factor(BackProblems, levels = c("0","1"), labels = c("No back problems", "Back Problems))
# inside of a mutate call
Backpack %>% ggplot(aes(x=BodyWeight,y=BackpackWeight, color=factor(BackProblems))) + geom_point() +
  scale_color_manual( values=c("gray", "red") )
# Can add "breaks" to set specific values for color manual if you want to reorder the list
# The above is satisfactory

t.test(BodyWeight ~ Sex, data=Backpack)

t.test(BackpackWeight ~ Sex, data=Backpack)

t.test(BackpackWeight ~ BackProblems, data=Backpack)
