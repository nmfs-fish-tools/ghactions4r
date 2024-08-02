#' Use workflow to run r cmd check on Linux, Mac, and Windows GitHub Actions
#' @template workflow_name
#' @param use_full_build_matrix Run R cmd check with two older versions of R in
#'   addition to the three runs that use the release version.
#' @param depends_on_tmb An option that install Matrix from source for windows
#'  and Mac builds to solved a nuanced issue for packages dependent on TMB.
#'  See this [google groups thread](https://groups.google.com/g/tmb-users/c/-GhmuuDP_OQ)
#'  for more information.
#' @export
use_r_cmd_check <- function(workflow_name = "call-r-cmd-check.yml",
                            use_full_build_matrix = FALSE,
                            depends_on_tmb = FALSE) {
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
  if (depends_on_tmb) {
    path_to_yml <- file.path(".github", "workflows", workflow_name)
    txt <- readLines(path_to_yml)
    if (use_full_build_matrix) {
      prev_line <- grep("use_full_build_matrix: true", txt, fixed = TRUE)
    } else {
      prev_line <- grep(
        "uses: nmfs-fish-tools/ghactions4r/.github/workflows/r-cmd-check.yml@main",
        txt,
        fixed = TRUE
      )
      txt <- append(txt, "    with:", prev_line)
      prev_line <- prev_line + 1
    }
    txt <- append(txt, "      depends_on_tmb: true", prev_line)
    writeLines(txt, path_to_yml)
  }
  invisible(workflow_name)
}

#' workflow for calculating code coverage
#' @template workflow_name
#' @param use_public_rspm Use posit package manager instead of CRAN to install dependencies? The
#'  advantage here is that dependencies are precompiled, so install should be much quicker. In
#'  rare situations (like packages with TMB dependencies), using use_public_rspm = FALSE may be
#'  a better option. Note a setting only needs to be specified in the yml if use_public_rspm is FALSE, so
#'  there will be no setting added if use_public_rspm is TRUE.
#' @export
use_calc_coverage <- function(workflow_name = "call-calc-coverage.yml", use_public_rspm = TRUE) {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-calc-coverage.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-calc-coverage.yml"
  )
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  gha <- readLines(path_to_yml)
  if (use_public_rspm == FALSE) {
    uses_line <- grep(
      "uses: nmfs-fish-tools/ghactions4r/.github/workflows/calc-coverage.yml",
      gha
    )
    with_line <- grep("with:", gha[uses_line + 1])
    if (length(with_line) == 0) {
      gha <- append(gha, "    with:", after = uses_line)
    }
    gha <- append(gha, "      use-public-rspm: false", after = uses_line + 1)
    writeLines(gha, path_to_yml)
  }
}

#' Use workflow in current pkg  to automate documenting and styling
#'
#' Style your R package components automatically by running devtools::document(),
#' styler::style_pkg(), and usethis::use_tidy_description().
#' @details
#'  Note that allow the pull request created from this workflow can
#'  be used to trigger github action runs, by using a personal access
#'  token to provide the right permissions. The PAT is first
#' [generated on a user account](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens),
#'  then [added to the repository or organization as a secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository).
#'  Using a PAT can cause recursive runs, so should be used
#'  with caution. See github documentation on
#' [triggering a workflow from a workflow](https://docs.github.com/en/actions/using-workflows/triggering-a-workflow#triggering-a-workflow-from-a-workflow)
#'  for more information.
#' @template workflow_name
#' @param use_rm_dollar_sign in addition to devtools::document and
#'  styler::style_pkg, should ghactions4r::rm_dollar_sign be run? Defaults to FALSE.
#' @param how_to_commit Where should changes made to style and documentation be
#'  committed? Options are 1) in a pull request to the branch ("pull_request")
#'  where the workflow started; or 2) directly to the branch ("directly") where
#'  the workflow started.
#' @param build_trigger Select the build trigger. Options are to run on pushing
#'  commits to main ("push_to_main", the default); run when a pull request is
#'  opened, reopened, or updated ("pull_request"); run manually with the
#'  workflow_dispatch trigger ("manually"); run on the default branch (usually
#'  main) once a week ("weekly").
#' @param use_pat Should a personal access token (PAT) stored as a github secret
#'  be used? This is only necessary if you want the pull request generated by
#' the doc and style workflow to be able to start other github action runs.
#' @param pat_name Name of the personal access token (PAT), as stored in secrets.
#'  Only used if `use_pat = TRUE`. After
#'  [generating the personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens),
#' See [how to add it as a secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository).
#' @examples
#' # set up running the doc and style workflow on each push to main, opening a
#' # pull request to main when changes are found.
#' \dontrun{
#' use_doc_and_style_r()
#' }
#' # the same as
#' \dontrun{
#' use_doc_and_style_r(
#'   how_to_commit = "pull_request",
#'   build_trigger = "push_to_main"
#' )
#' }
#' # Set up running doc and style on each pull request, commiting directly to
#' # the pull request branch
#' \dontrun{
#' use_doc_and_style_r(
#'   how_to_commit = "directly",
#'   build_trigger = "pull_request"
#' )
#' }
#' # Set up the workflow to use a personal access token (PAT)
#' \dontrun{
#' use_doc_and_style_r(use_pat = TRUE, pat_name = "PAT")
#' }
#' @export
use_doc_and_style_r <- function(workflow_name = "call-doc-and-style-r.yml",
                                use_rm_dollar_sign = FALSE,
                                how_to_commit = c("pull_request", "directly"),
                                build_trigger = c(
                                  "push_to_main",
                                  "pull_request",
                                  "manually",
                                  "weekly"
                                ),
                                use_pat = FALSE,
                                pat_name = "PAT") {
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
  if (how_to_commit == "directly" & use_pat == TRUE) {
    stop("Using how_to_commit = 'directly' and use_pat = TRUE can lead to recursive runs.")
  }

  if (how_to_commit == "pull_request" & build_trigger == "pull_request") {
    stop("Currently it is not possible to use how_to_commit == 'pull_request' and build_trigger = 'pull_request' in ghactions4r. Instead, create your own workflow and follow this example: https://github.com/peter-evans/create-pull-request/blob/main/docs/examples.md#use-case-create-a-pull-request-to-modifyfix-pull-requests")
  }
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
  if (use_pat == TRUE) {
    uses_line <- grep(
      "uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml",
      gha
    )
    pat_line <- paste0("      PAT: ${{ secrets.", pat_name, " }}")
    gha <- append(gha, "    secrets:", after = uses_line)
    gha <- append(gha, pat_line, after = uses_line + 1)
  }
  writeLines(gha, path_to_yml)
  usethis::use_git_ignore(ignores = "*.rds", directory = file.path(".github"))
}

