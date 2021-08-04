#' Install R packages relevant for the book 'R for Non-Programmers: A Guide for Social Scientists'.
#'
#' @details Installs the following R packages at once:
##' \itemize{
##'  \item{tidyverse: }{A package to install the core tidyverse packages.}
##'  \item{janitor: }{A package to help clean data, e.g. colum names, etc.}
##'  \item{naniar: }{A package to inspect and handle missing data.}
##'  \item{psych: }{A acpakge to compute all kinds of statistics relevant to Social Sciences.}
##'  \item{skimr: }{A quick way to retrieve descriptive statistics and 'skim' your data.}
##'  \item{correlation: }{A package with advanced functionality to perform correlations.}
##'  \item{rcompanion: }{A package with additional functions, such as for effect sizes.}
##'  \item{effectsize: }{A package that helps to compute and interpret effect sizes.}
##'  \item{car: }{A package to help interpret regression results}
##'  \item{FSA: }{NOT SURE}
##'  \item{jtools: }{A package which helps to retrieve nicely formatted output from regressions.}
##'  }
#' @examples
#' \dontrun{
#' # Run this line of code to install all relevant packages
#' install_r4np()
#' }
#' @export
install_r4np <- function() {
  utils::install.packages(c(
    "tidyverse",     # package for using the tidyverse
    "janitor",       # clean names of columns. #data-wrangling
    "naniar",        # mnissing data
    "psych",         # descriptive stats, Cronbach's alpha and general stats
    "skimr",         # inspect your data quickly and easily
    "correlation",   # compute correlations
    "rcompanion",    # some more effect sizes not included in 'effectsize'
    "effectsize",    # compute and check various effect sizes
    "car",           # check whether it is really needed
    "FSA",           # check whether it is really needed
    "jtools"         # show regression results as nicely formatted output
    # Add packages related to mixed-methods research
  ))

  message("The following packages have been installed or updated:",
          "\n- tidyverse",
          "\n- janitor",
          "\n- naniar",
          "\n- psych",
          "\n- skimr",
          "\n- correlation",
          "\n- rcompanion",
          "\n- effectsize",
          "\n- car",
          "\n- FSA",
          "\n- jtools", sep = "\n")
}
