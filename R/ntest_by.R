#' Perform normality test for multiple variables by groups
#'
#' @description This function performs a Shapiro-Wilk normality test on multiple
#'   variables in a dataframe by groups.
#'
#' @family normality tests
#' @param df A dataframe containing the data to be tested. It can be supplied
#'   directly (`ntest_by(df = mtcars, ...)`) or piped into the function
#'   (`mtcars |> ntest_by(...)`).
#' @param cols <[`tidy-select`][dplyr::dplyr_tidy_select]> The numeric
#'   variables to test for normality, written as unquoted column names, e.g.
#'   `mpg` or `c(mpg, disp)`. Selection helpers such as `starts_with()` or
#'   `where(is.numeric)` also work. Grouping variables are never tested.
#' @param group <[`tidy-select`][dplyr::dplyr_tidy_select]> The variable that
#'   defines the groups, written as an unquoted column name, e.g. `cyl`.
#'
#' @details Before running any tests, the function checks that `df` is a
#'   dataframe, that all variables in `cols` are numeric, and that each
#'   variable has between 3 and 5000 non-missing observations (the range
#'   `shapiro.test()` accepts) and is not constant within every group. If any
#'   check fails, the function stops with an error message explaining which
#'   groups or variables are affected. It then performs the Shapiro-Wilk test
#'   for each variable within each group and returns the results in a tidy
#'   format.
#'
#'   Groups are defined only by `group`. If `df` is already a grouped
#'   dataframe, that grouping is ignored and a short message says so (unless
#'   it matches `group`).
#'
#' @return A tibble with one row per group and variable, containing the
#'   grouping variable(s) and the columns `variable`, `statistic`, `p.value`
#'   and `method`.
#' @seealso [ntest()] to run normality tests for ungrouped data
#' @examples
#' # Perform a normality test for each group
#' ntest_by(df = mtcars, cols = mpg, group = cyl)
#'
#' # Test several variables by group, piping the data into the function
#' iris |> ntest_by(c(Sepal.Length, Sepal.Width), Species)
#'
#' @importFrom tidyr nest unnest
#' @importFrom tibble tibble
#' @importFrom dplyr select mutate all_of
#' @importFrom purrr map map_int map_lgl
#' @importFrom broom tidy
#' @importFrom cli cli_abort cli_inform
#' @importFrom stats shapiro.test
#'
#' @export
ntest_by <- function(df, cols, group) {

  # Check inputs
  check_ntest_df(df)

  if (missing(cols) || missing(group)) {
    cli::cli_abort(c(
      "Please tell {.fn ntest_by} which variables to test using {.arg cols} and which variable defines the groups using {.arg group}.",
      "i" = "For example: {.code ntest_by(mtcars, cols = mpg, group = cyl)}."
    ))
  }

  # Groups are defined by `group` only, so remove any existing grouping
  existing_groups <- dplyr::group_vars(df)
  df <- dplyr::ungroup(df)

  # Select grouping and test variables (grouping variables are never tested)
  group_data <- select_ntest_vars(df, {{ group }}, arg = "group")
  group_names <- names(group_data)

  # Hint only if the existing grouping differs from `group`
  if (length(existing_groups) > 0 &&
      !setequal(existing_groups, group_names)) {
    cli::cli_inform(c(
      "i" = "{.arg df} is grouped by {.field {existing_groups}}, but {.fn ntest_by} ignores this and uses the groups in {.arg group} ({.field {group_names}}) instead."
    ))
  }

  test_names <- setdiff(
    names(select_ntest_vars(df, {{ cols }}, arg = "cols")),
    group_names
  )

  if (length(test_names) == 0) {
    cli::cli_abort(c(
      "{.arg cols} did not select any variables apart from the grouping variable.",
      "i" = "Choose variables to test that are different from {.arg group}."
    ))
  }

  check_ntest_numeric(df[test_names], fn = "ntest_by")

  # Create subsets of data as nested dfs
  nested_group_data <- nest(df[c(group_names, test_names)],
                            .by = all_of(group_names))

  group_labels <- do.call(
    paste,
    c(lapply(nested_group_data[group_names], as.character), sep = " / ")
  )

  # Check that groups are: 3 <= size <= 5000 (per variable, ignoring NAs)
  sample_sizes <- map(nested_group_data$data, count_non_missing)

  small_groups <- group_labels[map_lgl(sample_sizes, ~ any(.x < 3))]
  big_groups <- group_labels[map_lgl(sample_sizes, ~ any(.x > 5000))]

  if (length(small_groups) > 0) {
    cli::cli_abort(c(
      "Sample size of all groups needs to be >= 3.",
      "x" = "Group{?s} with n < 3: {.field {small_groups}}."
    ))
  }

  if (length(big_groups) > 0) {
    cli::cli_abort(c(
      "Sample size of all groups needs to be <= 5000.",
      "x" = "Group{?s} with n > 5000: {.field {big_groups}}."
    ))
  }

  # Constant variables within a group cannot be tested
  constant <- unlist(map(
    seq_along(group_labels),
    function(i) {
      vars <- names(which(is_constant(nested_group_data$data[[i]])))
      if (length(vars) == 0) return(NULL)
      paste0(vars, " (", group_labels[i], ")")
    }
  ))

  if (length(constant) > 0) {
    cli::cli_abort(c(
      "Cannot test variables where all values within a group are identical.",
      "x" = "Constant within group: {.field {constant}}."
    ))
  }

  # Perform normality test on each dataset
  results <-
    nested_group_data |>
    mutate(test_results = map(.data$data, ~ map(.x, ~ shapiro.test(.x)))) |>

    # Turn results into a tibble
    mutate(test_results = map(.data$test_results,
                              ~ tibble(variable = names(.x),
                                       result = .x))
    ) |>
    unnest(cols = "test_results") |>
    mutate(result = map(.data$result, tidy)) |>
    unnest(cols = "result") |>
    select(-"data")

  return(results)
}
