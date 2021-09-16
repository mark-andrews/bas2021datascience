library(tidyverse)

data_df <- tibble(var1 = c(1, 3, 7, 11), 
                  var2 = c(5, 7, 10, 12), 
                  var3 = c('a', 'b', 'a', 'b')
)

# ggplot object with a layer of points
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_point()
       
# ggplot object with a layer with a line
ggplot(data_df,
       mapping = aes(x = var1, y = var2)
) + geom_line()

p1 <- ggplot(data_df,
             mapping = aes(x = var1, y = var2)
)

# scatterplot (as above)
p1 + geom_point()

# line plot (as above)
p1 + geom_line()

# points and line plot
p1 + geom_point() + geom_line()

# create a ggplot object with x, y, and colour mapping
p2 <- ggplot(data_df,
             mapping = aes(x = var1, y = var2, colour = var3)
)

p2 + geom_point() 
p2 + geom_line()
p2 + geom_point() + geom_line()

# create a ggplot obj with x,y, and shape mapping
p3 <- ggplot(data_df,
             mapping = aes(x = var1, y = var2, shape = var3)
)

p3 + geom_point()
p3 + geom_line()
p3 + geom_point(size = 10)

# create a ggplot obj with x,y, and linetype mapping
p4 <- ggplot(data_df,
             mapping = aes(x = var1, y = var2, linetype = var3)
)

p4 + geom_point()
p4 + geom_line()


# create a ggplot obj with x,y, and linetype, colour, shape mapping
p5 <- ggplot(data_df,
             mapping = aes(x = var1, 
                           y = var2, 
                           linetype = var3,
                           colour = var3,
                           shape = var3)
)

p5 + geom_point()
p5 + geom_line()
p5 + geom_point() + geom_line()

# different versions of the same thing: 
p6 <- ggplot(data_df,
             mapping = aes(x = var1, 
                           y = var2)
)

p7 <- ggplot(data_df, aes(var1, var2))

p7 <- ggplot(data_df, aes(var1, var2, colour = var3))

# aes mapping specific for e.g geom_point 

ggplot(data_df) +
  geom_point(aes(var1, var2)) +
  geom_line(aes(var1, var2))

ggplot(data_df, aes(var1, var2)) +
  geom_point(aes(colour = var3)) +
  geom_line(aes(linetype = var3))


# get data from url
weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/dvgg02/master/data/weight.csv")

# histogram of weight,using all the defaults...
ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram()

# histogram of weight, usings bins = 10
ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(bins = 10)

ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(bins = 50)

ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(binwidth = 2)

ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(binwidth = 2, colour = 'white')


# multiple histogram; one per each gender
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, colour = 'white')

# multiple histogram; one per each race
ggplot(weight_df, 
       mapping = aes(x = weight, fill = factor(race)),
) + geom_histogram(binwidth = 2, colour = 'white')

# multiple histogram; one per each gender
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, colour = 'white', position = 'fill')

# multiple histogram; one per each gender
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, colour = 'white', position = 'dodge')

# multiple histogram; one per each gender; side by side
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(bins = 10, colour = 'white', position = 'dodge')

# one on top of the other style, aka "identity"
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, 
                   colour = 'white', 
                   position = 'identity')

# make fill transparent, and change colour of border
ggplot(weight_df, 
       mapping = aes(x = weight, colour = gender)
) + geom_histogram(binwidth = 2, 
                   fill = NA,
                   position = 'identity')

# change transparency for fill etc using alpha
ggplot(weight_df, 
       mapping = aes(x = weight, fill = gender)
) + geom_histogram(binwidth = 2, 
                   colour = 'white', 
                   alpha = 0.8,
                   position = 'identity')



# bar plots ---------------------------------------------------------------

titanic_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/dvgg02/master/data/TitanicSurvival.csv")

# a bar plot showing number of observation per each 
# value of the variable "survived"
ggplot(titanic_df,
       mapping = aes(x = survived)
) + geom_bar()

group_by(titanic_df, survived) %>% 
  summarize(n = n())

# a bar plot showing number of observation per each 
# value of the variable "survived", coloured by sex
ggplot(titanic_df,
       mapping = aes(x = survived, fill = sex)
) + geom_bar()


# a bar plot showing number of observation per each 
# value of the variable "sex", coloured by "survived"
ggplot(titanic_df,
       mapping = aes(x = sex, fill = survived)
) + geom_bar()

# a bar plot showing proportion of survivors per sex
ggplot(titanic_df,
       mapping = aes(x = sex, fill = survived)
) + geom_bar(position = 'fill')

