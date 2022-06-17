# ghactions4r

[![call-r-cmd-check](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml/badge.svg)](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml)
[![Lifecycle badge indicating this repository is experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html) 

<img src="man/figures/ghactions4r_hex.png" width="15%" height="15%" alt="arrows circling clapboard, symbol for the gh4actions package">

## What is in ghactions4r?

This repo contains a [collection of reusable workflows](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/.github/workflows) found helpful for R packages. In addition, {ghactions4r} contains helper functions for setting up the workflows in a separate R package Github repository.

## How do I use these workflows in my R package?

First, install the ghactions4r R package:
```r
install.packages("remotes")
remotes::install_github("nmfs-fish-tools/ghactions4r")
```
`use_*()` functions in the `ghactions4r` package work like [`use_*()` functions in the `usethis` package](https://github.com/r-lib/usethis#usage).

Open the cloned repository of an R package and run the function of choice. These functions set up the files needed to use the reproducible workflows in ghactions4r.

- To run R CMD check using linux (R release and R development), mac (R release), and windows (R release):
```r
ghactions4r::use_r_cmd_check()
```
- To calculate code coverage using `covr::codecov()` :
```r
ghactions4r::use_calc_coverage()
```
(a codecov.io account is also necessary to view the coverage results)

- To update documentation using `devtools::document()`:
```r
ghactions4r::use_update_roxygen_docs()
```

- To update R code styling using `styler::style_pkg()`:
```r
ghactions4r::use_style_r_code()
```

- To update documentation and code styling (with the option of running `ghactions4r::rm_dollar_sign()`):
```r
ghactions4r::use_doc_and_style_r(use_rm_dollar_sign = FALSE)
```

- To automatically update pkgdown that has already been set up:
```r
ghactions4r::use_pkgdown()
```

Commit and push the files generated up to github, making the github actions available for the repository of the R package.

The templates these functions generate can also be [viewed](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/inst/templates) for reference.

## The Github action I added to my repository failed. What should I do?

Check that Github Actions has been given the right `GITHUB_TOKEN` permissions. Github Actions will have read-only permissions by default, rather than read and write permissions. For many workflows in this repository, read and write permissions are necessary. To modify the permissions, follow [these Github Documentation instructions](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#configuring-the-default-github_token-permissions).

If still running into failing actions, please submit an [issue](https://github.com/nmfs-fish-tools/ghactions4r/issues) or email kathryn.doering@noaa.gov. Bugs are always possible, as this repository is still experimental. Reporting issues will make ghactions4r better for all users!

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”

<img src="https://raw.githubusercontent.com/nmfs-general-modeling-tools/nmfspalette/main/man/figures/noaa-fisheries-rgb-2line-horizontal-small.png" height="75" alt="NOAA Fisheries">

[U.S. Department of Commerce](https://www.commerce.gov/) | [National Oceanographic and Atmospheric Administration](https://www.noaa.gov) | [NOAA Fisheries](https://www.fisheries.noaa.gov/)
