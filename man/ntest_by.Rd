% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ntest_by.R
\name{ntest_by}
\alias{ntest_by}
\title{Perform normality test for multiple variables by groups}
\usage{
ntest_by(df, cols, group)
}
\arguments{
\item{df}{A dataframe containing the data to be tested.}

\item{cols}{A vector of column names in the dataframe to be tested for
normality.}

\item{group}{A column name in the dataframe that defines the groups.}
}
\value{
A data frame with the results of the Shapiro-Wilk test for each group
  and variable.
}
\description{
This function performs a Shapiro-Wilk normality test on multiple
  variables in a dataframe by groups.
}
\details{
The function first creates subsets of the data for each group. It
  then performs a Shapiro-Wilk normality test (`shapiro.test()`) on each
  group and returns the results in a tidy format. the function also checks
  whether the number of observations for each variable and group lies within
  the permissible range of the `shapiro.test()`. If not, the function will
  provide diagnostics on why a test could not be performed base on which
  groups are affected.
}
\examples{
\dontrun{
# Perform a normality test for groups
ntest_by(df    = mtcars,
         cols  = mpg,
         group = cyl)

# Perform a normality test for multiple variables by groups
ntest_by(df    = starwars,
         cols  = c(mass, birth_year),
         group = species)
}

}
\seealso{
[ntest()] to run normality tests for ungrouped data
}
