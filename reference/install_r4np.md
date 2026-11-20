# Install R packages relevant for the book 'R for Non-Programmers: A Guide for Social Scientists'.

Install R packages relevant for the book 'R for Non-Programmers: A Guide
for Social Scientists'.

## Usage

``` r
install_r4np()
```

## Details

Installs the following R packages at once:

- broom: :

  Turns output from functions into tibbles.

- car: :

  Interpret regression results

- correlation: :

  Lightweight package for computing different kinds of correlations,
  such as partial correlations, Bayesian correlations, multilevel
  correlations, polychoric correlations, biweight correlations, distance
  correlations and more.

- effectsize: :

  Provide utilities to work with indices of effect size and standardized
  parameters for a wide variety of models, allowing computation of and
  conversion between indices such as Cohen's d, r, odds, etc.

- exact2x2: :

  Provides a function to compute the exact McNemar Test.

- ggdist: :

  ggplot2 extension to plot uncertainty and frequencies.

- ggforce: :

  ggplot2 extension to plot even more geoms.

- ggraph: :

  Used to build network graphs

- ggridges: :

  ggplot2 extension to build ridge plots

- gradethis: :

  Checks answers in the interactive exercises (tutorials) that come with
  this package. It is not on CRAN and is installed from
  <https://rstudio.r-universe.dev>.

- igraph: :

  Used in combination with ggraph to create network plots

- infer: :

  Performs statistical inference using a tidy, pipe-friendly workflow.

- janitor: :

  The main janitor functions can: perfectly format data.frame column
  names; provide quick counts of variable combinations (i.e., frequency
  tables and crosstabs); and isolate duplicate records.

- jtools: :

  This is a collection of tools that the author (Jacob) has written for
  the purpose of more efficiently understanding and sharing the results
  of (primarily) regression analyses.

- lavaan: :

  Fit a variety of latent variable models, including confirmatory factor
  analysis, structural equation modeling and latent growth curve models.

- learnr: :

  Runs the interactive exercises (tutorials) that come with this
  package.

- lubridate: :

  Helps manipulate/convert date and time data

- mice: :

  Multiple imputation using Fully Conditional Specification (FCS)
  implemented by the MICE algorithm as described in Van Buuren and
  Groothuis-Oudshoorn (2011).

- mi: :

  Provides functions for data manipulation, imputing missing values in
  an approximate Bayesian framework, diagnostics of the models used to
  generate the imputations, etc.

- modelr: :

  Build pipefriendly operations to model data.

- naniar: :

  Provides data structures and functions that facilitate the plotting of
  missing values and examination of imputations.

- parameters: :

  Returns parameters from regression models.

- patchwork: :

  Combine different ggplots into one plot.

- performance: :

  Returns performance indices for regression models

- psych: :

  A general purpose toolbox for personality, psychometric theory and
  experimental psychology.

- pwr: :

  Compute the statistical power of different analytical approaches

- rcompanion: :

  Additional functions, such as for effect sizes.

- rstatix: :

  A pipe-friendly way of computing various common statistics.

- scales: :

  Useful functions to format ggplot axes.

- see: :

  Enables visualising output from easystats packages.

- simputation: :

  Offer imputation methods for missing data.

- skimr: :

  A simple to use summary function that can be used with pipes and
  displays nicely in the console.

- tidytext: :

  Text mining using tidy data principles.

- tidyverse: :

  Install the core tidyverse packages.

- wesanderson: :

  Colour palettes inspired by Wes Anderson movies for ggplot2

- wordcloud: :

  Generates word clouds from text data.

All packages except `gradethis` are installed from CRAN. `gradethis` is
installed afterwards from r-universe. If that step fails, the other
packages remain installed and a message explains how to install
`gradethis` manually.

## Examples

``` r
if (FALSE) { # \dontrun{
# Run this line of code to install all relevant packages
install_r4np()
} # }
```
