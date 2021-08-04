#' Automatically create folders for a project
#'
#' @details Automatically generate a project
#'     folder structure in the working directory of your R session.
#' @export
create_dr <- function() {
  base::dir.create("00_raw_data")
  base::dir.create("01_tidy_data")
  base::dir.create("02_r_scripts")
  base::dir.create("03_plots")
  base::dir.create("04_reports")
  base::dir.create("99_other")
  message(paste("The following directories have been created in: ", getwd(), ".", sep=""))
  message("- 00_raw_data")
  message("- 01_tidy_data")
  message("- 02_r_scripts")
  message("- 03_plots")
  message("- 04_reports")
  message("- 99_other")
}
