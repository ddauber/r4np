# vtest never tests the grouping variable

    Code
      vtest(mtcars, cols = cyl, group = cyl)
    Condition
      Error in `vtest()`:
      ! `cols` did not select any variables apart from the grouping variable.
      i Choose variables to test that are different from `group`.

# vtest rejects input that is not a dataframe

    Code
      vtest(matrix(1:10), cols = 1, group = 2)
    Condition
      Error in `vtest()`:
      ! `df` must be a dataframe.
      x You supplied an integer matrix.

# vtest asks for cols and group when missing

    Code
      vtest(mtcars, cols = mpg)
    Condition
      Error in `vtest()`:
      ! Please tell `vtest()` which variables to test using `cols` and which variable defines the groups using `group`.
      i For example: `vtest(mtcars, cols = mpg, group = cyl)`.

---

    Code
      vtest(mtcars, group = cyl)
    Condition
      Error in `vtest()`:
      ! Please tell `vtest()` which variables to test using `cols` and which variable defines the groups using `group`.
      i For example: `vtest(mtcars, cols = mpg, group = cyl)`.

# vtest explains unknown column selections

    Code
      vtest(mtcars, cols = not_a_column, group = cyl)
    Condition
      Error in `vtest()`:
      ! Could not find the variables given in `cols`.
      Caused by error in `select()`:
      ! Can't select columns that don't exist.
      x Column `not_a_column` doesn't exist.

---

    Code
      vtest(mtcars, cols = mpg, group = not_a_group)
    Condition
      Error in `vtest()`:
      ! Could not find the variables given in `group`.
      Caused by error in `select()`:
      ! Can't select columns that don't exist.
      x Column `not_a_group` doesn't exist.

# vtest rejects invalid center values

    Code
      vtest(mtcars, mpg, cyl, center = "mode")
    Condition
      Error in `vtest()`:
      ! `center` must be "median" or "mean".
      x You supplied "mode".

---

    Code
      vtest(mtcars, mpg, cyl, center = 1)
    Condition
      Error in `vtest()`:
      ! `center` must be "median" or "mean".
      x You supplied a number.

# vtest rejects non-numeric variables

    Code
      vtest(df_chr, c(a, b), group)
    Condition
      Error in `vtest()`:
      ! `vtest()` can only test numeric variables.
      x Not numeric: b.

# vtest needs at least two groups

    Code
      vtest(df_one, a, group)
    Condition
      Error in `vtest()`:
      ! Levene's test needs at least 2 groups to compare.
      x Fewer than 2 groups with data for: a.
      i Check that `group` is the variable that defines your groups.

# vtest needs at least two values per group

    Code
      vtest(df_small, a, group)
    Condition
      Error in `vtest()`:
      ! Each group needs at least 2 non-missing values.
      x Too few values in: a (B).

# vtest rejects variables that are constant within every group

    Code
      vtest(df_const, c(a, b), group)
    Condition
      Error in `vtest()`:
      ! Cannot test variables where all values within each group are identical.
      x Constant within every group: a.

# vtest removes rows with missing groups and says so

    Code
      result <- vtest(df_na, mpg, cyl)
    Message
      i Removed 2 rows with missing values in `group`.

# vtest ignores existing grouping and hints at it

    Code
      result <- vtest(dplyr::group_by(mtcars, am), mpg, cyl)
    Message
      i `df` is grouped by am, but `vtest()` ignores this and uses the groups in `group` (cyl) instead.
      > To compare all combinations of several variables, select them all in `group`, e.g. `group = c(a, b)`.

# vtest hints when a numeric group has many values

    Code
      result <- vtest(df_num, a, group)
    Message
      i group in `group` is numeric with 12 different values. Each value is treated as a separate group.

