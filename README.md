# ghactions4r

[![call-r-cmd-check](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml/badge.svg)](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml) ![Lifecycle badge indicating this repository is experimental](man/figures/lifecycle-experimental.svg)

## What is in ghactions4r?

This repo contains a [collection of reusable workflows](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/.github/workflows) found helpful for R packages in addition to helper functions in an R package to allow users to more easily set up the workflows for their repo.

## How do I use these workflows in my R package?

First, install the ghactions4r R package:
```r
install.packages("remotes")
remotes::install_github("nmfs-fish-tools/ghactions4r")
```
`use_*()` functions in the `ghactions4r` package work like [`use_*()` functions in the `usethis` package](https://github.com/r-lib/usethis#usage).

Open the cloned repository of the R package to include the workflow in and run the function of choice:

- To run R CMD check using linux (R release and R development), mac (R release), and windows (R release):
```r
ghactions4r::use_r_cmd_check()
```
- To calculate code coverage using `covr::codecov()` :
```r
ghactions4r::use_calc_coverage()
```

- To update documentation using `devtools::document()`:
```r
ghactions4r::use_update_roxygen_docs()
```

- To update code styling using `styler::style_pkg()`:
```r
ghactions4r::use_style_r_code()
```

- To update documentation and code styling (with the option of running `r4ss:::rm_dollar_sign()`)
```r
ghactions4r::use_doc_and_style_r(use_rm_dollar_sign = FALSE)
```

- To automatically update package down that has already been set up:
```r
ghactions4r::use_pkgdown()
```

Commit an push the files up to github, making the github actions available on the repository of the R package.

The templates these functions generate can also be [viewed](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/inst/templates) for reference.

## The Github action I added to my repository failed. What should I do?

Please submit an [issue](https://github.com/nmfs-fish-tools/ghactions4r/issues) or email fisheries.toolbox@noaa.gov. Bugs are always possible, as this repository is still new and experimental.

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”

<img src="https://raw.githubusercontent.com/nmfs-general-modeling-tools/nmfspalette/main/man/figures/noaa-fisheries-rgb-2line-horizontal-small.png" height="75" alt="NOAA Fisheries">

[U.S. Department of Commerce](https://www.commerce.gov/) | [National Oceanographic and Atmospheric Administration](https://www.noaa.gov) | [NOAA Fisheries](https://www.fisheries.noaa.gov/)
