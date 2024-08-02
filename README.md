# ghactions4r <img src="man/figures/logo.png" alt="arrows circling clapboard, symbol for the gh4actions package" align="right" width=250/>

[![call-r-cmd-check](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml/badge.svg)](https://github.com/nmfs-fish-tools/ghactions4r/actions/workflows/call-r-cmd-check.yml)
[![Lifecycle badge indicating this repository is stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html) 
[![NOAA Fisheries Integrated Toolbox Badge](https://img.shields.io/badge/NOAA_FIT-blue)](https://www.fisheries.noaa.gov/resource/tool-app/noaa-fisheries-integrated-toolbox)
[![codecov Badge](https://codecov.io/github/nmfs-fish-tools/ghactions4r/graph/badge.svg?token=6INRIE2FG6)](https://codecov.io/github/nmfs-fish-tools/ghactions4r)



## What is in `{ghactions4r}`?

This repo contains a [collection of reusable workflows](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/.github/workflows) found helpful for R packages. In addition, {ghactions4r} contains helper functions for setting up the workflows in a separate R package GitHub repository. 

## How is `{ghactions4r}` different than the `usethis::use_github_actions()` workflows?

Rather than having to maintain your own GitHub actions files (as you would need to with actions set up with [`usethis::use_github_action()`](https://usethis.r-lib.org/reference/use_github_action.html)), using a `{ghactions4r}` `use_*` function sets up a github actions file to directly call actions that exist and are maintained in the `{ghactions4r}` repository (in the [workflows folder](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/.github/workflows)). This means all maintenance happens within the `{ghactions4r}` repository rather than in your repository!

## How do I use these workflows in my R package?

First, install the `{ghactions4r}` R package.

Using R universe:
```r
install.packages("ghactions4r", 
repos = c("https://noaa-fisheries-integrated-toolbox.r-universe.dev", 
          "https://cran.r-project.org"))
```
or `remotes::install_github()`:

```r
install.packages("remotes")
remotes::install_github("nmfs-fish-tools/ghactions4r")
```

`use_*()` functions in the `{ghactions4r}` package work like [`use_*()` functions in the `usethis` package](https://github.com/r-lib/usethis#usage).

Open the cloned repository of an R package and run the function of choice. These functions set up the files needed to use the reproducible workflows in `{ghactions4r}`. Below are a list of the basic 
functions, for complete options, see [the pkgdown reference documentation](https://nmfs-fish-tools.github.io/ghactions4r/reference/index.html).

- To run R CMD check using Linux (R release and R development), Mac (R release), and Windows (R release):
```r
ghactions4r::use_r_cmd_check()
```
- To calculate code coverage using `covr::codecov()` :
```r
ghactions4r::use_calc_coverage()
```
(a codecov.io account is also necessary to view the coverage results)

- To update documentation, DESCRIPTION file, and code styling for an R package (with the option of running `ghactions4r::rm_dollar_sign()`):
```r
ghactions4r::use_doc_and_style_r(use_rm_dollar_sign = FALSE)
```

- To automatically update pkgdown that has already been set up:
```r
ghactions4r::use_update_pkgdown()
```

- To check that a pkgdown site builds:
```r
ghactions4r::use_build_pkgdown()
```

- To spell check an R package:
```r
ghactions4r::use_spell_check()
```

Commit and push the files generated up to github, making the github actions available for the repository of the R package.

The templates these functions generate can also be [viewed](https://github.com/nmfs-fish-tools/ghactions4r/tree/main/inst/templates) for reference.

## The GitHub Action Workflow I added to my repository failed. What should I do?

Check that GitHub Actions has been given the right `GITHUB_TOKEN` permissions. GitHub Actions will have read-only permissions by default, rather than read and write permissions. For many workflows in this repository, read and write permissions are necessary. To modify the permissions, follow [these GitHub Documentation instructions](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#configuring-the-default-github_token-permissions).

If still running into failing actions, please submit an [issue](https://github.com/nmfs-fish-tools/ghactions4r/issues) or email kathryn.doering@noaa.gov. Bugs are always possible, as this repository is still experimental. Reporting issues will make `{ghactions4r}` better for all users!

## I want to setup and maintain my own github actions rather than use reusable workflows housed in `{ghactions4r}`. How do I do this?

[r-lib/actions](https://github.com/r-lib/actions) Includes basic actions for R as well as example workflows. In fact, many of the reusable workflows in `{ghactions4r}` are based on these examples. Many of these can be set up through [usethis' GitHub Actions functions](https://usethis.r-lib.org/reference/github_actions.html).

## Code of Conduct

`{ghactions4r}` uses the [NOAA FIT Code of Conduct](https://noaa-fisheries-integrated-toolbox.github.io/resources/noaa%20resources/FIT-code-of-conduct/).

## Contributing

Contributions are welcome! Contributions can be code, but are not just code, but also includes things like:

- Reporting errors or bugs
- Suggesting enhancements
- Correcting or adding documentation (including editing the readme)
- Answering questions on the [discussions page](https://github.com/nmfs-fish-tools/ghactions4r/discussions)

Additional details are available in the [NOAA FIT Contributing Guide](https://noaa-fisheries-integrated-toolbox.github.io/resources/noaa%20fit/contributing/).

### Checklist for adding a new workflow
- [ ] Make sure the workflow is in scope by opening an issue to ask.
- [ ] Create a feature branch or fork to do your work.
- [ ] Create the reusable workflow in `.github/workflows`. For consistency with other workflows, uses dashes (`-`) between words in the file name and use the extension `.yml` (not `.yaml`). Do NOT start the file name with `call-`.
- [ ] Create the template workflow for users to use in `inst/templates`. Name it the same as the reusable workflow, but with `call-` in front.
- [ ] Add a usethis style function to help the user add the workflow by adding the new function to `R/use_r_workflows.R`. Follow the style of the workflows already there.
- [ ] Add a test (or tests) in `tests/testthat/test-use_r_workflow.R`. Add a new test to the end of the file and follow the style of the existing tests in the script.
- [ ] Add to the "How do I use these workflows in my R package?" section of the readme, showing how to use the usethis style r function.
- [ ] Open a pull request to main when work is ready for review!

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an "as is" basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”

<img src="https://raw.githubusercontent.com/nmfs-general-modeling-tools/nmfspalette/main/man/figures/noaa-fisheries-rgb-2line-horizontal-small.png" height="75" alt="NOAA Fisheries">

[U.S. Department of Commerce](https://www.commerce.gov/) | [National Oceanographic and Atmospheric Administration](https://www.noaa.gov) | [NOAA Fisheries](https://www.fisheries.noaa.gov/)
