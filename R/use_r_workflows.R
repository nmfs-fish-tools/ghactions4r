#' Use workflow to run r cmd check on linux, mac, and windows gh actions
#' @export
use_r_cmd_check <- function() {
  usethis::use_github_action("call-r-cmd-check.yml",
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-r-cmd-check.yml",
  )
}

#' workflow for calculating code coverage
#' @export
use_calc_coverage <- function() {
  usethis::use_github_action("call-calc-coverage.yml",
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-calc-coverage.yml",
  )
}

#' Use workflow in current pkg  to automate documenting and styling
#' @param use_rm_dollar_sign in addition to devtools::document and styler::style_pkg,
#'   should r4ss:::rm_dollar_sign be run? Defaults to FALSE.
#' @export
use_doc_and_style_r <- function(use_rm_dollar_sign = FALSE) {
  if (use_rm_dollar_sign == FALSE) {
    usethis::use_github_action("call-doc-and-style-r.yml",
      url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-doc-and-style-r.yml",
    )
  } else {
    usethis::use_github_action("call-doc-and-style-r-rm-dol.yml",
      url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-doc-and-style-r-rm-dol.yml",
    )
  }
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

# To add, first need to get working in the SSMSE repo.
# use_update_bookdown <- function() {
#
# }

#' use workflow in current pkg to update pkg down, where the site is deployed to a branch called gh-pages
#' @export
use_pkgdown <- function() {
  usethis::use_github_action("call-update-pkgdown.yml",
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-update-pkgdown.yml",
  )
}

#' use workflow in curent pkg to run devtools::document() and submit results as a PR
#' @export
use_update_roxgyen_docs <- function() {
  usethis::use_github_action("call-update-docs.yml",
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-update-docs.yml",
  )
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

#' use workflow in current pkg to run styler::style_pkg() and submit results as a PR
#' @export
use_style_r_code <- function() {
  usethis::use_github_action("call-style.yml",
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-style.yml",
  )
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}
