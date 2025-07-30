#' Perform normality test for multiple variables by groups
#'
#' @description This function performs a Shapiro-Wilk normality test on multiple
#'   variables in a dataframe by groups.
#'
#' @param df A dataframe containing the data to be tested.
#' @param cols A vector of column names in the dataframe to be tested for
#'   normality.
#' @param group A column name in the dataframe that defines the groups.
#'
#' @details The function first creates subsets of the data for each group. It
#'   then performs a Shapiro-Wilk normality test (`shapiro.test()`) on each
#'   group and returns the results in a tidy format. The function also checks
#'   whether the number of observations for each variable and group lies within
#'   the permissible range of the `shapiro.test()` and verifies that all
#'   selected columns are numeric. If any of these conditions are violated, the
#'   function will provide diagnostics on why a test could not be performed and
#'   which groups or variables are affected.
#'
#' @return A data frame with the results of the Shapiro-Wilk test for each group
#'   and variable.
#' @seealso [ntest()] to run normality tests for ungrouped data
#' @examples
#' \dontrun{
#' # Perform a normality test for groups
#' ntest_by(df    = mtcars,
#'          cols  = mpg,
#'          group = cyl)
#'
#' # Perform a normality test for multiple variables by groups
#' ntest_by(df    = starwars,
#'          cols  = c(mass, birth_year),
#'          group = species)
#' }
#'
#' @importFrom tidyr pivot_longer nest unnest
#' @importFrom tibble tibble
#' @importFrom dplyr group_by summarise filter select mutate everything rowwise
#'   ungroup
#' @importFrom purrr map
#' @importFrom broom tidy
#' @importFrom cli cli_abort
#'
#' @export
ntest_by <- function(df, cols, group){

  # Check that selected columns are numeric
  selected <- df |> select({{ cols }})
  are_numeric <- purrr::map_lgl(selected, is.numeric)
  if (any(!are_numeric)) {
    invalid <- paste(names(selected)[!are_numeric], collapse = ", ")
    cli::cli_abort(c(
      "All selected columns must be numeric.",
      i = "Non-numeric columns: {.strong {invalid}}."
    ))
  }

# Create subsets of data as nested dfs
nested_group_data <-
  df |>
  select({{ group }}, {{ cols }}) |>
  nest(.by = {{ group }})

# a check to make sure groups are: 3>= size >= 5000
check_group_size <-
  nested_group_data |>
  rowwise() |>
  mutate(n = nrow(.data$data)) |>
  ungroup()

# Group(s) too small
small_groups <-
  check_group_size |>
  filter(.data$n < 3)

small_group_names <- paste(small_groups[[1]], collapse = ", ")

# Group(s) too big
big_groups <-
  check_group_size |>
  filter(.data$n > 5000)

big_group_names <- paste(big_groups[[1]], collapse = ", ")

if (any(check_group_size$n < 3)) {
  cli::cli_abort(c(
    "Sample size of all groups needs to be >= 3.",
    i = "Groups with n < 3: {.strong {small_group_names}}.")
  )
}

if (any(check_group_size$n > 5000)) {
  cli::cli_abort(c(
    "Sample size of all groups needs to be <= 5000.",
    i = "Groups with n > 5000: {.strong {big_group_names}}.")
  )
}

# Perform normality test on each dataset
results <-
  nested_group_data |>
  mutate(test_results = map(.data$data, ~ map(., ~ shapiro.test(.)))
  ) |>

  # Turn results into a tibble
  mutate(test_results = map(.data$test_results,
                            ~ tibble(variable = names(.x),
                                    result = .x))
  ) |>
  unnest(cols = .data$test_results) |>
  mutate(result = map(.data$result, tidy)) |>
  unnest(cols = .data$result) |>
  select(-.data$data)

return(results)
}

utils::globalVariables(".data")