# number of survivors and non-survivors, per each sex
ggplot(titanic_df,
       mapping = aes(x = sex, fill = survived)
) + geom_bar(position = 'dodge')

ggplot(titanic_df,
       mapping = aes(x = sex, fill = survived)
) + geom_bar(position = 'identity', alpha = 0.65)

# barplots without the counting
carprice_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/dvgg02/master/data/carprice.csv")

carprice_avg <- group_by(carprice_df, Type) %>% 
  summarize(price = mean(Price))

# this is not quite right
ggplot(carprice_avg,
       mapping = aes(x = Type)
) + geom_bar()

# to use the y axis value, use geom_bar with stat = 'identity'
ggplot(carprice_avg,
       mapping = aes(x = Type, y = price)
) + geom_bar(stat = 'identity')

# or else 
ggplot(carprice_avg,
      mapping = aes(x = Type, y = price)
) + geom_col()

rats_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/dvgg02/master/data/FatRats.csv")

ggplot(rats_df,
       mapping = aes(x = Source, y = Gain, fill = Protein)
) + geom_col()

group_by(rats_df, Source) %>% summarize(sum(Gain))
ggplot(rats_df,
       mapping = aes(x = Source, y = Gain, fill = Protein)
) + geom_col(position = 'dodge')

ggplot(rats_df,
       mapping = aes(x = Source, y = Gain, fill = Protein)
) + geom_col(position = 'identity', alpha = 0.6)


# Boxplot -----------------------------------------------------------------

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot()

ggplot(swiss, 
       mapping = aes(y = Fertility)
) + geom_boxplot()

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1)

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1) + coord_flip()

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1) + coord_flip() + geom_point()

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1) + 
  coord_flip() + 
  geom_jitter()

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1) + 
  coord_flip() + 
  geom_jitter(width = 0.05)

# make the outliers invisible
ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1, outlier.shape = NA) + 
  coord_flip() + 
  geom_jitter(width = 0.05)

ggplot(swiss, 
       mapping = aes(x = '', y = Fertility)
) + geom_boxplot(width = 0.1, outlier.shape = NA) + 
  geom_jitter(width = 0.05) +
  geom_rug(sides = 'l') +
  coord_flip()


swiss_df <- swiss %>%
  rownames_to_column('province') %>% 
  mutate(is_catholic = Catholic > 50)
  

ggplot(swiss_df,
       mapping = aes(x = is_catholic, y = Fertility)
) + geom_boxplot(width = 0.2, outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.67)

ggplot(swiss_df,
       mapping = aes(x = is_catholic, 
                     y = Fertility,
                     colour = is_catholic)
) + geom_boxplot(width = 0.2, outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.67)

ggplot(swiss_df,
       mapping = aes(x = is_catholic, 
                     y = Fertility,
                     fill = is_catholic)
) + geom_boxplot(width = 0.2, outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.67)

ggplot(swiss_df,
       mapping = aes(x = is_catholic, 
                     y = Fertility,
                     fill = is_catholic)
) + geom_boxplot(width = 0.2,
                 varwidth = TRUE,
                 outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.67)

ggplot(swiss_df,
       mapping = aes(x = is_catholic, 
                     y = Fertility,
                     fill = is_catholic)
) + geom_boxplot(width = 0.2,
                 varwidth = TRUE,
                 notch = TRUE,
                 outlier.shape = NA) + 
  geom_jitter(width = 0.05, size = 0.67)


# this does not do what we want ...
ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, colour = supp)
) + geom_boxplot()

# so, we need to discretize the x variable
ggplot(ToothGrowth,
       mapping = aes(x = factor(dose), y = len, colour = supp)
) + geom_boxplot()

# or better, use group
ggplot(ToothGrowth,
       mapping = aes(x = factor(dose), 
                     y = len, 
                     colour = supp, 
                     group = interaction(dose, supp))
) + geom_boxplot(outlier.shape = NA) +
  geom_jitter(position = position_jitterdodge(jitter.width = 0.25), 
              size = 0.5)


# scatterplot -------------------------------------------------------------

ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point()

ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(size = 0.5)

ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(alpha = 0.5, size = 0.7)

ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point()

# colour coding by a continuous variable
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = race)
) + geom_point()


# colour coding by a discrete variable with seven values
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = factor(race))
) + geom_point()

# colour coding by a discrete variable with two values
ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight, 
                     colour = gender)
) + geom_point() +
  geom_rug()

# colour coding by a discrete variable with two values
ggplot(weight_df,
       mapping = aes(x = height, 
                     y = weight, 
                     colour = gender)
) + geom_point() +
  geom_rug(size = 0.1, alpha = 0.5)

library(ggExtra)

