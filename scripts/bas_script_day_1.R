library(tidyverse)

blp_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/blp-trials-short.txt")

glimpse(blp_df)

# dplyr verbs:

# select
# rename 
# slice
# filter 
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
