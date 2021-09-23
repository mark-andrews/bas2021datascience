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


# diagnostics
plot(M2, which = 1)
plot(M2, which = 2)
plot(M2, which = 3)

summary(M2)
confint(M2)
confint(M2, level = 0.99)
confint(M2, level = 0.9)


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


# Nested model comparison -------------------------------------------------

M1 <- lm(weight ~ height, data = weight_df_male)
M2 <- lm(weight ~ height + age, data = weight_df_male)

rss_1 <- sum(residuals(M1)^2)
rss_2 <- sum(residuals(M2)^2)

c(rss_1,rss_2)
anova(M1, M2)




# binary logistic ---------------------------------------------------------

# we *could* do this, but it would be BAD
weight_df_2 <- mutate(weight_df, gender = if_else(gender == 'Male', 1, 0))
M5 <- lm(gender ~ height + age, data= weight_df_2)


affairs_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/affairs.csv")

affairs_df <- mutate(affairs_df, y = affairs > 0)

M6 <- glm(y ~ age, data = affairs_df, family = binomial(link = 'logit'))

# log_odds_affair is a linear function of age 
# log_odds_affair = -1.55 + 0.013 * age 

betas <- coef(M6)
betas[1] + betas[2] * c(20, 30, 40)
plogis(betas[1] + betas[2] * c(20, 30, 40))

data_df <- tibble(age = c(20, 30, 40, 50))

predict(M6, 
        newdata = data_df, 
        type = 'response')
