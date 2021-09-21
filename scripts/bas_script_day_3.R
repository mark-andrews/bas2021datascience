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
