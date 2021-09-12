# April 19, 2021
library(fosdata)
library(ggplot2)
library(dplyr)

masks %>% ggplot(aes(x=mask_fine)) +
  geom_histogram()
masks %>% filter(mask_fine < 1000) %>% 
  ggplot(aes(x=mask_fine)) +
  geom_histogram()

t.test(masks$mask_fine, masks$no_mask_fine, paired=TRUE)
# p = 0.18.. not significant difference

wilcox.test(masks$mask_fine, masks$no_mask_fine, paired=TRUE)
# p = 0.0002, definitely a significant difference wearing masks

# skew data can be (sometimes) improved with a log transform
masks <- masks %>%
  mutate(log_mask = log(1 + mask_fine), log_no_mask = log(1 + no_mask_fine))
masks

masks %>% ggplot(aes(x=log_mask)) +
  geom_histogram()
masks %>% ggplot(aes(x=log_no_mask)) +
  geom_histogram()
boxplot(masks$log_mask, masks$log_no_mask)

t.test(masks$log_mask, masks$log_no_mask, paired=TRUE)
# p = 0.0003
wilcox.test(masks$log_mask, masks$log_no_mask, paired=TRUE)
# p = 0.0005

# overall, conclude that mask wearing reduces fine influenza particles

# Wilcoxon signed rank test
corn <- read.csv("https://mathstat.slu.edu/~clair/stat/data/gosset_corn.csv")
corn
t.test(corn$KILN, corn$REG, paired=TRUE)
wilcox.test(corn$KILN, corn$REG, paired=TRUE)

corn$d <- corn$KILN - corn$REG
corn
corn$d
abs(corn$d)
corn$ranks <- rank(abs(corn$d))
corn
corn %>% filter(d > 0) %>% summarize(sum(ranks))
