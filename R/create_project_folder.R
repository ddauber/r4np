#' Automatically create folders for a project
#'
#' @details Automatically generate a project
#'     folder structure in the working directory of your R session.
#' @export
create_project_folder <- function() {
  dirs <- c(
    "00_raw_data",
    "01_tidy_data",
    "02_r_scripts",
    "03_plots",
    "04_reports",
    "99_other"
  )

  for (d in dirs) {
    if (!base::dir.exists(d)) {
      base::dir.create(d, showWarnings = FALSE)
    }
  }

  message(paste("The following directories have been created in: ", getwd(), ".", sep = ""))
  for (d in dirs) {
    message(paste("-", d))
  }
}
