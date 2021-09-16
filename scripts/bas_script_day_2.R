library(tidyverse)

data_df <- tibble(var1 = c(1, 3, 7, 11), 
                  var2 = c(5, 7, 10, 12), 
                  var3 = c('a', 'b', 'a', 'b')
)

# this creates a blank canvas, axes only
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
)

# this add points to the axes
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_point()

# this add a line to the axes
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line()

# this add a line AND points to the axes
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line() + geom_point()

# this add a line AND points to the axes
p0 <- ggplot(data_df,
       aes(var1, var2)
) 
p0 + geom_line()
p0 + geom_point()
p0 + geom_point() + geom_line()

p1 <- p0 + geom_line()
p1 + geom_point()

# same as above, but var3 mapped to colour
ggplot(data_df,
       aes(var1, var2, colour = var3)
) + geom_point()

# same as above, but var3 mapped to point shape
ggplot(data_df,
       aes(var1, var2, shape = var3)
) + geom_point()

# same as above, but var3 mapped to point shape and point colour
ggplot(data_df,
       aes(var1, var2, shape = var3, colour = var3)
) + geom_point()

# 
ggplot(data_df,
       aes(var1, var2, colour = var3, linetype = var3)
) + geom_line()

weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/weight.csv")


# histogram of weight
ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram()

# histogram of weight, specify the number of bins
ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(bins = 50)

ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(binwidth = 2)

ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(binwidth = 2, colour = 'white', fill = 'red')

# use gender as a grouping variable
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, colour = 'white')

# use gender as a grouping variable
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, 
                   colour = 'white',
                   position = 'dodge')

# use gender as a grouping variable
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, 
                   colour = 'white',
                   position = 'identity',
                   alpha = 0.5)

# use gender as a grouping variable
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 5, 
                   colour = 'white',
                   position = 'fill')

titanic_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/TitanicSurvival.csv")


ggplot(titanic_df,
       aes(x = survived)
) + geom_bar()


ggplot(titanic_df,
       aes(x = survived, fill = sex)
) + geom_bar()
