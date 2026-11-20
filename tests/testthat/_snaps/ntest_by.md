# ntest_by rejects input that is not a dataframe

    Code
      ntest_by(df_wrong, cols = 1, group = 2)
    Condition
      Error in `ntest_by()`:
      ! `df` must be a dataframe.
      x You supplied a double matrix.

# ntest_by asks for cols and group when missing

    Code
      ntest_by(mtcars, cols = mpg)
    Condition
      Error in `ntest_by()`:
      ! Please tell `ntest_by()` which variables to test using `cols` and which variable defines the groups using `group`.
      i For example: `ntest_by(mtcars, cols = mpg, group = cyl)`.

---

    Code
      ntest_by(mtcars, group = cyl)
    Condition
      Error in `ntest_by()`:
      ! Please tell `ntest_by()` which variables to test using `cols` and which variable defines the groups using `group`.
      i For example: `ntest_by(mtcars, cols = mpg, group = cyl)`.

# ntest_by explains unknown column selections

    Code
      ntest_by(mtcars, cols = not_a_column, group = cyl)
    Condition
      Error in `ntest_by()`:
      ! Could not find the variables given in `cols`.
      Caused by error in `select()`:
      ! Can't select columns that don't exist.
      x Column `not_a_column` doesn't exist.

---

    Code
      ntest_by(mtcars, cols = mpg, group = not_a_group)
    Condition
      Error in `ntest_by()`:
      ! Could not find the variables given in `group`.
      Caused by error in `select()`:
      ! Can't select columns that don't exist.
      x Column `not_a_group` doesn't exist.

# ntest_by never tests the grouping variable

    Code
      ntest_by(mtcars, cols = cyl, group = cyl)
    Condition
      Error in `ntest_by()`:
      ! `cols` did not select any variables apart from the grouping variable.
      i Choose variables to test that are different from `group`.

# ntest_by rejects non-numeric variables

    Code
      ntest_by(df_chr, cols = c(a, b), group = group)
    Condition
      Error in `ntest_by()`:
      ! `ntest_by()` can only test numeric variables.
      x Not numeric: b.

# ntest_by ignores existing grouping and hints at it

    Code
      result <- ntest_by(dplyr::group_by(mtcars, am), mpg, cyl)
    Message
      i `df` is grouped by am, but `ntest_by()` ignores this and uses the groups in `group` (cyl) instead.

# ntest_by rejects to handle groups with less than 3 observations

    Code
      ntest_by(small_df, c(col1, col2, col3), group)
    Condition
      Error in `ntest_by()`:
      ! Sample size of all groups needs to be >= 3.
      x Groups with n < 3: A, B, C, and D.

# ntest_by rejects to handle groups with greater than 5000 observations

    Code
      ntest_by(big_df, c(col1, col2, col3), group)
    Condition
      Error in `ntest_by()`:
      ! Sample size of all groups needs to be <= 5000.
      x Groups with n > 5000: A, B, C, D, and E.

# ntest_by rejects variables that are constant within a group

    Code
      ntest_by(const_df, c(col1, col2), group)
    Condition
      Error in `ntest_by()`:
      ! Cannot test variables where all values within a group are identical.
      x Constant within group: col1 (B).

