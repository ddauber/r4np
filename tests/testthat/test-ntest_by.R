# Create a mock dataframe for testing
df <- data.frame(
  group = rep(c("A", "B", "C", "D"), each = 1000),
  col1 = rnorm(4000),
  col2 = rnorm(4000),
  col3 = rnorm(4000)
)


test_that("ntest_by accepts correct input types", {
  expect_silent(ntest_by(df,
                         cols = c(col1, col2, col3),
                         group = group)
                )
})

test_that("ntest_by rejects incorrect input types", {
  df_wrong <- matrix(rnorm(200), nrow = 100)

  expect_error(ntest_by(df_wrong,
                        cols = 1:2))
})

test_that("ntest_by returns the correct number of rows", {
  result <- ntest_by(df, c(col1, col2, col3), group)
  expect_equal(nrow(result), 12) # 4 groups * 3 columns
})

test_that("ntest_by returns the correct column names", {
  result <- ntest_by(df, c(col1, col2, col3), group)
  expect_equal(names(result), c("group", "variable", "statistic", "p.value", "method"))
})

test_that("ntest_by rejects to handle groups with less than 3 observations", {
  small_df <- data.frame(
    group = rep(c("A", "B", "C", "D"), each = 2),
    col1 = rnorm(8),
    col2 = rnorm(8),
    col3 = rnorm(8)
  )
  expect_error(ntest_by(small_df, c(col1, col2, col3), group), "Sample size of all groups needs to be >= 3.")
})

test_that("ntest_by rejects to handle groups with greater than 5000 observations", {
  big_df <- data.frame(
    group = rep(c("A", "B", "C", "D", "E"), each = 5001),
    col1 = rnorm(25005),
    col2 = rnorm(25005),
    col3 = rnorm(25005)
  )

  expect_error(ntest_by(big_df, c(col1, col2, col3), group), "Sample size of all groups needs to be <= 5000.")
})

test_that("ntest_by produces the correct output", {
  result <- ntest_by(df,
                     cols = c(col1, col2, col3),
                     group = group)

  expect_s3_class(result, "data.frame")
})

