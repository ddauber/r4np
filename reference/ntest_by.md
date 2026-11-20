# Perform normality test for multiple variables by groups

This function performs a Shapiro-Wilk normality test on multiple
variables in a dataframe by groups.

## Usage

``` r
ntest_by(df, cols, group)
```

## Arguments

- df:

  A dataframe containing the data to be tested. It can be supplied
  directly (`ntest_by(df = mtcars, ...)`) or piped into the function
  (`mtcars |> ntest_by(...)`).

- cols:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  The numeric variables to test for normality, written as unquoted
  column names, e.g. `mpg` or `c(mpg, disp)`. Selection helpers such as
  `starts_with()` or `where(is.numeric)` also work. Grouping variables
  are never tested.

- group:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  The variable that defines the groups, written as an unquoted column
  name, e.g. `cyl`.

## Value

A tibble with one row per group and variable, containing the grouping
variable(s) and the columns `variable`, `statistic`, `p.value` and
`method`.

## Details

Before running any tests, the function checks that `df` is a dataframe,
that all variables in `cols` are numeric, and that each variable has
between 3 and 5000 non-missing observations (the range
[`shapiro.test()`](https://rdrr.io/r/stats/shapiro.test.html) accepts)
and is not constant within every group. If any check fails, the function
stops with an error message explaining which groups or variables are
affected. It then performs the Shapiro-Wilk test for each variable
within each group and returns the results in a tidy format.

Groups are defined only by `group`. If `df` is already a grouped
dataframe, that grouping is ignored and a short message says so (unless
it matches `group`).

## See also

[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) to run
normality tests for ungrouped data

Other normality tests:
[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md)

## Examples

``` r
# Perform a normality test for each group
ntest_by(df = mtcars, cols = mpg, group = cyl)
#> # A tibble: 3 × 5
#>     cyl variable statistic p.value method                     
#>   <dbl> <chr>        <dbl>   <dbl> <chr>                      
#> 1     6 mpg          0.899   0.325 Shapiro-Wilk normality test
#> 2     4 mpg          0.912   0.261 Shapiro-Wilk normality test
#> 3     8 mpg          0.932   0.323 Shapiro-Wilk normality test

# Test several variables by group, piping the data into the function
iris |> ntest_by(c(Sepal.Length, Sepal.Width), Species)
#> # A tibble: 6 × 5
#>   Species    variable     statistic p.value method                     
#>   <fct>      <chr>            <dbl>   <dbl> <chr>                      
#> 1 setosa     Sepal.Length     0.978   0.460 Shapiro-Wilk normality test
#> 2 setosa     Sepal.Width      0.972   0.272 Shapiro-Wilk normality test
#> 3 versicolor Sepal.Length     0.978   0.465 Shapiro-Wilk normality test
#> 4 versicolor Sepal.Width      0.974   0.338 Shapiro-Wilk normality test
#> 5 virginica  Sepal.Length     0.971   0.258 Shapiro-Wilk normality test
#> 6 virginica  Sepal.Width      0.967   0.181 Shapiro-Wilk normality test
```
