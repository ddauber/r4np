#' Install and update all R packages used in the book
#'
#' @description Installs every R package used in the book *R For
#' Non-Programmers: A Guide for Social Scientists* in one go. Packages that
#' are missing are installed, packages that are out of date are updated, and
#' packages that are already up to date are left alone. You can run this
#' function again at any time to bring all packages up to date.
#'
#' @details `install_r4np()` uses the [pak](https://pak.r-lib.org) package to
#'   install packages, because it is fast, prefers ready-built (binary)
#'   packages and, on Linux, can install the system libraries some packages
#'   need. If `pak` is not installed yet, it is installed first. If `pak`
#'   cannot be installed or fails, the function falls back to
#'   [utils::install.packages()].
#'
#'   Packages are installed from the CRAN repository set in your R options
#'   (or <https://cloud.r-project.org> if none is set). `gradethis` is not on
#'   CRAN and is installed from <https://rstudio.r-universe.dev>.
#'
#'   Updating packages that are already loaded can fail, especially on
#'   Windows. It is best to run `install_r4np()` in a fresh R session (in
#'   RStudio: *Session > Restart R*).
#'
#'   The following packages are installed:
#'
#'   `r r4np_package_list_md()`
#'
#' @return Invisibly, a character vector with the names of all packages that
#'   are installed after the function has run.
#' @examples
#' \dontrun{
#' # Run this line of code to install or update all relevant packages
#' install_r4np()
#' }
#' @importFrom cli cli_inform cli_warn
#' @export
install_r4np <- function() {
  pkgs <- names(r4np_packages())
  cran_pkgs <- setdiff(pkgs, "gradethis")

  cran <- cran_repos()
  universe <- c(rstudio = "https://rstudio.r-universe.dev", cran)

  before <- installed_versions(pkgs)

  use_pak <- ensure_pak(cran)

  # CRAN packages first; gradethis separately, so that only gradethis comes
  # from r-universe (which also hosts development versions of other packages)
  install_batch(cran_pkgs, repos = cran, use_pak = use_pak)
  install_batch("gradethis", repos = universe, use_pak = use_pak)

  after <- installed_versions(pkgs)
  report_install(before, after, universe)

  invisible(sort(names(after)[!is.na(after)]))
}

#' Packages installed by install_r4np(), with a short description
#' @noRd
r4np_packages <- function() {
  c(
    broom = "Turns the output of statistical tests and models into tibbles.",
    car = "Companion to applied regression, e.g. for Levene's test and VIFs.",
    correlation = "Computes many kinds of correlations, such as partial, polychoric or Bayesian correlations.",
    effectsize = "Computes and converts effect sizes, such as Cohen's d, r or odds ratios.",
    exact2x2 = "Computes the exact McNemar test.",
    ggdist = "ggplot2 extension to plot distributions and uncertainty.",
    ggforce = "ggplot2 extension with additional geoms.",
    ggmosaic2 = "ggplot2 extension to build mosaic plots.",
    ggraph = "Builds network graphs with ggplot2.",
    ggridges = "ggplot2 extension to build ridge plots.",
    gradethis = "Checks answers in the interactive exercises (tutorials) that come with this package.",
    igraph = "Creates and analyses networks; used together with ggraph.",
    infer = "Performs statistical inference using a tidy, pipe-friendly workflow.",
    janitor = "Cleans column names, builds frequency tables and crosstabs, and finds duplicates.",
    jtools = "Summarises and presents the results of regression analyses.",
    lavaan = "Fits latent variable models, such as confirmatory factor analysis and structural equation models.",
    learnr = "Runs the interactive exercises (tutorials) that come with this package.",
    lubridate = "Works with dates and times.",
    mi = "Imputes missing values in a Bayesian framework.",
    mice = "Imputes missing values with multivariate imputation by chained equations (MICE).",
    modelr = "Pipe-friendly functions for modelling data.",
    naniar = "Explores and visualises missing values.",
    parameters = "Extracts parameters from regression models.",
    patchwork = "Combines several ggplots into one plot.",
    performance = "Computes performance indices and checks assumptions of regression models.",
    psych = "Toolbox for personality, psychometric and experimental psychology research.",
    pwr = "Computes statistical power for common tests.",
    rcompanion = "Additional statistical functions, such as effect sizes.",
    rstatix = "Pipe-friendly functions for common statistical tests.",
    scales = "Formats ggplot2 axes and labels.",
    see = "Visualises output from easystats packages.",
    simputation = "Simple imputation methods for missing data.",
    skimr = "Pipe-friendly summary statistics that display nicely in the console.",
    tidytext = "Text mining using tidy data principles.",
    tidyverse = "Installs the core tidyverse packages, such as dplyr, ggplot2 and tidyr.",
    wesanderson = "Colour palettes inspired by Wes Anderson films for ggplot2.",
    wordcloud = "Generates word clouds from text data."
  )
}

#' Markdown list of the packages for the install_r4np() help page
#' @noRd
r4np_package_list_md <- function() {
  pkgs <- r4np_packages()
  paste0("* **", names(pkgs), "**: ", pkgs, collapse = "\n")
}

