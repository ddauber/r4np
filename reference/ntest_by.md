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
  name, e.g. `cyl`. If you select several variables, e.g.
  `c(gender, country)`, every combination of their values is treated as
  a separate group, so you get one test for each gender in each country.

## Value

A tibble with one row per group and variable, containing the grouping
variable(s) and the columns `variable`, `statistic`, `p.value` and
`method`.

## Details

Before running any tests, the function checks that `df` is a dataframe,
that all variables in `cols` are numeric, and that within each group
every variable has between 3 and 5000 non-missing observations (the
range [`shapiro.test()`](https://rdrr.io/r/stats/shapiro.test.html)
accepts) and is not constant. With several grouping variables, these
checks apply to every combination of their values. If any check fails,
the function stops with an error message explaining which groups or
variables are affected. It then performs the Shapiro-Wilk test for each
variable within each group and returns the results in a tidy format.

Groups are defined only by `group`. If `df` is already a grouped
dataframe, that grouping is ignored and a short message says so (unless
it matches `group`).

## See also

[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) to run
normality tests for ungrouped data

Other assumption tests:
[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md),
[`vtest()`](https://ddauber.github.io/r4np/reference/vtest.md)

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

# Test each combination of two grouping variables (engine shape and
# transmission)
ntest_by(mtcars, mpg, group = c(vs, am))
#> # A tibble: 4 × 6
#>      vs    am variable statistic p.value method                     
#>   <dbl> <dbl> <chr>        <dbl>   <dbl> <chr>                      
#> 1     0     1 mpg          0.931   0.584 Shapiro-Wilk normality test
#> 2     1     1 mpg          0.913   0.417 Shapiro-Wilk normality test
#> 3     1     0 mpg          0.938   0.618 Shapiro-Wilk normality test
#> 4     0     0 mpg          0.940   0.504 Shapiro-Wilk normality test
```
