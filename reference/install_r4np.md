# Install and update all R packages used in the book

Installs every R package used in the book *R For Non-Programmers: A
Guide for Social Scientists* in one go. Packages that are missing are
installed, packages that are out of date are updated, and packages that
are already up to date are left alone. You can run this function again
at any time to bring all packages up to date.

## Usage

``` r
install_r4np()
```

## Value

Invisibly, a character vector with the names of all packages that are
installed after the function has run.

## Details

`install_r4np()` uses the [pak](https://pak.r-lib.org) package to
install packages, because it is fast, prefers ready-built (binary)
packages and, on Linux, can install the system libraries some packages
need. If `pak` is not installed yet, it is installed first. If `pak`
cannot be installed or fails, the function falls back to
[`utils::install.packages()`](https://rdrr.io/r/utils/install.packages.html).

Packages are installed from the CRAN repository set in your R options
(or <https://cloud.r-project.org> if none is set). `gradethis` is not on
CRAN and is installed from <https://rstudio.r-universe.dev>.

Updating packages that are already loaded can fail, especially on
Windows. It is best to run `install_r4np()` in a fresh R session (in
RStudio: *Session \> Restart R*).

The following packages are installed:

- **broom**: Turns the output of statistical tests and models into
  tibbles.

- **car**: Companion to applied regression, e.g. for Levene's test and
  VIFs.

- **correlation**: Computes many kinds of correlations, such as partial,
  polychoric or Bayesian correlations.

- **effectsize**: Computes and converts effect sizes, such as Cohen's d,
  r or odds ratios.

- **exact2x2**: Computes the exact McNemar test.

- **ggdist**: ggplot2 extension to plot distributions and uncertainty.

- **ggforce**: ggplot2 extension with additional geoms.

- **ggmosaic2**: ggplot2 extension to build mosaic plots.

- **ggraph**: Builds network graphs with ggplot2.

- **ggridges**: ggplot2 extension to build ridge plots.

- **gradethis**: Checks answers in the interactive exercises (tutorials)
  that come with this package.

- **igraph**: Creates and analyses networks; used together with ggraph.

- **infer**: Performs statistical inference using a tidy, pipe-friendly
  workflow.

- **janitor**: Cleans column names, builds frequency tables and
  crosstabs, and finds duplicates.

- **jtools**: Summarises and presents the results of regression
  analyses.

- **lavaan**: Fits latent variable models, such as confirmatory factor
  analysis and structural equation models.

- **learnr**: Runs the interactive exercises (tutorials) that come with
  this package.

- **lubridate**: Works with dates and times.

- **mi**: Imputes missing values in a Bayesian framework.

- **mice**: Imputes missing values with multivariate imputation by
  chained equations (MICE).

- **modelr**: Pipe-friendly functions for modelling data.

- **naniar**: Explores and visualises missing values.

- **parameters**: Extracts parameters from regression models.

- **patchwork**: Combines several ggplots into one plot.

- **performance**: Computes performance indices and checks assumptions
  of regression models.

- **psych**: Toolbox for personality, psychometric and experimental
  psychology research.

- **pwr**: Computes statistical power for common tests.

- **rcompanion**: Additional statistical functions, such as effect
  sizes.

- **rstatix**: Pipe-friendly functions for common statistical tests.

- **scales**: Formats ggplot2 axes and labels.

- **see**: Visualises output from easystats packages.

- **simputation**: Simple imputation methods for missing data.

- **skimr**: Pipe-friendly summary statistics that display nicely in the
  console.

- **tidytext**: Text mining using tidy data principles.

- **tidyverse**: Installs the core tidyverse packages, such as dplyr,
  ggplot2 and tidyr.

- **wesanderson**: Colour palettes inspired by Wes Anderson films for
  ggplot2.

- **wordcloud**: Generates word clouds from text data.

## Examples

``` r
if (FALSE) { # \dontrun{
# Run this line of code to install or update all relevant packages
install_r4np()
} # }
```
