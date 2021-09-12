suppressMessages(library(dplyr))

suppressMessages(library(stringr))

movies <-tibble(fosdata::movies)

# movie with the longest title
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length))

movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length)) %>%
  select(title) %>% distinct()


# genre search
# find the best thrillers
movies %>% filter(str_detect(genres,"Thriller")) %>%
  group_by(title, genres) %>% summarize(ratingcount = n(), meanrating =mean(rating)) %>% 
  filter(ratingcount >20) %>% arrange(desc(meanrating))

# What is the movie with the longest title w/o parantheticals
movies %>% mutate(title_length = str_length(title)) %>% arrange(desc(title_length)) %>%
  select(title) %>% distinct() %>% mutate(parens = str_count(title, "(")) # <-- error

# patterns are "regular experessions or regex
# ( is a special character in regex, must escape w/ `\\`
movies %>% mutate(title_length = str_length(title)) %>% select(title, title_length) %>%
  distinct() %>% mutate(parens = str_count(title, "\\(")) %>% filter(parens == 1) %>% 
  arrange(desc(title_length))
