# Create a mock dataframe for testing
set.seed(1)
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

test_that("ntest_by works with piped and named data", {
  expect_equal(mtcars |> ntest_by(mpg, cyl),
               ntest_by(df = mtcars, cols = mpg, group = cyl))
})

test_that("ntest_by rejects input that is not a dataframe", {
  df_wrong <- matrix(rnorm(200), nrow = 100)

  expect_snapshot(ntest_by(df_wrong, cols = 1, group = 2), error = TRUE)
})

test_that("ntest_by asks for cols and group when missing", {
  expect_snapshot(ntest_by(mtcars, cols = mpg), error = TRUE)
  expect_snapshot(ntest_by(mtcars, group = cyl), error = TRUE)
})

test_that("ntest_by explains unknown column selections", {
  expect_snapshot(ntest_by(mtcars, cols = not_a_column, group = cyl),
                  error = TRUE)
  expect_snapshot(ntest_by(mtcars, cols = mpg, group = not_a_group),
                  error = TRUE)
})

test_that("ntest_by never tests the grouping variable", {
  result <- ntest_by(mtcars, cols = c(mpg, cyl), group = cyl)
  expect_equal(unique(result$variable), "mpg")

  expect_snapshot(ntest_by(mtcars, cols = cyl, group = cyl), error = TRUE)
})

test_that("ntest_by rejects non-numeric variables", {
  df_chr <- data.frame(group = rep(c("A", "B"), each = 5),
                       a = rnorm(10),
                       b = letters[1:10])

  expect_snapshot(ntest_by(df_chr, cols = c(a, b), group = group),
                  error = TRUE)
})

test_that("ntest_by ignores existing grouping and hints at it", {
  expect_snapshot(
    result <- ntest_by(dplyr::group_by(mtcars, am), mpg, cyl)
  )
  expect_equal(result, ntest_by(mtcars, mpg, cyl))
})

test_that("ntest_by gives no hint when existing grouping matches group", {
  expect_silent(ntest_by(dplyr::group_by(mtcars, cyl), mpg, cyl))
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
  expect_snapshot(ntest_by(small_df, c(col1, col2, col3), group), error = TRUE)
})

test_that("ntest_by ignores missing values when counting observations", {
  na_df <- data.frame(
    group = rep(c("A", "B"), each = 4),
    col1 = c(rnorm(4), 1, 2, NA, NA)
  )
  expect_error(ntest_by(na_df, col1, group), "Groups? with n < 3: B")
})

test_that("ntest_by rejects to handle groups with greater than 5000 observations", {
  big_df <- data.frame(
    group = rep(c("A", "B", "C", "D", "E"), each = 5001),
    col1 = rnorm(25005),
    col2 = rnorm(25005),
    col3 = rnorm(25005)
  )

  expect_snapshot(ntest_by(big_df, c(col1, col2, col3), group), error = TRUE)
})

test_that("ntest_by rejects variables that are constant within a group", {
  const_df <- data.frame(
    group = rep(c("A", "B"), each = 5),
    col1 = c(rnorm(5), rep(1, 5)),
    col2 = rnorm(10)
  )

  expect_snapshot(ntest_by(const_df, c(col1, col2), group), error = TRUE)
})

test_that("ntest_by produces the correct output", {
  result <- ntest_by(df,
                     cols = c(col1, col2, col3),
                     group = group)

  expect_s3_class(result, "data.frame")
})