#' The user's repositories, with a CRAN mirror if none is set
#' @noRd
cran_repos <- function() {
  repos <- getOption("repos")
  if (is.null(repos)) {
    repos <- character()
  }
  if (!"CRAN" %in% names(repos) || identical(unname(repos["CRAN"]), "@CRAN@")) {
    repos["CRAN"] <- "https://cloud.r-project.org"
  }
  repos
}

#' Make sure pak is available, installing it if needed
#'
#' Returns `TRUE` if pak can be used, `FALSE` otherwise.
#' @noRd
ensure_pak <- function(repos) {
  if (has_pak()) {
    return(TRUE)
  }

  cli::cli_inform(c(
    "i" = "Installing {.pkg pak} first, which {.fn install_r4np} uses to install all other packages."
  ))
  tryCatch(
    install_base("pak", repos = repos),
    error = function(cnd) NULL
  )

  if (has_pak()) {
    return(TRUE)
  }

  cli::cli_inform(c(
    "!" = "Could not install {.pkg pak}. Using {.fn install.packages} instead."
  ))
  FALSE
}

#' Install missing and update outdated packages, with pak or base R
#' @noRd
install_batch <- function(pkgs, repos, use_pak) {
  if (use_pak) {
    # pak reads the repositories from options(); restore them afterwards
    old <- options(repos = repos)
    on.exit(options(old), add = TRUE)

    pak_ok <- tryCatch(
      {
        pak_install(pkgs)
        TRUE
      },
      error = function(cnd) {
        cli::cli_inform(c(
          "!" = "{.pkg pak} ran into a problem. Trying {.fn install.packages} instead.",
          "x" = conditionMessage(cnd)
        ))
        FALSE
      }
    )
    if (pak_ok) {
      return(invisible(NULL))
    }
  }

  # Base R: install only what is missing or out of date
  missing <- pkgs[is.na(installed_versions(pkgs))]
  outdated <- intersect(pkgs, outdated_packages(repos))
  todo <- union(missing, outdated)

  if (length(todo) > 0) {
    tryCatch(
      install_base(todo, repos = repos, dependencies = NA),
      error = function(cnd) NULL
    )
  }

  invisible(NULL)
}

#' Summarise what was installed, updated, already current or failed
#' @noRd
report_install <- function(before, after, universe) {
  pkgs <- names(after)
  is_new <- is.na(before) & !is.na(after)
  is_updated <- !is.na(before) & !is.na(after) & before != after
  is_current <- !is.na(before) & !is.na(after) & before == after
  failed <- pkgs[is.na(after)]

  new <- pkgs[is_new]
  updated <- pkgs[is_updated]
  n_current <- sum(is_current)

  msg <- character()
  if (length(new) > 0) {
    msg <- c(msg, "v" = cli::format_inline(
      "Installed {length(new)} package{?s}: {.pkg {new}}."
    ))
  }
  if (length(updated) > 0) {
    msg <- c(msg, "v" = cli::format_inline(
      "Updated {length(updated)} package{?s}: {.pkg {updated}}."
    ))
  }
  if (n_current > 0) {
    msg <- c(msg, "v" = cli::format_inline(
      "{n_current} package{?s} {?was/were} already up to date."
    ))
  }
  if (length(msg) > 0) {
    cli::cli_inform(msg)
  }

  if (length(failed) > 0) {
    hints <- c(
      "i" = "Restart R (in RStudio: {.emph Session > Restart R}) and run {.code install_r4np()} again."
    )
    if ("gradethis" %in% failed) {
      repos_code <- paste0(
        "c(\"", universe[["rstudio"]], "\", \"", universe[["CRAN"]], "\")"
      )
      hints <- c(
        hints,
        "i" = "{.pkg gradethis} is only needed for the interactive exercises. To install it manually, run:",
        " " = "{.code install.packages(\"gradethis\", repos = {repos_code})}"
      )
    }
    cli::cli_warn(c(
      "Could not install {length(failed)} package{?s}: {.pkg {failed}}.",
      hints
    ))
  }

  invisible(NULL)
}

# Thin wrappers around functions from other packages, so they can be mocked
# in tests with testthat::local_mocked_bindings()

#' @noRd
has_pak <- function() {
  requireNamespace("pak", quietly = TRUE)
}

#' @noRd
pak_install <- function(pkgs) {
  pak::pkg_install(pkgs, ask = FALSE)
}

#' @noRd
install_base <- function(pkgs, repos, dependencies = NA) {
  utils::install.packages(pkgs, repos = repos, dependencies = dependencies)
}

#' @noRd
outdated_packages <- function(repos) {
  old <- tryCatch(
    utils::old.packages(repos = repos),
    error = function(cnd) NULL
  )
  if (is.null(old)) character() else rownames(old)
}

#' Installed version of each package, or NA if it is not installed
#' @noRd
installed_versions <- function(pkgs) {
  vapply(
    pkgs,
    function(pkg) {
      tryCatch(
        as.character(utils::packageVersion(pkg)),
        error = function(cnd) NA_character_
      )
    },
    character(1)
  )
}
