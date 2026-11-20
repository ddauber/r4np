# ntest rejects input that is not a dataframe

    Code
      ntest(df, cols = 1:2)
    Condition
      Error in `ntest()`:
      ! `df` must be a dataframe.
      x You supplied a double matrix.

# ntest asks for cols when missing

    Code
      ntest(mtcars)
    Condition
      Error in `ntest()`:
      ! Please tell `ntest()` which variables to test using `cols`.
      i For example: `ntest(mtcars, cols = c(mpg, disp))`.

# ntest explains unknown or empty column selections

    Code
      ntest(mtcars, cols = c(mpg, not_a_column))
    Condition
      Error in `ntest()`:
      ! Could not find the variables given in `cols`.
      Caused by error in `select()`:
      ! Can't select columns that don't exist.
      x Column `not_a_column` doesn't exist.

---

    Code
      ntest(mtcars, cols = starts_with("zzz"))
    Condition
      Error in `ntest()`:
      ! `cols` did not select any variables.
      i Check the spelling of the column names in `df`.

# ntest rejects non-numeric variables

    Code
      ntest(df, cols = c(a, b, c))
    Condition
      Error in `ntest()`:
      ! `ntest()` can only test numeric variables.
      x Not numeric: b and c.

# ntest aborts when n < 3

    Code
      ntest(df, cols = c(a, b))
    Condition
      Error in `ntest()`:
      ! Sample size of all variables needs to be >= 3.
      x Variables with n < 3: a and b.

# ntest aborts when n > 5000

    Code
      ntest(df, cols = c(a, b))
    Condition
      Error in `ntest()`:
      ! Sample size of all variables needs to be <= 5000.
      x Variables with n > 5000: a and b.

# ntest rejects constant variables

    Code
      ntest(df, cols = c(a, b))
    Condition
      Error in `ntest()`:
      ! Cannot test variables where all values are identical.
      x Constant variable: b.

