# March 15, 2021
library(stringr)

# chapter 6 #26
words
str(words)
str_detect(words,"ff")
words[797]
# use the T?F vector as an index into words[]

# regex .. ^ means beginning of word, $ means end of word.
# words that end in ff:
words[str_detect(words,"ff$")]

# 6.28

fruit
truefruits <- fruit[str_detect(fruit,"fruit$")]
str_remove(truefruits,"g")  # remove all the g's...why???

# 6.35
scot <- tibble(fosdata::scotland_births)
str(scot)
head(scot)
# data is stored in the variable names x1945, x1946, ...
# want each row to be a single count of births, with age and year
# as variables
# pivot_longer from tidyr can do this.
library(tidyr)
pivot_longer(scot)  # error - need to choose columns
pivot_longer(scot, !age)  # ! means not.. so all columns but age
# can improve by renaming the incoming columns
pivot_longer(scot, !age, names_to = "year", values_to = "births")

# use str_remove to remove the x from year
# as.integer converts a string to a number

