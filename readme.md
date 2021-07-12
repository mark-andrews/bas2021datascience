# Advanced Statistics and Data Science training course

In this four day course (Sept 14, Sept 16, Sept 21, Sept 23), we provide an introduction to some
advanced topics in statistics and data science.  In particular, we will cover
the following topics: Data wrangling using `dplyr` and `tidyr`; data
visualization using `ggplot`; how to read in and process and visualize NetCDF
satellite data; programming in R using loops and functionals; reproducible data
analysis with RMarkdown; general linear models; generalized linear models,
including models for count data.

## Teaching Format

This course will be practical, hands-on, and workshop based. For some topics, there will a very minimal amount of lecture style presentations, i.e., using slides or blackboard, to introduce and explain key concepts and theories, but almost all of our time will be spent doing data wrangling using R. Any code that the instructor produces during these sessions will be uploaded to a publicly available GitHub site after each session.

The course will take place online using Zoom. On each day, the live video broadcasts will occur between (UK local times) at:

* 8.30-10.30pm
* 11.30-1.30pm
* 2.30-4.30pm
 
All sessions will be video recorded and made available to all attendees as soon as possible, hopefully soon after each 2hr session.
  
Although not strictly required, using a large monitor or preferably even a second monitor will make the learning experience better, as you will be able to see my RStudio and your own RStudio simultaneously. 

## Assumed quantitative knowledge

We will assume familiarity with the most of basic concepts of descriptive and inferential statistics.

## Assumed computer background

Minimal prior experience with R and RStudio is required. Attendees should be familiar with some basic R syntax and commands, how to write code in the RStudio console and script editor, how to load up data from files, etc. 

## Equipment and software requirements

Attendees of the course will need to use RStudio. Most people will want to use their own computer on which they install the RStudio desktop software. This can be done Macs, Windows, and Linux, though not on tablets or other mobile devices. Instructions on how to install and configure all the required software, which is all free and open source, will be provided before the start of the course. We will also provide time at the beginning of the workshops to ensure that all software is installed and configured properly. 

An alternative to using a local installation of RStudio is to use RStudio cloud (https://rstudio.cloud/). This is a free to use and full featured web based RStudio. It is not suitable for computationally intensive work but everything done in this class can be done using RStudio cloud. 


# Course programme 

## Day 1 (September 14, 2021)

* Topic 1: *Data Wrangling*. Data wrangling is the art of taking raw and messy data and formating and cleaning it so that data analysis and visualization etc may be performed on it. Done poorly, it can be a time consuming, labourious, and error-prone. Fortunately, the tools provided by R's `tidyverse` allow us to do data wrangling in a fast, efficient, and high-level manner, which can have dramatic consequence for ease and speed with which we analyse data. In this topic, we cover in detail all the `dplyr` tools such as `select`, `filter`, `mutate`, `summarize`, etc. Here, we will also cover the pipe operator (`%>%`) to create data wrangling pipelines that take raw messy data on the one end and return cleaned tidy data on the other. We will also cover reshaping data with pivot operations, and merging data frames with join operations.

## Day 2 (September 16, 2021)

* Topic 2: *Data visualization*. We begin by providing an overview of the general principles behind ggplot. We then proceed to cover the major types of plots for visualizing distributions of univariate data: histograms, density plots, barplots, and Tukey boxplots. In all of these cases, we will consider how to visualize multiple distributions simultaneously on the same plot using different colours and "facet" plots. We then turn to the visualization of bivariate data using scatterplots. Here, we will explore how to apply linear and nonlinear smoothing functions to the data, how to add marginal histograms to the scatterplot, add labels to points, and scale each point by the value of a third variable. 

* Topic 3: *Processing and visualizing NetCDF satellite data*. As a continuation of the topics of wrangling and visualization, here we cover how to process and visualize [NetCDF](https://en.wikipedia.org/wiki/NetCDF) satellite data.

## Day 3 (September 21, 2021)

* Topic 4: *Programming in R*. Here, we cover the basics of programming in R, particularly covering loops. We will also cover how the operations performed by loops can be covered by *functionals*. In base R, the major functionals are the apply family (lappy, sapply, vapply, mapply). In the tidyvese, these are providing by the `map` family, which are more powerful and easier to use the apply family.

* Topic 5: *Reproducible reports with RMarkdown*. RMarkdown is a file format that contains a mixture of R code and text and from which we can produce data analysis reports (or slides, web pages, etc). The report is produced by automatically executing all the analysis code in the RMarkdown file and inserting the results, such as tables, figures, etc., along with the text into the final pdf, html, or MS Word output document. We will cover the basics of RMarkdown, and in addition we will cover how to do mathematical typesetting with LaTeX; bibliography and citation management; cross references; formatting tables. We will primarily focus on creating articles as the output format, but will also show how to create web pages and slides.


## Day 4 (September 23, 2021)

* Topic 6: *Normal linear models*. In normal linear models, we model an outcome variable as normally distributed around a mean that varies as a linear function of predictors, which can be a mixture of continuous and categorical variables. Normal linear models are extremely widely used --- they include t-tests, linear regression, anova, ancova, etc --- and they also serve as the conceptual basis for many other extremely widely used methods including linear mixed effects models and generalized linear models.

* Topic 7: *Generalized linear models*. Generalized linear models are generalizations of the normal linear models for situations where the outcome variable is, for example, a binary, or ordinal, or count variable, etc. The specific models we cover include binary, binomial, ordinal, and categorical logistic regression, Poisson and negative binomial regression for count variables. We will also cover zero-inflated Poisson and negative binomial regression models. 
