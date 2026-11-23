# install_r4np uses pak when it is installed

    Code
      result <- install_r4np()
    Message
      v Installed 36 packages: broom, car, correlation, effectsize, exact2x2, ggdist, ggforce, ggraph, ggridges, gradethis, igraph, infer, janitor, jtools, lavaan, learnr, lubridate, mi, ..., wesanderson, and wordcloud.

# install_r4np installs pak first if it is missing

    Code
      install_r4np()
    Message
      i Installing pak first, which `install_r4np()` uses to install all other packages.
      v Installed 36 packages: broom, car, correlation, effectsize, exact2x2, ggdist, ggforce, ggraph, ggridges, gradethis, igraph, infer, janitor, jtools, lavaan, learnr, lubridate, mi, ..., wesanderson, and wordcloud.

# install_r4np falls back to install.packages if pak cannot be installed

    Code
      install_r4np()
    Message
      i Installing pak first, which `install_r4np()` uses to install all other packages.
      ! Could not install pak. Using `install.packages()` instead.
      v Installed 34 packages: correlation, effectsize, exact2x2, ggdist, ggforce, ggraph, ggridges, gradethis, igraph, infer, janitor, jtools, lavaan, learnr, lubridate, mi, mice, modelr, ..., wesanderson, and wordcloud.
      v Updated 1 package: car.
      v 1 package was already up to date.

# install_r4np falls back to install.packages if pak fails

    Code
      install_r4np()
    Message
      ! pak ran into a problem. Trying `install.packages()` instead.
      x Could not solve package dependencies.
      ! pak ran into a problem. Trying `install.packages()` instead.
      x Could not solve package dependencies.
      v Installed 36 packages: broom, car, correlation, effectsize, exact2x2, ggdist, ggforce, ggraph, ggridges, gradethis, igraph, infer, janitor, jtools, lavaan, learnr, lubridate, mi, ..., wesanderson, and wordcloud.

# install_r4np reports updated and up-to-date packages

    Code
      install_r4np()
    Message
      v Updated 2 packages: car and psych.
      v 34 packages were already up to date.

# install_r4np does nothing when everything is up to date

    Code
      install_r4np()
    Message
      i Installing pak first, which `install_r4np()` uses to install all other packages.
      ! Could not install pak. Using `install.packages()` instead.
      v 36 packages were already up to date.

# install_r4np warns about packages that could not be installed

    Code
      result <- install_r4np()
    Message
      v Installed 34 packages: broom, car, correlation, effectsize, exact2x2, ggdist, ggforce, ggraph, ggridges, igraph, infer, janitor, jtools, learnr, lubridate, mi, mice, modelr, ..., wesanderson, and wordcloud.
    Condition
      Warning:
      Could not install 2 packages: gradethis and lavaan.
      i Restart R (in RStudio: Session > Restart R) and run `install_r4np()` again.
      i gradethis is only needed for the interactive exercises. To install it manually, run:
        `install.packages("gradethis", repos = c("https://rstudio.r-universe.dev", "https://cloud.r-project.org"))`

