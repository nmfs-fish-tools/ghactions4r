#' Use workflow to run r cmd check on Linux, Mac, and Windows GitHub Actions
#' @template workflow_name
#' @param use_full_build_matrix Run R cmd check with two older versions of R in
#'   addition to the three runs that use the release version.
#' @export
use_r_cmd_check <- function(workflow_name = "call-r-cmd-check.yml",
                            use_full_build_matrix = FALSE) {
  check_workflow_name(workflow_name)
  if (use_full_build_matrix) {
    url_name <- "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-r-cmd-check-full.yml"
  } else {
    url_name <- "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-r-cmd-check.yml"
  }
  usethis::use_github_action("call-r-cmd-check.yml",
    save_as = workflow_name,
    url = url_name
  )
}

#' workflow for calculating code coverage
#' @template workflow_name
#' @export
use_calc_coverage <- function(workflow_name = "call-calc-coverage.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-calc-coverage.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-calc-coverage.yml"
  )
}

#' Use workflow in current pkg  to automate documenting and styling
#'
#' Style your R package components automatically by running devtools::document(),
#' styler::style_pkg(), and usethis::use_tidy_description().
#' @template workflow_name
#' @param use_rm_dollar_sign in addition to devtools::document and
#'  styler::style_pkg, should r4ss:::rm_dollar_sign be run? Defaults to FALSE.
#' @param how_to_commit Where should changes made to style and documentation be
#'  committed? Options are 1) in a pull request to the branch ("pull_request")
#'  where the workflow started; or 2) directly to the branch ("directly") where
#'  the workflow started.
#' @param build_trigger Select the build trigger. Options are to run on pushing
#'  commits to main ("push_to_main", the default); run when a pull request is
#'  opened, reopened, or updated ("pull_request"); run manually with the
#'  workflow_dispatch trigger ("manually"); run on the default branch (usually
#'  main) once a week ("weekly").
#' @export
use_doc_and_style_r <- function(workflow_name = "call-doc-and-style-r.yml",
                                use_rm_dollar_sign = FALSE,
                                how_to_commit = c("pull_request", "directly"),
                                build_trigger = c(
                                  "push_to_main",
                                  "pull_request",
                                  "manually",
                                  "weekly"
                                )) {
  # input checks
  check_workflow_name(workflow_name)
  how_to_commit <- match.arg(arg = how_to_commit, choices = c("pull_request", "directly"))
  build_trigger <- match.arg(
    arg = build_trigger,
    choices = c(
      "push_to_main", "pull_request", "manually",
      "weekly"
    )
  )
  # get the template github action
  usethis::use_github_action("call-doc-and-style-r.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-doc-and-style-r.yml"
  )
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  gha <- readLines(path_to_yml)
  # modify the build trigger as needed
  build_trigger_lines <- switch(build_trigger,
    push_to_main = c("  push:", "    branches: [main]"),
    pull_request = "  pull_request:",
    manually = "  workflow_dispatch:",
    weekly = c(
      "  schedule:",
      "# Use https://crontab.guru/ to edit the time",
      "    - cron:  '15 02 * * 0'"
    )
  )
  # remove existing build trigger
  build_trigger_rm_lines <- grep("(push)|(branches)", gha)
  insert_line <- build_trigger_rm_lines[1] - 1
  gha <- gha[-build_trigger_rm_lines]
  # add new build trigger
  gha <- append(gha, build_trigger_lines, after = insert_line)
  # additional options
  if (use_rm_dollar_sign == TRUE | how_to_commit == "directly") {
    uses_line <- grep(
      "uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml",
      gha
    )
    with_line <- grep("with:", gha[uses_line + 1])
    if (length(with_line) == 0) {
      gha <- append(gha, "    with:", after = uses_line)
    }
    if (how_to_commit == "directly") {
      gha <- append(gha, "      commit-directly: true", after = uses_line + 1)
    }
    if (use_rm_dollar_sign == TRUE) {
      gha <- append(gha, "      run-rm_dollar_sign: true", after = uses_line + 1)
    }
  }
  writeLines(gha, path_to_yml)
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

#' use workflow in current pkg to update pkg down, where the site is deployed to a branch called gh-pages
#' @template workflow_name
#' @export
update_pkgdown <- function(workflow_name = "call-update-pkgdown.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-update-pkgdown.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-update-pkgdown.yml"
  )
}

#' use workflow in current pkg to run devtools::document() and submit results as a PR
#' @template workflow_name
#' @export
use_update_roxygen_docs <- function(workflow_name = "call-update-docs.yml") {
  usethis::use_github_action("call-update-docs.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-update-docs.yml"
  )
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

#' use workflow in current pkg to run `usethis::use_tidy_description()`
#'
#' Run `usethis::use_tidy_description()` upon changes to the DESCRIPTION file
#' and submit results as a PR.
#' @template workflow_name
#' @export
use_style_description <- function(workflow_name = "call-style-description.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action(
    "call-style-description.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-style-description.yml"
  )
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

#' use workflow in current pkg to run styler::style_pkg() and submit results as a PR
#' @template workflow_name
#' @export
use_style_r_code <- function(workflow_name = "call-style.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-style.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-style.yml"
  )
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}


#' use workflow in current pkg to build and deploy (update) bookdown
#' Builds the bookdown, then deploys it to a branch in the same repository called gh-pages.
#' The repository must be
#' @template workflow_name
#' @param bookdown_input Used as the input for `input` in `bookdown::render_book()`.
#' @param bookdown_output_dir Used as the input for `output_dir` in `bookdown::render_book()`.
#'  Note that `NULL` will currently not work.
#' @param deployment_dir The directory to deploy to on the gh-pages branch.
#' @returns Path to the .yml file.
#' @export
use_build_deploy_bookdown <- function(
    workflow_name = "call-build-deploy-bookdown.yml",
    bookdown_input = ".",
    bookdown_output_dir = "_book",
    deployment_dir = "_book") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-build-deploy-bookdown.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-build-deploy-bookdown.yml"
  )
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  gha <- readLines(path_to_yml)
  # edit workflow based on bookdown_input, bookdown_output_dir, deployment_dir
  # use approach as in other use_* functions.
  input_line <- grep("bookdown_input:", gha, fixed = TRUE)
  gha[input_line] <- paste0("        bookdown_input: ", bookdown_input, " # where the bookdown .Rmd files are located")
  output_dir_line <- grep("bookdown_output_dir:", gha, fixed = TRUE)
  gha[output_dir_line] <- paste0("        bookdown_output_dir: ", bookdown_output_dir, " # where the bookdown files are rendered to.")
  deploy_line <- grep("deployment_dir:", gha, fixed = TRUE)
  gha[deploy_line] <- paste0("        deployment_dir: ", deployment_dir, " # The subfolder of the gh-pages branch that the bookdown is deployed to.")
  writeLines(gha, path_to_yml)
  return(path_to_yml)
}

#' use workflow to run spelling::spell_check_package()
#' @template workflow_name
#' @return The path to the new github action file.
#' @export
use_spell_check <- function(workflow_name = "call-spell-check.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-spell-check.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-spell-check.yml"
  )
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  return(path_to_yml)
}
