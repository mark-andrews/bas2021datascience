The required software for this workshop is all free and open source and will run identically on Windows, Mac OS X, and Linux platforms.

There are a few pieces of software to install:

-   [R](https://www.r-project.org/): An environment for statistical
    computing.
-   [Rstudio](https://www.rstudio.com/): An integrated development
    environment for using R.
-   [tidyverse](https://www.tidyverse.org/): A bundle of R packages to
    use R the modern way.
-   R packages for working with [NetCDF](https://www.unidata.ucar.edu/software/netcdf/) data.
-   Some additional R packages for generalized linear models.

## Installing R

Go to the [R](https://www.r-project.org/) website and follow the links
for downloading. On Windows, this should lead you to

-   <https://cran.r-project.org/bin/windows/base/>.

Downloading this and following the usual Windows installation process,
you\'ll then have a full working version of R.

On Macs, the installation procedure is essentially identical. The latest
Mac installer should be available at

-   <https://cran.r-project.org/bin/macosx/>.

Download this and follow the usual Mac installation process to get a
full working version of R for Macs.

## Installing Rstudio

RStudio is an interface to R. It is not strictly necessary to use RStudio to fully use R. 
You can do everything you need to do with R without using RStudio. 
However, almost everyone who uses R now uses it via RStudio, and it is usually much more convenient and pleasant to use R when working via RStudio. 
To install it, go to the [RStudio](https://www.rstudio.com/) website,
specifically to

-   <https://www.rstudio.com/products/rstudio/download/>

which will list all the available installers. Note that you just want
the Rstudio *desktop* program. The Rstudio *server* is something else
(basically it is for providing remote access to Rstudio hosted on Linux
servers).

Again, you\'ll just follow the usual installation process for Windows or
Macs to install Rstudio using these installers.

## Installing the tidyverse packages

The so-called [tidyverse](https://www.tidyverse.org/) is a collection of
interrelated R packages that implement essentially a new standard
library for R. In other words, the
[tidyverse](https://www.tidyverse.org/) gives us a bundle tools for
doing commonplace data manipulation and visualization and programming.
It represents the modern way to use R, and in my opinion, it\'s the best
way to use R. All the [tidyverse](https://www.tidyverse.org/) packages
can be installed by typing the following command in R:

```r
install.packages("tidyverse")
```

The main packages that are contained within the
[tidyverse](https://www.tidyverse.org/) bundle are listed
[here](https://www.tidyverse.org/packages/).

## R packages for NetCDF data

There are a number of R packages for working with NetCDF data.
We will primarily work with the [tidync](https://cran.r-project.org/package=tidync) packages, but this depends on a number of other NetCDF focused packages, which themselves depend on others.

Although installing some packages will automatically install others, it is probably best to run the following command to explicitly install a set of interrelated packages.
```r
install.packages('devtools')
install.packages(c('ncdf4', 'RNetCDF', 'ncmeta', 'metR', 'stars', 'maps', 'raster', 'tidync'))
```

You can test if the installation was successful by trying the following code:
```r
library(tidync)

ice_file <- system.file("extdata", "ifremer", "20171002.nc", package = "tidync", mustWork = TRUE)
tidync(ice_file)

# using metR
metR::GlanceNetCDF(ice_file)

# using RNetCDF
RNetCDF::print.nc(RNetCDF::open.nc(ice_file))
```

## R packages for generalized linear models

We will use the `glm` and `MASS` packages for doing generalized linear models. Both of these should be installed by default.
In addition, we will use one other package, which provides us functions for zero inflated count models:
```r
install.packages('pscl')
```
