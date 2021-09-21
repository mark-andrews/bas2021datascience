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


ggplot(titanic_df,
       aes(x = survived, fill = sex)
) + geom_bar(position = 'dodge')

ggplot(titanic_df,
       aes(x = survived, fill = sex)
) + geom_bar(position = 'identity',
             alpha = 0.5)


car_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/carprice.csv")

car_df %>% 
  group_by(Type) %>% 
  summarise(price = mean(Price)) %>% 
  ggplot(aes(x = Type, y = price)) + 
  geom_bar(stat = 'identity')

car_df %>% 
  group_by(Type) %>% 
  summarise(price = mean(Price)) %>% 
  ggplot(aes(x = Type, y = price)) + 
  geom_col()


# Boxplots ----------------------------------------------------------------

ggplot(swiss,
       aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25) 

ggplot(swiss,
       aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25) +
  coord_flip()

ggplot(swiss,
       aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25) +
  coord_flip() +
  geom_point()

ggplot(swiss,
       aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.25, outlier.shape = NA) +
  coord_flip() +
  geom_jitter(width = 0.05)

swiss %>% 
  mutate(catholic = Catholic > 50) %>% 
  ggplot(aes(y = Fertility, x = catholic)) +
  geom_boxplot(width = 0.25, outlier.shape = NA) +
  geom_jitter(width = 0.05, size = 0.5)

swiss %>% 
  mutate(catholic = Catholic > 50) %>% 
  ggplot(aes(y = Fertility, x = catholic, colour = catholic)) +
  geom_boxplot(width = 0.25, outlier.shape = NA) +
  geom_jitter(width = 0.05, size = 0.5)


ggplot(ToothGrowth,
       aes(x = dose, y = len, colour = supp)
) + geom_boxplot()

ToothGrowth %>% mutate(dose = factor(dose)) %>% 
  ggplot(aes(x = dose, y = len, colour = supp)) +
  geom_boxplot()

ggplot(ToothGrowth,
       aes(x = factor(dose), y = len, colour = supp)
) + geom_boxplot()


ggplot(ToothGrowth,
       aes(x = dose, y = len, colour = supp, group = dose)
) + geom_boxplot()

ggplot(ToothGrowth,
       aes(x = dose, 
           y = len, 
           colour = supp, 
           group = interaction(supp, dose))
) + geom_boxplot()


ggplot(ToothGrowth,
       aes(x = dose, 
           y = len, 
           colour = supp, 
           group = interaction(supp, dose))
) + geom_boxplot() +
  geom_jitter(position = position_jitterdodge(
    dodge.width = 1/3,
    jitter.width = 1/3 * 0.5), 
              size = 0.85, 
              alpha = 0.75)


ggplot(ToothGrowth,
       aes(x = dose, 
           y = len, 
           colour = supp, 
           group = interaction(supp, dose))
) + geom_boxplot() +
  geom_jitter(position = position_jitterdodge(dodge.width = 1/3, 
                                              jitter.width = 1/3 * 0.5), 
              size = 0.85, 
              alpha = 0.75)


# scatterplot -------------------------------------------------------------

ggplot(weight_df,
       aes(x = height, y = weight)
) + geom_point(size = 0.5)

ggplot(weight_df,
       aes(x = height, y = weight)
) + geom_point(alpha = 0.5)

# scatterplot, one per gender
ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(alpha = 0.5)

ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(alpha = 0.5) + geom_rug(size = 0.1)

ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(alpha = 0.5, size = 0.5) +
  stat_smooth(method = 'lm', 
              formula = y ~ x,
              se = FALSE,
              fullrange = TRUE)

ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(alpha = 0.5, size = 0.5) +
  stat_smooth(method = 'lm', 
              formula = y ~ poly(x,2),
              se = FALSE,
              fullrange = TRUE)

ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(alpha = 0.5, size = 0.5) +
  stat_smooth(method = 'gam', 
              formula = y ~ s(x, bs = 'cs'))

ggplot(swiss,
       aes(x = Examination, y = Fertility)
) + geom_point() +
  stat_smooth()


