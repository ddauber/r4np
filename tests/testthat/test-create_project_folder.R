test_that("create_project_folder creates directories", {
  create_project_folder()

  # Check that the directories were created
  expect_true(dir.exists("00_raw_data"))
  expect_true(dir.exists("01_tidy_data"))
  expect_true(dir.exists("02_r_scripts"))
  expect_true(dir.exists("03_plots"))
  expect_true(dir.exists("04_reports"))
  expect_true(dir.exists("99_other"))

  # Clean up by removing the directories
  unlink("00_raw_data", recursive = TRUE)
  unlink("01_tidy_data", recursive = TRUE)
  unlink("02_r_scripts", recursive = TRUE)
  unlink("03_plots", recursive = TRUE)
  unlink("04_reports", recursive = TRUE)
  unlink("99_other", recursive = TRUE)
})
