library(tidyverse)

blp_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/blp-trials-short.txt")

glimpse(blp_df)

# dplyr verbs:

# select -
# rename - 
# slice -
# filter  -
# mutate
# arrange

## Selecting columns with select
select(blp_df, participant, resp, rt)
select(blp_df, 1, 5, 2)
select(blp_df, participant, 5)
select(blp_df, participant:resp)
select(blp_df, 1:4)

select(blp_df, starts_with('r'))
select(blp_df, starts_with('rt'))
select(blp_df, ends_with('t'))
select(blp_df, ends_with('rt'))
select(blp_df, contains('r'))
select(blp_df, contains('rt'))
select(blp_df, matches('^rt'))
select(blp_df, matches('rt$'))
select(blp_df, matches('^rt|rt$'))

select(blp_df, -participant)
select(blp_df, -participant, -lex)
select(blp_df, -c(participant, lex))
select(blp_df, -(1:3))

select(blp_df, where(is.numeric))
select(blp_df, where(is_character))

# https://gist.github.com/mark-andrews/afa376e408e39d4d7fa7229048098a90

has_low_mean <- function(x){
  is.numeric(x) && (mean(x, na.rm = TRUE) < 500)
}

has_high_mean <- function(x){
  is.numeric(x) && (mean(x, na.rm = TRUE) > 500)
}

select(blp_df, where(has_low_mean))
select(blp_df, where(has_high_mean))

select(blp_df, rt, everything())
select(blp_df, lex, rt, participant, everything())

relocate(blp_df, rt)
relocate(blp_df, starts_with('r'))

relocate(blp_df, rt, .after = lex)
relocate(blp_df, rt, .before = lex)

## renaming with rename
select(blp_df, participant, reaction_time = rt)
select(blp_df, participant, reaction_time = rt, everything())

rename(blp_df, subject = participant, reaction_time = rt)

rename_with(blp_df, ~str_replace(., 'rt', 'reaction_time'))
rename_with(blp_df, ~str_replace(., '^rt|rt$', 'reaction_time'))
rename_with(blp_df, ~str_replace(., 'rt', 'reaction_time'), matches('^rt|rt$'))


## slicing with slice
slice(blp_df, 1:5)
slice(blp_df, 1, 2, 5, 25)
slice(blp_df, 1:5, 10, 7)
slice(blp_df, -1)
slice(blp_df, -(1:3))
slice(blp_df, n())
slice(blp_df, 1000)
slice(blp_df, (n()-5):n())

# Filtering with filter ---------------------------------------------------

filter(blp_df, lex == 'W')
filter(blp_df, lex == 'W', resp == 'W')

filter(blp_df, rt < 500)
filter(blp_df, lex == 'W', rt < 500)
filter(blp_df, lex == 'W' | rt < 500)
filter(blp_df, !(lex == 'W') | rt < 500)

filter(blp_df, if_any(everything(), is.na))
filter(blp_df, if_all(everything(), is.na))

filter(blp_df, if_all(rt:rt.raw, ~ . < 500))

less_than_500 <- function(x) {x < 500} 

filter(blp_df, if_all(rt:rt.raw, less_than_500))
filter(blp_df, if_all(rt:rt.raw, function(x) {x < 500} ))
filter(blp_df, if_all(rt:rt.raw, ~ . < 500))
filter(blp_df, if_any(rt:rt.raw, ~ . < 500))

filter(blp_df, if_all(rt:rt.raw, ~ . < median(., na.rm = T)))
filter(blp_df, if_any(rt:rt.raw, ~ . < median(., na.rm = T)))
filter(blp_df, if_all(where(is.numeric), ~ . < median(., na.rm = T)))
filter(blp_df, if_any(rt:rt.raw, ~ (. < median(., na.rm = T)) & (. < mean(., na.rm = T))))
       


# Adding new columns with mutate ------------------------------------------

mutate(blp_df, accuracy = lex == resp)

mutate(blp_df,
       accuracy = lex == resp,
       word_length = str_length(spell))


mutate(blp_df,
       accuracy = lex == resp,
       word_length = str_length(spell),
       long_word = word_length > 5)


mutate(blp_df,
       lex = as.factor(lex),
       spell = as.factor(spell),
       resp = as.factor(resp)
)

mutate(blp_df, 
       across(lex:resp, as.factor)
)

mutate(blp_df, 
       across(c(lex, spell, resp), as.factor)
)

mutate(blp_df, 
       across(where(is.character), as.factor)
)

mutate(blp_df,
       across(where(is.numeric), ~as.vector(scale(.)))
)

mutate(blp_df,
       lex = recode(lex, 'W' = 'word', 'N' = 'nonword')
)

mutate(blp_df,
       lex = recode(lex, 'W' = 'word', 'N' = 'nonword'),
       resp = recode(resp, 'W' = 'word', 'N' = 'nonword'),
)

mutate(blp_df,
       across(c(lex, resp), 
              ~recode(., 'W' = 'word', 'N' = 'nonword')
       )
)

mutate(blp_df, fast_rt = rt < 400)

mutate(blp_df, 
       rt_speed = if_else(rt < 400, 'fast', 'slow'))

mutate(blp_df,
       rt_speed = case_when(
         rt > 900 ~ 'slow',
         rt < 600 ~ 'fast',
         TRUE ~ 'medium' 
       )
)

