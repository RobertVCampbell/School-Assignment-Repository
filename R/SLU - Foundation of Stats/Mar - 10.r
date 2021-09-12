suppressMessages(library(dplyr))


#movieLens data
movies <- tibble(fosdata::movies)
str(movies)
movies %>% filter(movieId==1)
movies %>% group_by(title) %>% summarize(mr = mean(rating)) %>% arrange(desc(mr))
# This resulted in a lot of movies with few ratings

# n(), when used in summarize, counts rows in groups
movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  arrange(desc(mr))

# Filter out for at least 20 ratings
movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  filter(numratings>= 20) %>% arrange(desc(mr))

# best with at least 50 reviews is Shawshank

movies %>% group_by(title) %>% summarize(mr = mean(rating), numratings = n()) %>%
  filter(numratings>= 50) %>% arrange(mr)

# worst with at least 50 is Wild Wild West

movies %>%  group_by(userId) %>% summarize(numratings=n()) %>% arrange(desc(numratings))

# User with most reviews is id:414 with 2698 ratings

movies %>%  group_by(userId) %>% summarize(numratings=n(), mr=mean(rating)) %>% arrange(mr)
# User 442 has the lowest average rating of 1.27

movies %>%  group_by(title) %>% filter(userId==442) %>% summarize(title, rating)%>% arrange(desc(rating))
# Likes Jungle Book and Tootsie
                                                                                            