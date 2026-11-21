#' Test homogeneity of variance for multiple variables at once
#'
#' @description This function performs Levene's test for homogeneity of
#'   variance on multiple variables in a dataframe. For each variable, it tests
#'   whether the variance is the same in all groups. It returns the results in
#'   a tidy format.
#'
#' @family assumption tests
#' @param df A dataframe containing the data to be tested. It can be supplied
#'   directly (`vtest(df = mtcars, ...)`) or piped into the function
#'   (`mtcars |> vtest(...)`).
#' @param cols <[`tidy-select`][dplyr::dplyr_tidy_select]> The numeric
#'   variables to test, written as unquoted column names, e.g. `mpg` or
#'   `c(mpg, disp)`. Selection helpers such as `starts_with()` or
#'   `where(is.numeric)` also work. Grouping variables are never tested.
#' @param group <[`tidy-select`][dplyr::dplyr_tidy_select]> The variable that
#'   defines the groups to compare, written as an unquoted column name, e.g.
#'   `cyl`. If you select several variables, e.g. `c(cyl, am)`, every
#'   combination of their values is treated as a separate group, as needed
#'   for a factorial (e.g. two-way) ANOVA.
#' @param center The value each group is centred on: `"median"` (the
#'   default) or `"mean"`. `"median"` is the default in [car::leveneTest()]
#'   and is more robust when the data are not normally distributed (it is
#'   also known as the Brown-Forsythe test). `"mean"` gives the original
#'   Levene's test, which is what SPSS reports.
#'
#' @details Levene's test checks the assumption of homogeneity of variance
#'   (also called homoscedasticity), which tests such as the t-test and ANOVA
#'   rely on. For each variable, it measures how far each value is from the
#'   centre (median or mean) of its group and then compares these distances
#'   across groups with a one-way ANOVA. A significant result (e.g.
#'   `p.value < 0.05`) suggests that the variances differ between groups. The
#'   results are identical to those of [car::leveneTest()].
#'
#'   Before running any tests, the function checks that `df` is a dataframe,
#'   that all variables in `cols` are numeric, that there are at least two
#'   groups, that each group has at least two non-missing values, and that
#'   the values are not identical within every group. If any check fails, the
#'   function stops with an error message explaining which variables or
#'   groups are affected.
#'
#'   Missing values are handled separately for each variable, so a missing
#'   value in one variable does not remove that row from the tests of other
#'   variables. Rows with a missing value in `group` are removed, and a short
#'   message says how many.
#'
#'   Groups are defined only by `group`. If `df` is already a grouped
#'   dataframe, that grouping is ignored and a short message says so (unless
#'   it matches `group`).
#'
#' @return A tibble with one row per variable and the columns `variable`,
#'   `statistic` (the F statistic), `df1` and `df2` (the degrees of freedom),
#'   `p.value` and `method`.
#' @seealso [ntest()] and [ntest_by()] to test the assumption of normality
#' @examples
#' # Compare the variance of mpg across the groups of cyl
#' vtest(df = mtcars, cols = mpg, group = cyl)
#'
#' # Test several variables, piping the data into the function
#' mtcars |> vtest(c(mpg, disp, hp), cyl)
#'
#' # Use the mean instead of the median (the original Levene's test)
#' vtest(mtcars, mpg, cyl, center = "mean")
#'
#' # Compare all combinations of two grouping variables
#' vtest(mtcars, mpg, group = c(cyl, am))
#'
#' @importFrom dplyr bind_rows
#' @importFrom purrr map map_int map_lgl
#' @importFrom tibble tibble
#' @importFrom cli cli_abort cli_inform
#' @importFrom stats anova complete.cases lm median
#'
#' @export
vtest <- function(df, cols, group, center = c("median", "mean")) {

  # Check inputs
  check_df(df)

  if (missing(cols) || missing(group)) {
    cli::cli_abort(c(
      "Please tell {.fn vtest} which variables to test using {.arg cols} and which variable defines the groups using {.arg group}.",
      "i" = "For example: {.code vtest(mtcars, cols = mpg, group = cyl)}."
    ))
  }

  center <- check_center(center)

  # Groups are defined by `group` only, so remove any existing grouping
  existing_groups <- dplyr::group_vars(df)
  df <- dplyr::ungroup(df)

  # Select grouping and test variables (grouping variables are never tested)
  group_names <- names(select_vars(df, {{ group }}, arg = "group"))

  if (length(existing_groups) > 0 &&
      !setequal(existing_groups, group_names)) {
    cli::cli_inform(c(
      "i" = "{.arg df} is grouped by {.field {existing_groups}}, but {.fn vtest} ignores this and uses the groups in {.arg group} ({.field {group_names}}) instead.",
      ">" = "To compare all combinations of several variables, select them all in {.arg group}, e.g. {.code group = c(a, b)}."
    ))
  }

  test_names <- setdiff(
    names(select_vars(df, {{ cols }}, arg = "cols")),
    group_names
  )

  if (length(test_names) == 0) {
    cli::cli_abort(c(
      "{.arg cols} did not select any variables apart from the grouping variable.",
      "i" = "Choose variables to test that are different from {.arg group}."
    ))
  }

  check_numeric(df[test_names], fn = "vtest")

  # Hint when a numeric grouping variable has many values (likely a mistake)
  for (name in group_names) {
    n_values <- length(unique(stats::na.omit(df[[name]])))
    if (is.numeric(df[[name]]) && n_values > 10) {
      cli::cli_inform(c(
        "i" = "{.field {name}} in {.arg group} is numeric with {n_values} different values. Each value is treated as a separate group."
      ))
    }
  }

  # Remove rows with missing group values
  missing_group <- !stats::complete.cases(df[group_names])

  if (any(missing_group)) {
    n_missing <- sum(missing_group)
    cli::cli_inform(c(
      "i" = "Removed {n_missing} row{?s} with missing values in {.arg group}."
    ))
    df <- df[!missing_group, , drop = FALSE]
  }

  # One group label per row, e.g. "4 / 0" for cyl = 4 and am = 0
  groups <- factor(make_group_labels(df, group_names))

  # Missing values are removed per variable
  var_data <- map(test_names, function(name) {
    keep <- !is.na(df[[name]])
    list(y = df[[name]][keep], g = droplevels(groups[keep]))
  })
  names(var_data) <- test_names

  # At least two groups are needed to compare variances
  n_groups <- map_int(var_data, ~ nlevels(.x$g))
  too_few_groups <- test_names[n_groups < 2]

  if (length(too_few_groups) > 0) {
    cli::cli_abort(c(
      "Levene's test needs at least 2 groups to compare.",
      "x" = "Fewer than 2 groups with data for: {.field {too_few_groups}}.",
      "i" = "Check that {.arg group} is the variable that defines your groups."
    ))
  }

  # Each group needs at least two values
  small_groups <- unlist(map(test_names, function(name) {
    n <- table(var_data[[name]]$g)
    small <- names(n)[n < 2]
    if (length(small) == 0) return(NULL)
    paste0(name, " (", small, ")")
  }))

  if (length(small_groups) > 0) {
    cli::cli_abort(c(
      "Each group needs at least 2 non-missing values.",
      "x" = "Too few values in: {.field {small_groups}}."
    ))
  }

  # If all values are identical within every group, there is nothing to test
  constant <- test_names[map_lgl(
    var_data,
    ~ all(center_deviations(.x$y, .x$g, center) < 1e-10)
  )]

  if (length(constant) > 0) {
    cli::cli_abort(c(
      "Cannot test variables where all values within each group are identical.",
      "x" = "Constant within every group: {.field {constant}}."
    ))
  }

  # Perform Levene's test on each variable
  results <- map(var_data, ~ levene_row(.x$y, .x$g, center))

  dplyr::bind_rows(results, .id = "variable")
}

