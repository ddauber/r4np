# install_r4np() is tested with mocked installers, so nothing is installed.
#
# `local_fake_install()` simulates a package library:
# - `installed`: packages already installed (version "1.0")
# - `outdated`: installed packages with a newer version available
# - `fail`: packages that cannot be installed by any method
# - `pak`: whether pak is installed
# - `pak_installable`: whether installing pak succeeds
# - `pak_error`: whether pak_install() throws an error
# It returns an environment that records every installer call.
local_fake_install <- function(installed = character(),
                               outdated = character(),
                               fail = character(),
                               pak = TRUE,
                               pak_installable = TRUE,
                               pak_error = FALSE,
                               env = parent.frame()) {
  state <- new.env()
  state$versions <- stats::setNames(rep("1.0", length(installed)), installed)
  state$outdated <- outdated
  state$pak <- pak
  state$pak_calls <- list()
  state$base_calls <- list()

  install_into_state <- function(pkgs) {
    for (pkg in setdiff(pkgs, fail)) {
      state$versions[[pkg]] <- "2.0"
    }
    state$outdated <- setdiff(state$outdated, pkgs)
  }

  local_mocked_bindings(
    has_pak = function() state$pak,
    pak_install = function(pkgs) {
      state$pak_calls <- c(state$pak_calls,
                           list(list(pkgs = pkgs,
                                     repos = getOption("repos"))))
      if (pak_error) stop("Could not solve package dependencies.")
      # pak installs missing packages and updates outdated ones only
      todo <- pkgs[!pkgs %in% names(state$versions) | pkgs %in% state$outdated]
      install_into_state(todo)
    },
    install_base = function(pkgs, repos, dependencies = NA) {
      state$base_calls <- c(state$base_calls,
                            list(list(pkgs = pkgs, repos = repos,
                                      dependencies = dependencies)))
      if (identical(pkgs, "pak")) {
        state$pak <- pak_installable
      } else {
        install_into_state(pkgs)
      }
    },
    outdated_packages = function(repos) state$outdated,
    installed_versions = function(pkgs) {
      stats::setNames(unname(state$versions[pkgs]), pkgs)
    },
    .env = env
  )

  state
}

all_pkgs <- names(r4np_packages())
cran_pkgs <- setdiff(all_pkgs, "gradethis")

test_that("install_r4np uses pak when it is installed", {
  state <- local_fake_install(pak = TRUE)

  expect_snapshot(result <- install_r4np())

  expect_length(state$base_calls, 0)
  expect_length(state$pak_calls, 2)
  expect_equal(state$pak_calls[[1]]$pkgs, cran_pkgs)
  expect_equal(state$pak_calls[[2]]$pkgs, "gradethis")
  expect_equal(result, sort(all_pkgs))
})

test_that("only gradethis is installed from r-universe", {
  state <- local_fake_install(pak = TRUE)
  suppressMessages(install_r4np())

  cran_call_repos <- state$pak_calls[[1]]$repos
  gradethis_repos <- state$pak_calls[[2]]$repos

  expect_false("https://rstudio.r-universe.dev" %in% cran_call_repos)
  expect_equal(gradethis_repos[["rstudio"]], "https://rstudio.r-universe.dev")
  expect_true("CRAN" %in% names(gradethis_repos))
})

test_that("install_r4np restores the user's repos option", {
  withr::local_options(repos = c(CRAN = "https://example.org/cran"))
  local_fake_install(pak = TRUE)

  suppressMessages(install_r4np())

  expect_equal(getOption("repos"), c(CRAN = "https://example.org/cran"))
})

test_that("install_r4np installs pak first if it is missing", {
  state <- local_fake_install(pak = FALSE)

  expect_snapshot(install_r4np())

  expect_equal(state$base_calls[[1]]$pkgs, "pak")
  expect_length(state$base_calls, 1)
  expect_length(state$pak_calls, 2)
})

test_that("install_r4np falls back to install.packages if pak cannot be installed", {
  state <- local_fake_install(
    installed = c("broom", "car", "dplyr"),
    outdated = "car",
    pak = FALSE,
    pak_installable = FALSE
  )

  expect_snapshot(install_r4np())

  expect_length(state$pak_calls, 0)
  # base R installs only missing or outdated packages, without Suggests
  cran_call <- state$base_calls[[2]]
  expect_false("broom" %in% cran_call$pkgs)
  expect_true("car" %in% cran_call$pkgs)
  expect_true(is.na(cran_call$dependencies))
  expect_equal(state$base_calls[[3]]$pkgs, "gradethis")
})

test_that("install_r4np falls back to install.packages if pak fails", {
  state <- local_fake_install(pak = TRUE, pak_error = TRUE)

  expect_snapshot(install_r4np())

  expect_length(state$pak_calls, 2)
  expect_equal(state$base_calls[[1]]$pkgs, cran_pkgs)
  expect_equal(state$base_calls[[2]]$pkgs, "gradethis")
})

test_that("install_r4np reports updated and up-to-date packages", {
  local_fake_install(installed = all_pkgs, outdated = c("car", "psych"))

  expect_snapshot(install_r4np())
})

test_that("install_r4np does nothing when everything is up to date", {
  state <- local_fake_install(installed = all_pkgs, pak = FALSE,
                              pak_installable = FALSE)

  expect_snapshot(install_r4np())

  # only the attempt to install pak; no packages were reinstalled
  expect_length(state$base_calls, 1)
})

test_that("install_r4np warns about packages that could not be installed", {
  local_fake_install(fail = c("lavaan", "gradethis"))

  expect_snapshot(result <- install_r4np())
  expect_false(any(c("lavaan", "gradethis") %in% result))
})

test_that("cran_repos adds a CRAN mirror only when none is set", {
  withr::local_options(repos = c(CRAN = "@CRAN@"))
  expect_equal(cran_repos(), c(CRAN = "https://cloud.r-project.org"))

  withr::local_options(repos = NULL)
  expect_equal(cran_repos(), c(CRAN = "https://cloud.r-project.org"))

  withr::local_options(repos = c(CRAN = "https://example.org/cran",
                                 other = "https://example.org/other"))
  expect_equal(cran_repos(), c(CRAN = "https://example.org/cran",
                               other = "https://example.org/other"))
})

test_that("the help page lists every package", {
  md <- r4np_package_list_md()
  for (pkg in all_pkgs) {
    expect_match(md, paste0("**", pkg, "**"), fixed = TRUE)
  }
})

test_that("installed_versions returns NA for packages that are not installed", {
  versions <- installed_versions(c("stats", "notarealpackage123"))

  expect_equal(names(versions), c("stats", "notarealpackage123"))
  expect_false(is.na(versions[["stats"]]))
  expect_true(is.na(versions[["notarealpackage123"]]))
})