transmute(blp_df,
          accuracy = lex == resp,
          word_length = str_length(spell),
          long_word = word_length > 5)


# Sorting with arrange ----------------------------------------------------

arrange(blp_df, rt)
arrange(blp_df, desc(rt))
arrange(blp_df, spell)
arrange(blp_df, desc(spell))
arrange(blp_df, participant)
arrange(blp_df, participant, rt)


# Pipelines with pipes ----------------------------------------------------

x <- c(1, 2, 5, 10, 20)
log(x)
sqrt(log(x))
sum(sqrt(log(x)))
log(sum(sqrt(log(x))))

log_x <- log(x)
sqrt(log_x)

log(x)

x %>% log()

x %>% log() %>% sqrt() %>% sum() %>% log()

blp_df2 <- mutate(blp_df, accuracy = lex == resp)
blp_df3 <- filter(blp_df2, accuracy == TRUE)
select(blp_df3, participant, resp, rt)


mutate(blp_df, accuracy = lex == resp) %>% 
  filter(accuracy == TRUE) %>% 
  select(participant, resp, rt)

blp_df %>% 
  mutate(accuracy = lex == resp) %>% 
  filter(accuracy == TRUE) %>% 
  select(participant, resp, rt)

blp_clean_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/blp-trials-short.txt") %>% 
  mutate(accuracy = lex == resp) %>% 
  filter(accuracy == TRUE) %>% 
  select(participant, resp, rt)


# Summarize with summarize ------------------------------------------------


summarise(blp_df, 
          mean_rt = mean(rt, na.rm = T),
          median_rt = median(rt, na.rm = T),
          std_rt = sd(rt, na.rm = T),
          n_resp_w = sum(resp == 'W')
)

summarise(blp_df,
          mean_rt = mean(rt, na.rm = T),
          mean_prev_rt = mean(prev.rt, na.rm = T),
          mean_rt_raw = mean(rt.raw, na.rm = T)
)

summarise(blp_df,
          across(rt:rt.raw, ~ mean(., na.rm = T)
    )
)

summarise(blp_df,
          across(where(is.numeric), ~ mean(., na.rm = T)
          )
)


summarize(blp_df,
          across(rt:rt.raw,
                 list(avg = ~ mean(., na.rm = T),
                      stdev = ~ sd(., na.rm = T))
          )
)


# split-apply-combine with group_by and summarize -------------------------

group_by(blp_df, lex) %>% 
  summarize(avg = mean(rt, na.rm = T),
            stdev = sd(rt, na.rm = T),
            spell = spell[1])

group_by(blp_df, lex) %>% 
  summarize(across(rt:rt.raw,
                   list(avg = ~ mean(., na.rm = T),
                        stdev = ~ sd(., na.rm = T))
  )
)


# Combining data frames ---------------------------------------------------

Df_1 <- tibble(x = c(1, 2, 3),
               y = c(2, 7, 1),
               z = c(0, 2, 7))

Df_2 <- tibble(y = c(5, 7),
               z = c(6, 7),
               x = c(1, 2))

Df_3 <- tibble(a = c(5, 6, 1),
               b = c('a', 'b', 'c'),
               c = c(T, T, F))

Df_a <- tibble(x = c(1, 2, 3),
               y = c('a', 'b', 'c'))

Df_b <- tibble(x = c(2, 3, 4),
               z = c('d', 'e', 'f'))

Df_4 <- tibble(x = c(1, 2, 3),
               y = c(2, 7, 1),
               z = c(0, 2, 7))

Df_5 <- tibble(a = c(1, 1, 7),
               b = c(2, 3, 7),
               c = c('a', 'b', 'c'))

Df_6 <- tibble(x = c(1, 2, 3),
               y = c(4, 5, 6),
               z = c(7, 8, 9))

Df_7 <- tibble(y = c(6, 7),
               z = c(9, 10),
               x = c(3, 4))


bind_rows(Df_1, Df_2)
bind_rows(Df_2, Df_1)
bind_cols(Df_1, Df_3)


inner_join(Df_a, Df_b)
left_join(Df_a, Df_b)
right_join(Df_a, Df_b)
full_join(Df_a, Df_b)

blp_stimuli <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/blp_stimuli.csv")


inner_join(blp_df, blp_stimuli)
left_join(blp_df, blp_stimuli)

all_equal(inner_join(blp_df, blp_stimuli),
          left_join(blp_df, blp_stimuli))


right_join(blp_df, blp_stimuli)


inner_join(Df_4, Df_5) # errors
inner_join(Df_4, Df_5, by = c('x' = 'a'))


# Reshaping with pivots ---------------------------------------------------

recall_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/repeated_measured_a.csv")

recall_df_long <- pivot_longer(recall_df, 
                               -Subject, 
                               names_to = 'condition',
                               values_to = 'score')


pivot_wider(recall_df_long,
            names_from = 'condition',
            values_from = 'score')


recall_df_b <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/repeated_measured_b.csv")


pivot_longer(recall_df_b,
             cols = -Subject,
             names_to = 'condition',
             values_to = 'score')


# reading multiple csv files ----------------------------------------------
# See the following blog post: https://www.mjandrews.org/blog/readmultifile/
library(fs)

data_df_list <- dir_ls('data/exp_data') %>% 
  map(read_csv, id = 'name')

bind_rows(data_df_list, .id = 'name')