#' Validate `center` and return a single value
#' @noRd
check_center <- function(center, call = parent.frame()) {
  options <- c("median", "mean")

  if (identical(center, options)) {
    return("median")
  }

  if (!is.character(center) || length(center) != 1 || !center %in% options) {
    supplied <- if (is.character(center) && length(center) == 1) {
      cli::format_inline("{.val {center}}")
    } else {
      cli::format_inline("{.obj_type_friendly {center}}")
    }
    cli::cli_abort(c(
      "{.arg center} must be {.val median} or {.val mean}.",
      "x" = "You supplied {supplied}."
    ), call = call)
  }

  center
}

#' Absolute distance of each value from the centre of its group
#' @noRd
center_deviations <- function(y, g, center) {
  center_fn <- switch(center, median = stats::median, mean = mean)
  centers <- tapply(y, g, center_fn)
  abs(y - centers[as.integer(g)])
}

#' Levene's test for one variable, as a one-row tibble
#'
#' Same computation as car::leveneTest(): a one-way ANOVA on the absolute
#' deviations from the group centres.
#' @noRd
levene_row <- function(y, g, center) {
  deviations <- center_deviations(y, g, center)
  fit <- stats::anova(stats::lm(deviations ~ g))

  tibble::tibble(
    statistic = fit[["F value"]][1],
    df1 = as.integer(fit[["Df"]][1]),
    df2 = as.integer(fit[["Df"]][2]),
    p.value = fit[["Pr(>F)"]][1],
    method = paste0("Levene's test (center = ", center, ")")
  )
}
