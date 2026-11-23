# Changelog

## r4np (development version)

- [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  has been redesigned:
  - It now installs only packages that are missing and updates those
    that are out of date; packages that are already up to date are
    skipped. Running it again is quick and brings all packages up to
    date.
  - It uses `pak` to install packages, installing `pak` first if needed,
    and falls back to
    [`install.packages()`](https://rdrr.io/r/utils/install.packages.html)
    if `pak` is unavailable or fails.
  - It no longer fails on Linux (it previously always used
    `type = "both"`, which only works on Windows and macOS).
  - It no longer installs the suggested packages of every package
    (`dependencies = TRUE`), which added hundreds of unneeded packages.
  - It respects the CRAN repository set in your R options instead of
    always using `cloud.r-project.org`.
  - It reports which packages were installed, updated, already up to
    date or could not be installed, instead of always reporting success.
  - The help page now lists all packages from the same source as the
    code, so the two cannot get out of sync.
- [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  now installs `ggmosaic2` for mosaic plots, matching the book. It
  replaces `ggmosaic`, which was archived on CRAN.

## r4np 1.2.0

- New [`vtest()`](https://ddauber.github.io/r4np/reference/vtest.md)
  runs Levene’s test for homogeneity of variance on several variables at
  once and returns the results as a tidy tibble. It mirrors
  [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md):
  variables are chosen with `cols`, groups with `group` (several
  grouping variables are combined, e.g. for a two-way ANOVA), and inputs
  are checked with clear error messages. The default `center = "median"`
  matches
  [`car::leveneTest()`](https://rdrr.io/pkg/car/man/leveneTest.html);
  `center = "mean"` gives the original Levene’s test. The computation
  uses only `stats`, so `car` is not required.

- [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  now also installs `learnr` and `gradethis`, which the interactive
  exercises need. `gradethis` is installed from r-universe; if that
  fails, the other packages stay installed and a message shows how to
  install it manually. The function now uses `cli` messages and returns
  the installed package names invisibly.

- Removed `ggmosaic` from
  [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  and Suggests, as it was archived on CRAN (2025-11-10) and broke
  `R CMD check`.

- `gradethis` (used in the tutorials) is now found via
  `Additional_repositories` (r-universe) instead of the non-CRAN
  `Remotes` field.

- Updated `CITATION` to use
  [`bibentry()`](https://rdrr.io/r/utils/bibentry.html) and dataset
  sources to use `\doi{}`.

- Updated the GitHub Actions R-CMD-check workflow to the current r-lib
  standard (the retired `ubuntu-20.04` runner left Linux checks queued
  forever).

## r4np 1.1.0

### Breaking changes

- The first column of the
  [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) output
  is now called `variable` instead of `row_name`, consistent with
  [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md).

### Improvements

- [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)
  now gives the same clear error messages as
  [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) for
  invalid input, counts sample sizes per variable ignoring missing
  values, rejects variables that are constant within a group, never
  tests the grouping variable itself, and ignores any existing grouping
  of `df` (with a short hint if it differs from `group`).
- Documentation of `cols` and `group` in
  [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) and
  [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)
  now explains that they take unquoted column names and tidyselect
  helpers, and that `df` can be piped in. Examples no longer use
  `\dontrun{}`.
- [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) now
  ungroups grouped data frames before testing, so grouping variables are
  no longer tested by mistake. A hint suggests
  [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)
  for per-group tests.
- [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) now
  checks its inputs before testing and gives clear error messages when
  `df` is not a dataframe, `cols` is missing or selects no variables,
  variables are not numeric, sample sizes are out of range, or a
  variable is constant.
- [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) and
  [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)
  no longer use `.data` inside tidyselect expressions, which was
  deprecated in tidyselect 1.2.0.
- [`ntest()`](https://ddauber.github.io/r4np/reference/ntest.md) and
  [`ntest_by()`](https://ddauber.github.io/r4np/reference/ntest_by.md)
  now import
  [`shapiro.test()`](https://rdrr.io/r/stats/shapiro.test.html) from
  `stats` explicitly (fixes an R CMD check NOTE).
- Documentation is now generated with roxygen2 8.1.0 and markdown
  enabled, so code formatting and links in all help pages render
  correctly.

## r4np 1.0.1

- Added `NEWS.md` to track package changes.

## r4np 1.0.0

- Finished exercises for all chapters and bundled them with the package.
- Added the `infer` package to
  [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  to support inference examples.
- Polished dataset descriptions for the final release.

## r4np 0.9.0

- Revised dataset descriptions for clarity.
- Added the author’s ORCID to package metadata.

## r4np 0.8.1

- Introduced blank exercise templates for future chapters.

## r4np 0.8.0

- First public beta release with extensive data documentation updates.

## r4np 0.0.2

- Added new `wvs` dataset containing a subset of the World Values
  Survey.
- Expanded documentation and examples for helper functions.
- Included CITATION file and enabled R CMD check support.

## r4np 0.0.1

- Initial release of the r4np companion package.
- Provided
  [`install_r4np()`](https://ddauber.github.io/r4np/reference/install_r4np.md)
  to install companion resources.
- Introduced `create_dr()` helper to scaffold project folders.
- Shipped with `imdb_top_250` sample data for exercises.
