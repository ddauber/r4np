# Internal input checks shared by ntest() and ntest_by()

# `.data` is the dplyr pronoun used inside mutate() in ntest() and ntest_by()
utils::globalVariables(".data")

#' Abort if `df` is not a dataframe
#' @noRd
check_ntest_df <- function(df, call = parent.frame()) {
  if (!is.data.frame(df)) {
    cli::cli_abort(c(
      "{.arg df} must be a dataframe.",
      "x" = "You supplied {.obj_type_friendly {df}}."
    ), call = call)
  }
}

#' Select columns with a readable error if the selection fails or is empty
#' @noRd
select_ntest_vars <- function(df, vars, arg, call = parent.frame()) {
  data <- tryCatch(
    select(df, {{ vars }}),
    error = function(cnd) {
      cli::cli_abort(
        "Could not find the variables given in {.arg {arg}}.",
        parent = cnd,
        call = call
      )
    }
  )

  if (ncol(data) == 0) {
    cli::cli_abort(c(
      "{.arg {arg}} did not select any variables.",
      "i" = "Check the spelling of the column names in {.arg df}."
    ), call = call)
  }

  data
}

#' Abort if any selected variable is not numeric
#' @noRd
check_ntest_numeric <- function(data, fn, call = parent.frame()) {
  not_numeric <- names(data)[!map_lgl(data, is.numeric)]

  if (length(not_numeric) > 0) {
    cli::cli_abort(c(
      "{.fn {fn}} can only test numeric variables.",
      "x" = "Not numeric: {.field {not_numeric}}."
    ), call = call)
  }
}

#' Count non-missing values per variable
#' @noRd
count_non_missing <- function(data) {
  map_int(data, ~ sum(!is.na(.x)))
}

#' Flag variables where all non-missing values are identical
#' @noRd
is_constant <- function(data) {
  map_lgl(data, ~ diff(range(.x, na.rm = TRUE)) < 1e-10)
}
