#' Perform normality test for multiple variables at once
#'
#' @description This function performs a Shapiro-Wilk normality test on multiple
#'  variables in a dataframe. It returns the results in a tidy format.
#' @family normality tests
#' @param df A dataframe containing the data to be tested.
#' @param cols A vector of column names in the dataframe to be tested for
#'  normality.
#'
#' @details The function first reshapes the dataframe to a long format and
#'  calculates the sample size for each variable. It then checks if the sample
#'  size for any variable is less than 3 or greater than 5000, and if so, aborts
#'  the function with an error message because the `shapiro.test()` only expects
#'  this range of observations. The function then performs the Shapiro-Wilk test
#'  on each variable and returns a formatted dataframe with the test results.
#'
#' @return A dataframe with the test results. Each row corresponds to a variable,
#'  and the columns contain the test statistics and p-values.
#' @seealso [ntest_by()] to run normality tests for grouped data
#' @examples
#' \dontrun{
#' # Perform multiple normality tests at once
#' ntest(df   = mtcars,
#'       cols = mpg)
#' }
#'
#' @importFrom tidyr pivot_longer unnest
#' @importFrom dplyr group_by summarise filter select mutate everything
#' @importFrom purrr map
#' @importFrom tibble enframe
#' @importFrom broom tidy
#' @importFrom cli cli_abort
#'
#' @export
ntest <- function(df, cols) {

  # Check for sample sizes
  sample_sizes <-
    df |>
    pivot_longer(cols = {{ cols }},
                 names_to = "variable",
                 values_to = "value") |>
    group_by(.data$variable) |>
    summarise(n = sum(!is.na(.data$value)), .groups = "drop")

  small_sample <-
    sample_sizes |>
    filter(.data$n < 3)

  big_sample <-
    sample_sizes |>
    filter(.data$n > 5000)

  small_sample_names <- paste(small_sample[[1]], collapse = ", ")
  big_sample_names <- paste(big_sample[[1]], collapse = ", ")


  if (any(sample_sizes$n < 3)) {
    cli::cli_abort(c(
      "Sample size of all groups needs to be >= 3.",
      i = "Groups with n < 3: {.strong {small_sample_names}}.")
    )
  }

  if (any(sample_sizes$n > 5000)) {
    cli::cli_abort(c(
      "Sample size of all groups needs to be <= 5000.",
      i = "Groups with n > 5000: {.strong {big_sample_names}}.")
    )
  }

  # Performing normality test
  test <-
    df |>
    select({{cols}}) |>
    map(~ shapiro.test(.))

  result <- enframe(test, name = "row_name", value = "subitems")

  # Formatting the results
  result_formatted <-
    result |>
    mutate(tidy_htest = map(.data$subitems, tidy)) |>
    unnest(cols = .data$tidy_htest) |>
    select(-.data$subitems)

  return(result_formatted)
}

utils::globalVariables(".data")
