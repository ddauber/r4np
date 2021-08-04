#' Install R packages relevant for the book 'R for Non-Programmers: A Guide for Social Scientists'.
#'
#' @details Installs the following R packages at once:
##' \itemize{
##'  \item{tidyverse: }{Install the core tidyverse packages.}
##'  \item{janitor: }{Clean data, e.g. colum names, etc.}
##'  \item{naniar: }{Inspect and handle missing data.}
##'  \item{psych: }{Compute all kinds of statistics relevant to Social Sciences.}
##'  \item{skimr: }{Retrieve descriptive statistics and 'skim' your data.}
##'  \item{correlation: }{Advanced functionality to perform correlations.}
##'  \item{rcompanion: }{Additional functions, such as for effect sizes.}
##'  \item{effectsize: }{Compute and interpret effect sizes.}
##'  \item{car: }{Interpret regression results}
##'  \item{FSA: }{NOT SURE}
##'  \item{jtools: }{Retrieve nicely formatted output from regressions.}
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
