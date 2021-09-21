p <- c(0.1, 0.2, 0.5, 0.75, 0.9)

log(p/(1-p), base = 2)
log(p/(1-p), base = 3)
log(p/(1-p), base = 10)

q <- c(0.25, 0.67, 0.95)
log(p/(1-p), base = 10)

log_odds <- function(p, b){
  # code body, takes the values of p and b that we supply
  # when we call the function
  log(p/(1-p), base = b)
}

log_odds(p, 2)
log_odds(p, 3)
log_odds(q, 10)

log_odds <- function(p, b = 2){
  # code body, takes the values of p and b that we supply
  # when we call the function
  log(p/(1-p), base = b)
}

log_odds(p)
# same as
log_odds(p, 2)
# but not same as 
log_odds(p, 10)

log_odds(b = 10, p = p)

#log_odds <- function(p, b) log(p/(1-p), base = b)


log_odds_3 <- function(p, b = 2){
  odds <- p/(1-p)
  log(odds, base = b)
}

log_odds_3(p)
log_odds(p)

log_odds_4 <- function(p, b = 2){
  odds <- p/(1-p)
  w <- log(odds, base = b)
}


log_odds(p)
log_odds_3(p)
log_odds_4(p)

log_odds_5 <- function(p, b = 2){
  odds <- p/(1-p)
  w <- log(odds, base = b)
  w
}

log_odds_5(p)

log_odds_6 <- function(p, b = 2){
  odds <- p/(1-p)
  w <- log(odds, base = b)
  return(w)
}

log_odds_6(p)


log_odds_7 <- function(p, b = 2){
  odds <- p/(1-p)
  w <- log(odds, base = b)
  return(w)
  10101
}

increment_x <- function(x){
  x + 1
}

increment_x(23)

x <- 38
increment_x(x)


increment_x_2 <- function(x){
  x <- x + 1
  x
}

increment_x_3 <- function(){
  x <- x + 1
  x
}


increment_y <- function(){
  y <- y + 1
  y
}

increment_x_4 <- function(){
  x <<- x + 1
  x
}


f <- function(x, g){
  g(x)
}

y <- c(10, 100, 200, 500)
f(x = y, g = sum)
f(x = y, g = mean)
f(x = y, g = log)

log_sqrt <- function(x) log(sqrt(x))
log_sqrt <- function(x) {log(sqrt(x))}

log_sqrt <- function(x) {
  log(sqrt(x))
}

log_sqrt(y)

f(x = y, g = log_sqrt)

f(x = y, g = function(x) log(sqrt(x)))
f(x = y, g = log(sqrt(.)))


# conditionals ------------------------------------------------------------

data_df <- tibble(x = c(1, 2, 3))

write_csv(data_df, file = 'data_df.csv')

write_to_file <- TRUE # or false

# option 1
if (write_to_file){
  write_csv(data_df, file = 'data_df.csv')
}

# option 2
if (write_to_file == TRUE){
  write_csv(data_df, file = 'data_df.csv')
}

if (write_to_file == 'foobar'){
  write_csv(data_df, file = 'data_df_1.csv')
}

file_name_suffix <- 1

if (file_name_suffix == 1){
  write_csv(data_df, file = 'data_df_1.csv')
} else {
  write_csv(data_df, file = 'data_df_x.csv')
}

file_name_suffix <- 101

x <- 42

if (x) {
  print('x is true')
} else {
  print('x is false')
}
  
x <- 42
if (x < 0){
  print('x is less than 0')
} else if (x > 0) {
  print('x is greater 0')
}


x <- 0
if (x < 0){
  print('x is less than 0')
} else if (x > 0) {
  print('x is greater than 0')
}

x <- 0
if (x < 0){
  print('x is less than 0')
} else if (x > 0) {
  print('x is greater than 0')
} else {
  print('x is equal to 0')
}

x <- 0
if (x < 0){
  print('x is less than 0')
} else {
  if (x > 0) {
    print('x is greater than 0')
  } else {
    print('x is equal to 0')
  } 
}
  
h <- function(x){
  if (x < 0){
    -1
  } else if (x > 0){
    1 
  } else {
    0
  }
}

h(-10)
h(-42)
h(42)
h(0)



# for loops ---------------------------------------------------------------

x <- seq(-5, 5)
h(x)
x
h(x[1])
h(x[2])
h(x[3])
# ...
h(x[11])


for (x_i in x){
  print(h(x_i))
}

for (foo in x){
  print(h(foo))
}

# iteration 1
# x_i takes value x[1]
# then we run 
# print(h(x_i))
# then
# on iteration 2
# x_i takes value x[2]
# then we run 
# print(h(x_i))


for (i in 1:11){
  print(h(x[i]))
}
for (i in 1:length(x)){
  print(h(x[i]))
}

for (i in seq_along(x)){
  print(h(x[i]))
}
k <- 2
while (2^k < 1e6){
  print(k)
  k <- k + 1
}

k <- 2
while (TRUE) {
  
  if (2^k > 1e6){
    break
  }
  
  print(k)
  k <- k + 1
}


# functionals -------------------------------------------------------------

y <- numeric(length(x))
for (i in seq_along(x)){
  y[i] <- h(x[i])
}

lapply(x, h) %>% unlist()
lapply(x, h) %>% as.numeric()

# this code here
y <- vector('list', length(x))
for (i in seq_along(x)){
  y[[i]] <- h(x[i])
}
# is identical to this
lapply(x, h)

sapply(x, h)

data_list <- list(x = c(1, 2, 3),
                  y = c(NA, 2, 5),
                  z = c(NA, 3, 10, 20)
)

lapply(data_list, mean)
sapply(data_list, mean)

mean(x, na.rm = TRUE)

lapply(data_list, mean, na.rm = TRUE)
sapply(data_list, mean, na.rm = TRUE)

filenames <- list.files('exp_data', full.names = TRUE)

# for each filename in the list of filenames
#  do read_csv(filename) and save that as element of a list
data_list <- lapply(filenames, read_csv)

data_df <- bind_rows(data_list)
dim(data_df)

data_df_2 <- list.files('exp_data', full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows()

all_equal(data_df_2, data_df)

# do lapply using purrr:map
data_list <- map(filenames, read_csv)


map(x, h)
map_dbl(x, h)

data_df_3 <- map_dfr(filenames, read_csv)
all_equal(data_df_2, data_df)