sleep_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/bas2021datascience/master/data/sleepstudy.csv")

ggplot(sleep_df,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() +
  stat_smooth(method = 'lm', se = FALSE)

ggplot(sleep_df,
       aes(x = Days, y = Reaction, group = Subject)
) + geom_point() +
  stat_smooth(method = 'lm', se = FALSE)

ggplot(sleep_df,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() +
  stat_smooth(method = 'lm', se = FALSE) +
  facet_wrap(~Subject) +
  theme_minimal()



# Working with NetCDF -----------------------------------------------------

ice_file <- system.file("extdata", "ifremer", "20171002.nc", package = "tidync", mustWork = TRUE)
library(tidync)
tidync(ice_file)

metR::GlanceNetCDF(ice_file)
RNetCDF::print.nc(RNetCDF::open.nc(ice_file))



# gunzip a nc.gz file -----------------------------------------------------

R.utils::gunzip('gistemp1200_GHCNv4_ERSSTv5.nc.gz', remove = FALSE)
gistempfile <- 'gistemp1200_GHCNv4_ERSSTv5.nc'

tidync(gistempfile)
metR::GlanceNetCDF(gistempfile)

f <- ncdf4::nc_open(gistempfile)
ncdf4::ncvar_get(f, 'time')
ncdf4::ncvar_get(f, 'lon')
ncdf4::ncvar_get(f, 'lat')


## Pull out *all* variables from active grid
## and return as a tibble
gistemp_df <- tidync(gistempfile) %>% 
  hyper_tibble()

library(lubridate)
ymd('1800-01-01')

gistemp_df %>% 
  mutate(date = ymd('1800-01-01') + time) %>% 
  tail()

tidync(gistempfile)

tidync(gistempfile) %>% 
  hyper_filter(time = time < 50000)

tidync(gistempfile) %>% 
  hyper_filter(time = index < 10)


gistemp_df %>% 
  mutate(date = ymd('1800-01-01') + time) %>% 
  filter(time < 50000) %>%
  tail()


gistemp_1700_df <- tidync(gistempfile) %>% 
  hyper_filter(time = index == 1700) %>% 
  hyper_tibble() %>% 
  mutate(date = ymd('1800-01-01') + time)

ggplot(gistemp_1700_df,
       aes(x = lon, y = lat, fill = tempanomaly)
) + geom_raster() +
  scale_fill_gradient2(low = 'blue', high = 'red') +
  coord_quickmap()

# this works
tidync(gistempfile) %>% 
  hyper_filter(time = index == 1700)

# but this does not work
tidync(gistempfile) %>% 
  hyper_filter(time = index %in% c(10, 100, 1000, 1700))

tidync(gistempfile) %>% 
  hyper_tibble()

f <- ncdf4::nc_open(gistempfile)
time_index <- ncdf4::ncvar_get(f, 'time')
time_index[c(10, 100, 1000, 1700)]

nc_df <- tidync(gistempfile) %>% 
  hyper_tibble() %>% 
  filter(time %in% time_index[c(10, 100, 1000, 1700)]) %>% 
  mutate(date = ymd('1800-01-01') + time)

nc_df

# ggplot(mapping = aes(x = lon, y = lat, fill = tempanomaly),
#        data = nc_df)

ggplot(nc_df,
       aes(x = lon, y = lat, fill = tempanomaly)
) + geom_raster() +
  scale_fill_gradient2(low = 'blue', high = 'red') +
  coord_quickmap() +
  facet_wrap(~date) +
  theme_minimal()



world_df <- map_data('world')

ggplot() +  
  geom_raster(mapping = aes(x = lon, y = lat, fill = tempanomaly),
              inherit.aes = F,
              data = data_t1700_df) +
  scale_fill_gradient2(low = 'blue', high = 'red') +
  geom_polygon(
    data = world_df,
    mapping = aes(x = long, y = lat, group = group),
    fill = 'white', colour = 'grey50', alpha = 0.0) +
  coord_quickmap() +
  theme_classic()
