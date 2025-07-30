test_that("ntest accepts correct input types", {
  df <- data.frame(a = rnorm(100),
                   b = rnorm(100))

  expect_silent(ntest(df, cols = c(a, b)))
})

test_that("ntest rejects incorrect input types", {
  df <- matrix(rnorm(200), nrow = 100)

  expect_error(ntest(df, cols = 1:2))
})

test_that("ntest aborts when selected columns are not numeric", {
  df <- data.frame(a = rnorm(10),
                   b = letters[1:10])

  expect_error(ntest(df, cols = c(a, b)), "All selected columns must be numeric")
})

test_that("ntest aborts when n < 3", {
  df <- data.frame(a = rnorm(2),
                   b = rnorm(2))

  expect_error(ntest(df, cols = c(a,b)))
})

test_that("ntest aborts when n > 5000", {
  df <- data.frame(a = rnorm(5001),
                   b = rnorm(5001))

  expect_error(ntest(df, cols = c(a,b)))
})

test_that("ntest produces the correct output", {
  df <- data.frame(a = rnorm(100),
                   b = rnorm(100))

  result <- ntest(df, cols = c(a, b))

  expect_s3_class(result, "data.frame")
})

