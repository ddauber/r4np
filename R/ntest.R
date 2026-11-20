#' Perform normality test for multiple variables at once
#'
#' @description This function performs a Shapiro-Wilk normality test on multiple
#'  variables in a dataframe. It returns the results in a tidy format.
#' @family normality tests
#' @param df A dataframe containing the data to be tested. It can be supplied
#'  directly (`ntest(df = mtcars, ...)`) or piped into the function
#'  (`mtcars |> ntest(...)`).
#' @param cols <[`tidy-select`][dplyr::dplyr_tidy_select]> The numeric
#'  variables to test for normality, written as unquoted column names, e.g.
#'  `mpg` or `c(mpg, disp)`. Selection helpers such as `starts_with()` or
#'  `where(is.numeric)` also work.
#'
#' @details Before running any tests, the function checks that `df` is a
#'  dataframe, that all selected columns are numeric, and that each variable
#'  has between 3 and 5000 non-missing observations (the range `shapiro.test()`
#'  accepts) and is not constant. If any check fails, the function stops with
#'  an error message explaining which variables are affected. It then performs
#'  the Shapiro-Wilk test on each variable and returns a formatted dataframe
#'  with the test results.
#'
#'  If `df` is a grouped dataframe, the grouping is ignored and all
#'  observations are tested together. Use [ntest_by()] to test each group
#'  separately.
#'
#' @return A tibble with one row per variable and the columns `variable`,
#'  `statistic`, `p.value` and `method`.
#' @seealso [ntest_by()] to run normality tests for grouped data
#' @examples
#' # Test a single variable
#' ntest(df = mtcars, cols = mpg)
#'
#' # Test several variables, piping the data into the function
#' mtcars |> ntest(c(mpg, disp, hp))
#'
#' @importFrom tidyr unnest
#' @importFrom dplyr select mutate
#' @importFrom purrr map map_int map_lgl
#' @importFrom tibble enframe
#' @importFrom broom tidy
#' @importFrom cli cli_abort cli_inform
#' @importFrom stats shapiro.test
#'
#' @export
ntest <- function(df, cols) {

  # Check inputs
  check_ntest_df(df)

  if (missing(cols)) {
    cli::cli_abort(c(
      "Please tell {.fn ntest} which variables to test using {.arg cols}.",
      "i" = "For example: {.code ntest(mtcars, cols = c(mpg, disp))}."
    ))
  }

  # Grouped data: test all observations together, but hint at ntest_by()
  if (dplyr::is_grouped_df(df)) {
    group_names <- dplyr::group_vars(df)
    cli::cli_inform(c(
      "i" = "{.arg df} is grouped by {.field {group_names}}, but {.fn ntest} ignores groups and tests all observations together.",
      ">" = "To test normality for each group, use {.fn ntest_by}."
    ))
    df <- dplyr::ungroup(df)
  }

  # Select variables to test (only numeric variables can be tested)
  data <- select_ntest_vars(df, {{ cols }}, arg = "cols")
  check_ntest_numeric(data, fn = "ntest")

  # Check for sample sizes (shapiro.test() accepts 3 to 5000 observations)
  sample_sizes <- count_non_missing(data)

  small_sample <- names(sample_sizes)[sample_sizes < 3]
  big_sample <- names(sample_sizes)[sample_sizes > 5000]

  if (length(small_sample) > 0) {
    cli::cli_abort(c(
      "Sample size of all variables needs to be >= 3.",
      "x" = "Variable{?s} with n < 3: {.field {small_sample}}."
    ))
  }

  if (length(big_sample) > 0) {
    cli::cli_abort(c(
      "Sample size of all variables needs to be <= 5000.",
      "x" = "Variable{?s} with n > 5000: {.field {big_sample}}."
    ))
  }

  # Constant variables cannot be tested
  constant <- names(data)[is_constant(data)]

  if (length(constant) > 0) {
    cli::cli_abort(c(
      "Cannot test variables where all values are identical.",
      "x" = "Constant variable{?s}: {.field {constant}}."
    ))
  }

  # Performing normality test
  test <- map(data, ~ shapiro.test(.x))

  result <- enframe(test, name = "variable", value = "subitems")

  # Formatting the results
  result_formatted <-
    result |>
    mutate(tidy_htest = map(.data$subitems, tidy)) |>
    unnest(cols = "tidy_htest") |>
    select(-"subitems")

  return(result_formatted)
}
