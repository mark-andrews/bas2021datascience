library(tidyverse)

weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/weight.csv")
weight_df_male <- filter(weight_df, gender == 'Male')

M1 <- lm(weight ~ height, data = weight_df_male)
betas <- coef(M1)
mutate(weight_df_male, mu = betas[1] + betas[2] * height)
sigma(M1)

M2 <- lm(weight ~ height + age, data = weight_df_male)
coef(M2)
sigma(M2)

M3 <- lm(weight ~ height + gender, data = weight_df)
coef(M3)

betas <- coef(M3)
# what is the mean of the distribution over weight
# for a Male of height 180
betas[1] + betas[2] * 180 + betas[3] * 1
# what is the mean of the distribution over weight
# for a Female of height 180
betas[1] + betas[2] * 180 + betas[3] * 0


weight_df %>% select(race) %>% distinct()
weight_df %>% group_by(race) %>% tally()

weight_df_1 <- filter(weight_df, race %in% c(1, 2, 3)) %>% 
  mutate(race = factor(race))

M4 <- lm(weight ~ height + race, data = weight_df_1)
betas <- coef(M4)
# what is the mean of the distribution over weight
# for people of race=1 who are of height 180
betas[1] + betas[2] * 180 + betas[3] * 0 + betas[4] * 0

# what is the mean of the distribution over weight
# for people of race=3 who are of height 180
betas[1] + betas[2] * 180 + betas[3] * 0 + betas[4] * 1
