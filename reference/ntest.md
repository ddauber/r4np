# Perform normality test for multiple variables at once

This function performs a Shapiro-Wilk normality test on multiple
variables in a dataframe. It returns the results in a tidy format.

## Usage

``` r
ntest(df, cols)
```

## Arguments

- df:

  A dataframe containing the data to be tested. It can be supplied
  directly (`ntest(df = mtcars, ...)`) or piped into the function
  (`mtcars |> ntest(...)`).

- cols:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  The numeric variables to test for normality, written as unquoted
  column names, e.g. `mpg` or `c(mpg, disp)`. Selection helpers such as
  `starts_with()` or `where(is.numeric)` also work.

## Value

A tibble with one row per variable and the columns `variable`,
`statistic`, `p.value` and `method`.

## Details

Before running any tests, the function checks that `df` is a dataframe,
that all selected columns are numeric, and that each variable has
between 3 and 5000 non-missing observations (the range
[`shapiro.test()`](https://rdrr.io/r/stats/shapiro.test.html) accepts)
and is not constant. If any check fails, the function stops with an
error message explaining which variables are affected. It then performs
the Shapiro-Wilk test on each variable and returns a formatted dataframe
with the test results.

If `df` is a grouped dataframe, the grouping is ignored and all
observations are tested together. Use
[`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md) to
test each group separately.

## See also

[`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md) to
run normality tests for grouped data

Other normality tests:
[`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)

## Examples

``` r
# Test a single variable
ntest(df = mtcars, cols = mpg)
#> # A tibble: 1 × 4
#>   variable statistic p.value method                     
#>   <chr>        <dbl>   <dbl> <chr>                      
#> 1 mpg          0.948   0.123 Shapiro-Wilk normality test

# Test several variables, piping the data into the function
mtcars |> ntest(c(mpg, disp, hp))
#> # A tibble: 3 × 4
#>   variable statistic p.value method                     
#>   <chr>        <dbl>   <dbl> <chr>                      
#> 1 mpg          0.948  0.123  Shapiro-Wilk normality test
#> 2 disp         0.920  0.0208 Shapiro-Wilk normality test
#> 3 hp           0.933  0.0488 Shapiro-Wilk normality test
```
