# March 12, 2021
library(dplyr)
library(stringr)
movies <- tibble(fosdata::movies)
movies
# movie with the longest title
movies %>% mutate(title_length = str_length(title))
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length))
movies %>% mutate(title_length = str_length(title)) %>%
  arrange(desc(title_length)) %>% select(title) %>% distinct()

# find the best thrillers
movies %>% filter(str_detect(genres, "Thriller")) %>%
  group_by(title, genres) %>% summarize(ratingcount = n(), meanrating = mean(rating)) %>%
  filter(ratingcount > 20) %>% arrange(desc(meanrating))

# find the longest title with no parenthetical remarks
movies %>% mutate(title_length = str_length(title)) %>%
  arrange(desc(title_length)) %>% select(title) %>% distinct() %>%
  mutate(parens = str_count(title, "("))  # <-- error

# patterns are "regular expressions" or regex
# in regex, ( is a special character.  To use it, we need to "escape" it with \\
movies %>% mutate(title_length = str_length(title)) %>%
  select(title, title_length) %>% distinct() %>%
  mutate(parens = str_count(title, "\\(")) %>%
  filter(parens == 1) %>%
  arrange(desc(title_length))
