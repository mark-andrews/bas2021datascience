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

affairs_df <- mutate(affairs_df, 
                     y = affairs > 0)

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

library(modelr)
data_df %>% 
  add_predictions(M6, type = 'response')

summary(M6)


confint.default(M6)

# factor by which the odds changes for a unit change in age
exp(0.013920)

M6 <- glm(y ~ age, data = affairs_df, family = binomial(link = 'logit'))
M7 <- glm(y ~ age + yearsmarried, 
          data = affairs_df, family = binomial(link = 'logit'))

anova(M6, M7, test = 'Chisq')


# Poisson and count data --------------------------------------------------

doctor_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/DoctorAUS.csv")


doctor_df %>% pull(doctorco) %>% table()

M8 <- glm(doctorco ~ age, 
          data = doctor_df, 
          family = poisson(link = 'log'))

summary(M8)

data_df <- tibble(age = seq(0.2, 0.8, by = 0.1))

# predicted log of the mean of the Poisson distribution
# for different values of age
data_df %>% 
  add_predictions(M8)


# predicted mean of the Poisson distribution
# for different values of age
data_df %>% 
  add_predictions(M8, type = 'response')

# sample 100 values from a Poisson distribution whose mean
# is 0.331
rpois(100, lambda = 0.331)

summary(M8)
deviance(M8)

M9 <- glm(doctorco ~ sex  + age + income + insurance, 
          data = doctor_df, 
          family = poisson(link = 'log'))

deviance(M9)

anova(M8, M9, test = 'Chisq')


glm(doctorco ~ offset(2) , 
          data = doctor_df %>% na.omit(), 
          family = poisson(link = 'log'))


smoking_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/smoking.csv")

library(pscl)
M10 <- zeroinfl(cigs ~ educ, data = smoking_df)
summary(M10)