#' use workflow in current pkg to update pkg down, where the site is deployed to a branch called gh-pages
#' @template workflow_name
#' @export
use_update_pkgdown <- function(workflow_name = "call-update-pkgdown.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-update-pkgdown.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-update-pkgdown.yml"
  )
}

#' use workflow in current pkg to check pkgdown site builds.
#' @template workflow_name
#' @export
use_build_pkgdown <- function(workflow_name = "call-build-pkgdown.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-build-pkgdown.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-build-pkgdown.yml"
  )
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

#' use workflow to publish to Posit Connect from a private repo
#'
#' This action publishes to connect using the git-backed workflow. Note that
#' it is only necessary to do it this way if the product is in a private or
#' internal repository; otherwise, it is far easier to deploy following the
#' instructions in https://docs.posit.co/connect/user/git-backed/
#' @details To use this workflow, the user will need to generate the manifest.json, and add 2 secrets, one named
#' CONNECT_URL containing the connect url (complete with https:// in front of
#' the address) and one named CONNECT_API_KEY, containing an API Key from connect.
#' To generate the manifest file, follow instructions in the create a manifest
#' from r setup and pushing it to github:
#' https://docs.posit.co/connect/user/git-backed/#creating-a-manifest-file-from-r
#' See  https://docs.posit.co/connect/user/api-keys/#api-keys-creating for
#' instructions on creating and API key from connect and
#' https://octopus.com/blog/githubactions-secrets for instructions on creating
#' secrets.
#' @template workflow_name
#' @return The path to the new github action file.
#' @export
use_connect_publish <- function(workflow_name = "call-connect-publish.yml") {
  check_workflow_name(workflow_name)
  usethis::use_github_action("call-connect-publish.yml",
    save_as = workflow_name,
    url = "https://raw.githubusercontent.com/nmfs-fish-tools/ghactions4r/main/inst/templates/call-connect-publish.yml"
  )
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  instructions_text_general <-
    "To use this workflow, the user will need to generate the manifest.json,\n and add 2 secrets, one named CONNECT_URL containing\nthe connect url (complete with https:// in front of the address) and one named\n CONNECT_API_KEY, containing an API Key from connect."
  instructions_manifest <-
    "To generate the manifest file, follow instructions in 'create a manifest\n from r setup' and push it to github:\nhttps://docs.posit.co/connect/user/git-backed/#creating-a-manifest-file-from-r"
  instructions_api <-
    "See https://docs.posit.co/connect/user/api-keys/#api-keys-creating for\n instructions on creating an API key from connect"
  instructions_secrets <-
    "See https://octopus.com/blog/githubactions-secrets for instructions on\ncreating GitHub secrets."
  usethis::ui_todo(instructions_text_general)
  usethis::ui_info(instructions_manifest)
  usethis::ui_info(instructions_api)
  usethis::ui_info(instructions_secrets)
  invisible(path_to_yml)
}
