test_that("ntest accepts correct input types", {
  set.seed(1)
  df <- data.frame(a = rnorm(100),
                   b = rnorm(100))

  expect_silent(ntest(df, cols = c(a, b)))
})

test_that("ntest works with piped and named data", {
  expect_equal(mtcars |> ntest(c(mpg, disp)),
               ntest(df = mtcars, cols = c(mpg, disp)))
})

test_that("ntest rejects input that is not a dataframe", {
  df <- matrix(rnorm(200), nrow = 100)

  expect_snapshot(ntest(df, cols = 1:2), error = TRUE)
})

test_that("ntest asks for cols when missing", {
  expect_snapshot(ntest(mtcars), error = TRUE)
})

test_that("ntest explains unknown or empty column selections", {
  expect_snapshot(ntest(mtcars, cols = c(mpg, not_a_column)), error = TRUE)
  expect_snapshot(ntest(mtcars, cols = starts_with("zzz")), error = TRUE)
})

test_that("ntest rejects non-numeric variables", {
  df <- data.frame(a = rnorm(10),
                   b = letters[1:10],
                   c = factor(letters[1:10]))

  expect_snapshot(ntest(df, cols = c(a, b, c)), error = TRUE)
})

test_that("ntest aborts when n < 3", {
  df <- data.frame(a = rnorm(2),
                   b = rnorm(2))

  expect_snapshot(ntest(df, cols = c(a, b)), error = TRUE)
})

test_that("ntest aborts when n > 5000", {
  df <- data.frame(a = rnorm(5001),
                   b = rnorm(5001))

  expect_snapshot(ntest(df, cols = c(a, b)), error = TRUE)
})

test_that("ntest ignores missing values when counting observations", {
  df <- data.frame(a = c(1, 2, NA, NA))

  expect_error(ntest(df, cols = a), "n < 3")
})

test_that("ntest rejects constant variables", {
  df <- data.frame(a = rnorm(10),
                   b = rep(1, 10))

  expect_snapshot(ntest(df, cols = c(a, b)), error = TRUE)
})

test_that("ntest produces the correct output", {
  set.seed(1)
  df <- data.frame(a = rnorm(100),
                   b = rnorm(100))

  result <- ntest(df, cols = c(a, b))

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 2)
  expect_equal(names(result), c("variable", "statistic", "p.value", "method"))
  expect_equal(result$variable, c("a", "b"))
})

test_that("ntest ungroups grouped data and hints at ntest_by", {
  grouped <- dplyr::group_by(mtcars, cyl)

  expect_message(result <- ntest(grouped, cols = mpg), "ntest_by")
  expect_equal(result, ntest(mtcars, cols = mpg))
})
