#' Automatically create folders for a project
#'
#' @details This function allows to automatically generate a project
#'     folder structure in the working directory of your R session.
#'
#' @return
#' @export
create_dr <- function() {
  dir.create("00_raw_data")
  dir.create("01_tidy_data")
  dir.create("02_r_scripts")
  dir.create("03_plots")
  dir.create("04_reports")
  dir.create("99_other")
}
