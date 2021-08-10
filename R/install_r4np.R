#' Install R packages relevant for the book 'R for Non-Programmers: A Guide for Social Scientists'.
#'
#' @details Installs the following R packages at once:
##' \itemize{
##'  \item{tidyverse: }{Install the core tidyverse packages.}
##'  \item{janitor: }{The main janitor functions can: perfectly f
##'                   ormat data.frame column names; provide quick
##'                   counts of variable combinations (i.e., frequency
##'                   tables and crosstabs); and isolate duplicate records.}
##'  \item{naniar: }{'naniar' provides data structures and functions that
##'                  facilitate the plotting of missing values and examination
##'                  of imputations.}
##'  \item{psych: }{A general purpose toolbox for personality, psychometric theory
##'                 and experimental psychology.}
##'  \item{skimr: }{A simple to use summary function that can be used with pipes
##'                 and displays nicely in the console.}
##'  \item{correlation: }{Lightweight package for computing different kinds of
##'                       correlations, such as partial correlations, Bayesian
##'                       correlations, multilevel correlations, polychoric correlations,
##'                       biweight correlations, distance correlations and more.}
##'  \item{rcompanion: }{Additional functions, such as for effect sizes.}
##'  \item{effectsize: }{Provide utilities to work with indices of effect size and
##'                      standardized parameters for a wide variety of models,
##'                      allowing computation of and conversion between indices such as Cohen's d,
##'                      r, odds, etc.}
##'  \item{car: }{Interpret regression results}
##'  \item{FSA: }{NOT SURE}
##'  \item{jtools: }{This is a collection of tools that the author (Jacob) has written for
##'                  the purpose of more efficiently understanding and sharing the results
##'                  of (primarily) regression analyses. }
##'  }
#' @examples
#' \dontrun{
#' # Run this line of code to install all relevant packages
#' install_r4np()
#' }
#' @export
install_r4np <- function() {
  utils::install.packages(c(
    "tidyverse",
    "janitor",
    "naniar",

    "psych",
    "skimr",
    "correlation",
    "rcompanion",
    "effectsize",
    "car",
    "FSA",
    "jtools"
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
