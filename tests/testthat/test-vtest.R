# Reference values from car::leveneTest()
car_levene <- function(formula, data, center = "median") {
  center_fn <- switch(center, median = stats::median, mean = mean)
  res <- suppressWarnings(car::leveneTest(formula, data = data,
                                          center = center_fn))
  list(statistic = res[["F value"]][1],
       df1 = res[["Df"]][1],
       df2 = res[["Df"]][2],
       p.value = res[["Pr(>F)"]][1])
}

expect_matches_car <- function(result, reference) {
  expect_equal(result$statistic, reference$statistic)
  expect_equal(result$df1, reference$df1)
  expect_equal(result$df2, reference$df2)
  expect_equal(result$p.value, reference$p.value)
}

test_that("vtest returns one tidy row per variable", {
  result <- vtest(mtcars, c(mpg, disp, hp), cyl)

  expect_s3_class(result, "tbl_df")
  expect_named(result,
               c("variable", "statistic", "df1", "df2", "p.value", "method"))
  expect_equal(result$variable, c("mpg", "disp", "hp"))
  expect_equal(unique(result$method), "Levene's test (center = median)")
})

test_that("vtest matches car::leveneTest with the default center (median)", {
  skip_if_not_installed("car")

  result <- vtest(mtcars, mpg, cyl)
  expect_matches_car(result, car_levene(mpg ~ factor(cyl), mtcars))

  result <- vtest(iris, Sepal.Width, Species)
  expect_matches_car(result, car_levene(Sepal.Width ~ Species, iris))
})

test_that("vtest matches car::leveneTest with center = 'mean'", {
  skip_if_not_installed("car")

  result <- vtest(mtcars, mpg, cyl, center = "mean")
  expect_matches_car(result, car_levene(mpg ~ factor(cyl), mtcars, "mean"))
  expect_equal(result$method, "Levene's test (center = mean)")
})

test_that("vtest matches car::leveneTest with several grouping variables", {
  skip_if_not_installed("car")

  result <- vtest(mtcars, mpg, c(cyl, am))
  expect_matches_car(result,
                     car_levene(mpg ~ factor(cyl) * factor(am), mtcars))
})

test_that("vtest handles missing values per variable like car", {
  skip_if_not_installed("car")

  df_na <- mtcars
  df_na$mpg[c(1, 5, 20)] <- NA

  result <- vtest(df_na, c(mpg, disp), cyl)

  expect_matches_car(result[1, ], car_levene(mpg ~ factor(cyl), df_na))
  # disp keeps all rows, even where mpg is missing
  expect_matches_car(result[2, ], car_levene(disp ~ factor(cyl), mtcars))
})

test_that("vtest works with piped and named data", {
  expect_equal(mtcars |> vtest(mpg, cyl),
               vtest(df = mtcars, cols = mpg, group = cyl))
})

test_that("vtest never tests the grouping variable", {
  result <- vtest(mtcars, c(mpg, cyl), cyl)
  expect_equal(result$variable, "mpg")

  expect_snapshot(vtest(mtcars, cols = cyl, group = cyl), error = TRUE)
})

test_that("vtest rejects input that is not a dataframe", {
  expect_snapshot(vtest(matrix(1:10), cols = 1, group = 2), error = TRUE)
})

test_that("vtest asks for cols and group when missing", {
  expect_snapshot(vtest(mtcars, cols = mpg), error = TRUE)
  expect_snapshot(vtest(mtcars, group = cyl), error = TRUE)
})

test_that("vtest explains unknown column selections", {
  expect_snapshot(vtest(mtcars, cols = not_a_column, group = cyl),
                  error = TRUE)
  expect_snapshot(vtest(mtcars, cols = mpg, group = not_a_group),
                  error = TRUE)
})

test_that("vtest rejects invalid center values", {
  expect_snapshot(vtest(mtcars, mpg, cyl, center = "mode"), error = TRUE)
  expect_snapshot(vtest(mtcars, mpg, cyl, center = 1), error = TRUE)
})

test_that("vtest rejects non-numeric variables", {
  df_chr <- data.frame(group = rep(c("A", "B"), each = 5),
                       a = rnorm(10),
                       b = letters[1:10])

  expect_snapshot(vtest(df_chr, c(a, b), group), error = TRUE)
})

test_that("vtest needs at least two groups", {
  df_one <- data.frame(group = "A", a = rnorm(10))

  expect_snapshot(vtest(df_one, a, group), error = TRUE)
})

test_that("vtest needs at least two values per group", {
  df_small <- data.frame(group = c("A", "A", "A", "B"), a = c(1, 2, 3, 4))

  expect_snapshot(vtest(df_small, a, group), error = TRUE)
})

test_that("vtest rejects variables that are constant within every group", {
  df_const <- data.frame(group = rep(c("A", "B"), each = 3),
                         a = c(1, 1, 1, 2, 2, 2),
                         b = c(1, 2, 3, 4, 6, 8))

  expect_snapshot(vtest(df_const, c(a, b), group), error = TRUE)
})

test_that("vtest removes rows with missing groups and says so", {
  df_na <- mtcars
  df_na$cyl[c(1, 2)] <- NA

  expect_snapshot(result <- vtest(df_na, mpg, cyl))
  expect_equal(result, vtest(df_na[-c(1, 2), ], mpg, cyl))
})

test_that("vtest ignores existing grouping and hints at it", {
  expect_snapshot(result <- vtest(dplyr::group_by(mtcars, am), mpg, cyl))
  expect_equal(result, vtest(mtcars, mpg, cyl))

  # No message when the existing grouping matches `group`
  expect_silent(vtest(dplyr::group_by(mtcars, cyl), mpg, cyl))
})

test_that("vtest hints when a numeric group has many values", {
  df_num <- data.frame(group = rep(1:12, each = 3), a = rnorm(36))

  expect_snapshot(result <- vtest(df_num, a, group))
})
