# Test homogeneity of variance for multiple variables at once

This function performs Levene's test for homogeneity of variance on
multiple variables in a dataframe. For each variable, it tests whether
the variance is the same in all groups. It returns the results in a tidy
format.

## Usage

``` r
vtest(df, cols, group, center = c("median", "mean"))
```

## Arguments

- df:

  A dataframe containing the data to be tested. It can be supplied
  directly (`vtest(df = mtcars, ...)`) or piped into the function
  (`mtcars |> vtest(...)`).

- cols:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  The numeric variables to test, written as unquoted column names, e.g.
  `mpg` or `c(mpg, disp)`. Selection helpers such as `starts_with()` or
  `where(is.numeric)` also work. Grouping variables are never tested.

- group:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  The variable that defines the groups to compare, written as an
  unquoted column name, e.g. `cyl`. If you select several variables,
  e.g. `c(cyl, am)`, every combination of their values is treated as a
  separate group, as needed for a factorial (e.g. two-way) ANOVA.

- center:

  The value each group is centred on: `"median"` (the default) or
  `"mean"`. `"median"` is the default in
  [`car::leveneTest()`](https://rdrr.io/pkg/car/man/leveneTest.html) and
  is more robust when the data are not normally distributed (it is also
  known as the Brown-Forsythe test). `"mean"` gives the original
  Levene's test, which is what SPSS reports.

## Value

A tibble with one row per variable and the columns `variable`,
`statistic` (the F statistic), `df1` and `df2` (the degrees of freedom),
`p.value` and `method`.

## Details

Levene's test checks the assumption of homogeneity of variance (also
called homoscedasticity), which tests such as the t-test and ANOVA rely
on. For each variable, it measures how far each value is from the centre
(median or mean) of its group and then compares these distances across
groups with a one-way ANOVA. A significant result (e.g.
`p.value < 0.05`) suggests that the variances differ between groups. The
results are identical to those of
[`car::leveneTest()`](https://rdrr.io/pkg/car/man/leveneTest.html).

Before running any tests, the function checks that `df` is a dataframe,
that all variables in `cols` are numeric, that there are at least two
groups, that each group has at least two non-missing values, and that
the values are not identical within every group. If any check fails, the
function stops with an error message explaining which variables or
groups are affected.

Missing values are handled separately for each variable, so a missing
value in one variable does not remove that row from the tests of other
variables. Rows with a missing value in `group` are removed, and a short
message says how many.

Groups are defined only by `group`. If `df` is already a grouped
dataframe, that grouping is ignored and a short message says so (unless
it matches `group`).

## See also

[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) and
[`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md) to
test the assumption of normality

Other assumption tests:
[`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md),
[`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)

## Examples

``` r
# Compare the variance of mpg across the groups of cyl
vtest(df = mtcars, cols = mpg, group = cyl)
#> # A tibble: 1 × 6
#>   variable statistic   df1   df2 p.value method                         
#>   <chr>        <dbl> <int> <int>   <dbl> <chr>                          
#> 1 mpg           5.51     2    29 0.00939 Levene's test (center = median)

# Test several variables, piping the data into the function
mtcars |> vtest(c(mpg, disp, hp), cyl)
#> # A tibble: 3 × 6
#>   variable statistic   df1   df2 p.value method                         
#>   <chr>        <dbl> <int> <int>   <dbl> <chr>                          
#> 1 mpg           5.51     2    29 0.00939 Levene's test (center = median)
#> 2 disp          3.29     2    29 0.0516  Levene's test (center = median)
#> 3 hp            2.91     2    29 0.0705  Levene's test (center = median)

# Use the mean instead of the median (the original Levene's test)
vtest(mtcars, mpg, cyl, center = "mean")
#> # A tibble: 1 × 6
#>   variable statistic   df1   df2 p.value method                       
#>   <chr>        <dbl> <int> <int>   <dbl> <chr>                        
#> 1 mpg           6.48     2    29 0.00470 Levene's test (center = mean)

# Compare all combinations of two grouping variables
vtest(mtcars, mpg, group = c(cyl, am))
#> # A tibble: 1 × 6
#>   variable statistic   df1   df2 p.value method                         
#>   <chr>        <dbl> <int> <int>   <dbl> <chr>                          
#> 1 mpg           2.74     5    26  0.0409 Levene's test (center = median)
```