p8 <- ggplot(weight_df,
             mapping = aes(x = height, 
                           y = weight, 
                           colour = gender)
) + geom_point() 

ggMarginal(p8)

p9 <- ggplot(weight_df,
             mapping = aes(x = height, 
                           y = weight, 
                           colour = gender)
) + geom_point() +
  theme_classic() +
  theme(legend.position = 'bottom')

ggMarginal(p9,
           type = 'histogram',
           groupFill = TRUE,
           groupColour = TRUE,
           position = 'identity',
           bins = 50)

ggMarginal(p9,
           type = 'boxplot',
           groupFill = TRUE,
           position = 'identity',
           width = 0.5,
           groupColour = TRUE)

p10 <- p9 + geom_rug(size = 0.1, alpha = 0.5)

ggMarginal(p10,
           type = 'histogram',
           groupFill = TRUE,
           groupColour = TRUE,
           position = 'identity',
           bins = 50)



# Scatterplot smoothing ---------------------------------------------------

ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + stat_smooth(method = 'loess', 
                               formula = y ~ x)

ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + stat_smooth(method = 'loess', 
                               formula = y ~ x,
                               level = 0.5,
                               n = 10)

ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + stat_smooth(method = 'loess', 
                               formula = y ~ x,
                               se = F,
                               n = 10)

ggplot(swiss_df,
       mapping = aes(x = Examination, y = Fertility)
) + geom_point() + stat_smooth(method = 'lm', 
                               formula = y ~ x,
                               se = F)


ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     colour = is_catholic)
) + geom_point() +
  stat_smooth(method = 'lm',
              formula = y ~ x,
              se = F)


ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     colour = is_catholic)
) + geom_point() +
  stat_smooth(method = 'lm',
              formula = y ~ x,
              fullrange = TRUE,
              se = F)

# one line of best fit for all 
ggplot(swiss_df,
       mapping = aes(x = Examination, 
                     y = Fertility)
) + geom_point(aes(colour = is_catholic)) +
  stat_smooth(method = 'lm',
              formula = y ~ x,
              fullrange = TRUE,
              colour = 'grey',
              se = F)


# put lines of best fit on top of everything else in p10
p11 <- p10 + stat_smooth(method = 'lm', 
                         se = F, 
                         fullrange = T,
                         formula = y ~ x)

ggMarginal(p11,
           type = 'histogram',
           groupFill = TRUE,
           groupColour = TRUE,
           position = 'identity',
           bins = 50)


# adding labels -----------------------------------------------------------

ggplot(swiss_df,
       aes(x = Examination, y = Fertility, label = province)
) + geom_text()
       

ggplot(swiss_df,
       aes(x = Examination, y = Fertility, label = province)
) + geom_point(alpha = 0.5) + geom_text()

library(ggrepel)
ggplot(swiss_df,
       aes(x = Examination, 
           y = Fertility, 
           label = province)
) + geom_point(alpha = 0.5) + 
  geom_text_repel()

ggplot(swiss_df,
       aes(x = Examination, 
           y = Fertility, 
           label = province)
) + geom_point(alpha = 0.5) + 
  geom_text_repel()

# bubble plot -------------------------------------------------------------


ggplot(midwest,
       aes(x = percollege, 
           y = percprof, 
           size = popdensity)
) + geom_point()

# facetting ---------------------------------------------------------------

# multiple histogram; one per each gender
ggplot(weight_df, 
       mapping = aes(x = weight)
) + geom_histogram(binwidth = 2, colour = 'white') +
  facet_wrap(~gender)

sleep_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/dvgg02/master/data/sleepstudy.csv")

ggplot(sleep_df,
       mapping = aes(x = Days, y = Reaction)
) + geom_point()

ggplot(sleep_df,
       mapping = aes(x = Days, 
                     y = Reaction, 
                     colour = Subject)
) + geom_point() +
  stat_smooth(method = 'lm', 
              se = F, 
              formula = y~x) +
  facet_wrap(~Subject, 
             ncol = 7)

ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point() +
  stat_smooth(method = 'lm', 
              se = F, 
              formula = y ~ x) +
  facet_wrap(~gender)


group_by(weight_df, gender, race) %>% summarize(n = n())


ggplot(filter(weight_df, race <= 4),
       mapping = aes(x = height, y = weight)
) + geom_point() +
  stat_smooth(method = 'lm', 
              se = F, 
              formula = y ~ x) +
  facet_grid(gender ~ race)

weight_df %>% 
  filter(race <= 4) %>% 
  ggplot(mapping = aes(x = height, 
                       y = weight)) + 
  geom_point() +
  facet_grid(race ~ gender)
