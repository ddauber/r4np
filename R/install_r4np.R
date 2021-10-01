#' Install R packages relevant for the book 'R for Non-Programmers: A Guide for Social Scientists'.
#'
#' @details Installs the following R packages at once:
##' \itemize{
##'  \item{broom: }{Turns output from functions into tibbles.}
##'  \item{car: }{Interpret regression results}
##'  \item{correlation: }{Lightweight package for computing different kinds of
##'                       correlations, such as partial correlations, Bayesian
##'                       correlations, multilevel correlations, polychoric correlations,
##'                       biweight correlations, distance correlations and more.}
##'  \item{effectsize: }{Provide utilities to work with indices of effect size and
##'                      standardized parameters for a wide variety of models,
##'                      allowing computation of and conversion between indices such as Cohen's d,
##'                      r, odds, etc.}
##'  \item{janitor: }{The main janitor functions can: perfectly f
##'                   ormat data.frame column names; provide quick
##'                   counts of variable combinations (i.e., frequency
##'                   tables and crosstabs); and isolate duplicate records.}
##'  \item{jtools: }{This is a collection of tools that the author (Jacob) has written for
##'                  the purpose of more efficiently understanding and sharing the results
##'                  of (primarily) regression analyses.}
##'  \item{lavaan: }{Fit a variety of latent variable models, including confirmatory factor analysis,
##'                  structural equation modeling and latent growth curve models.}
##'  \item{mice: }{Multiple imputation using Fully Conditional Specification (FCS)
##'               implemented by the MICE algorithm as described in Van Buuren and
##'               Groothuis-Oudshoorn (2011).}
##'  \item{mi: }{Provides functions for data manipulation, imputing missing values
##'              in an approximate Bayesian framework, diagnostics of the models used
##'              to generate the imputations, etc.}
##'  \item{naniar: }{Provides data structures and functions that
##'                  facilitate the plotting of missing values and examination
##'                  of imputations.}
##'  \item{parameters: }{Returns parameters from regression models.}
##'  \item{patchwork: }{Combine different ggplots into one plot.}
##'  \item{performance: }{Returns performance indices for regression models}
##'  \item{psych: }{A general purpose toolbox for personality, psychometric theory
##'                 and experimental psychology.}
##'  \item{rcompanion: }{Additional functions, such as for effect sizes.}
##'  \item{rstatix: }{A pipe-friendly way of computing various statistics.}
##'  \item{skimr: }{A simple to use summary function that can be used with pipes
##'                 and displays nicely in the console.}
##'  \item{tidyverse: }{Install the core tidyverse packages.}
##'  }
#' @examples
#' \dontrun{
#' # Run this line of code to install all relevant packages
#' install_r4np()
#' }
#' @export
install_r4np <- function() {
  utils::install.packages(c(
    "broom",
    "car",
    "correlation",
    "effectsize",
    "exact2x2",
    "ggdist",
    "ggforce",
    "ggmosaic",
    "ggraph",
    "ggrigdes",
    "janitor",
    "jtools",
    "lavaan",
    "igraph",
    "mice",
    "mi",
    "modelr",
    "naniar",
    "parameters",
    "patchwork",
    "performance",
    "psych",
    "pwr",
    "rcompanion",
    "rstatix",
    "scales",
    "see",
    "simputation",
    "skimr",
    "tidytext",
    "tidyverse",
    "wesanderson"
    # Add packages related to mixed-methods research
  ))

  message("The following packages have been installed or updated:",
          "\n- broom",
          "\n- car",
          "\n- correlation",
          "\n- effectsize",
          "\n- exact2x2",
          "\n- ggdist",
          "\n- ggforce",
          "\n- ggmosaic",
          "\n- ggraph",
          "\n- ggrigdes",
          "\n- janitor",
          "\n- jtools",
          "\n- lavaan",
          "\n- igraph",
          "\n- mice",
          "\n- mi",
          "\n- modelr",
          "\n- naniar",
          "\n- parameters",
          "\n- patchwork",
          "\n- performance",
          "\n- psych",
          "\n- pwr",
          "\n- rcompanion",
          "\n- rstatix",
          "\n- scales",
          "\n- see",
          "\n- simputation",
          "\n- skimr",
          "\n- tidytext",
          "\n- tidyverse",
          "\n- wesanderson",
          sep = "\n")
}
