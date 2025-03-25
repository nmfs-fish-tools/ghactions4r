temp_path <- file.path(tempdir(), "rcmdcheck")
dir.create(temp_path)
old_wd <- getwd()
setwd(temp_path)
on.exit(setwd(old_wd), add = TRUE)
on.exit(unlink(temp_path, recursive = TRUE), add = TRUE)
# comment out below b/c causes an error when running check on codespaces
# on.exit(usethis::proj_set("."), add = TRUE)
pkg <- usethis::create_package(".")
usethis::proj_set(".")

test_that("use_r_cmd_check() works with defaults", {
  use_r_cmd_check()
  expect_true(file.exists(".github/workflows/call-r-cmd-check.yml"))
  expect_true(file.exists(".github/.gitignore"))
  test <- readLines(".github/workflows/call-r-cmd-check.yml")
  expect_snapshot(test)
})

test_that("all use_r_cmd_check() options work without additional args", {

  test_grid <- expand.grid(use_full_build_matrix_opt = c(TRUE, FALSE),
                depends_on_tmb_opt = c(TRUE, FALSE),
                depends_on_quarto_opt = c(TRUE, FALSE))
  for (i in 1:nrow(test_grid)) {
    name <- paste0("call-build-check-", i, ".yml")
    path <- file.path(".github", "workflows", name)
    use_r_cmd_check(workflow_name = name,
      use_full_build_matrix = test_grid[i, "use_full_build_matrix_opt"],
      depends_on_tmb = test_grid[i, "depends_on_tmb_opt"],
      depends_on_quarto = test_grid[i, "depends_on_quarto_opt"],
      additional_args = NULL)
      expect_true(file.exists(path))
    test <- readLines(path)
    expect_snapshot(test)
    }
# Note: this is the grid to compare to.
#  use_full_build_matrix_opt depends_on_tmb_opt depends_on_quarto_opt
# 1                       TRUE               TRUE                  TRUE
# 2                      FALSE               TRUE                  TRUE
# 3                       TRUE              FALSE                  TRUE
# 4                      FALSE              FALSE                  TRUE
# 5                       TRUE               TRUE                 FALSE
# 6                      FALSE               TRUE                 FALSE
# 7                       TRUE              FALSE                 FALSE
# 8                      FALSE              FALSE                 FALSE
})

test_that("all use_r_cmd_check() options work with additional args", {

  test_grid <- expand.grid(use_full_build_matrix_opt = c(TRUE, FALSE),
                depends_on_tmb_opt = c(TRUE, FALSE),
                depends_on_quarto_opt = c(TRUE, FALSE))
  for (i in 1:nrow(test_grid)) {
    name <- paste0("call-build-check-add-args", i, ".yml")
    path <- file.path(".github", "workflows", name)
    use_r_cmd_check(workflow_name = name,
      use_full_build_matrix = test_grid[i, "use_full_build_matrix_opt"],
      depends_on_tmb = test_grid[i, "depends_on_tmb_opt"],
      depends_on_quarto = test_grid[i, "depends_on_quarto_opt"],
      additional_args = list(
      "ubuntu" = c(
        "sudo apt-get update",
        "sudo apt-get install -y libcurl4-openssl-dev",
        "sudo add-apt-repository ppa:ubuntu-toolchain-r/test",
        "sudo apt-get install --only-upgrade libstdc++6"
      ),
      "windows" = c("tree"),
      "macos" = c("brew install curl")
    ))
    expect_true(file.exists(path))
    test <- readLines(path)
    expect_snapshot(test)
  }
# Note: this is the grid to compare to.
#  use_full_build_matrix_opt depends_on_tmb_opt depends_on_quarto_opt
# 1                       TRUE               TRUE                  TRUE
# 2                      FALSE               TRUE                  TRUE
# 3                       TRUE              FALSE                  TRUE
# 4                      FALSE              FALSE                  TRUE
# 5                       TRUE               TRUE                 FALSE
# 6                      FALSE               TRUE                 FALSE
# 7                       TRUE              FALSE                 FALSE
# 8                      FALSE              FALSE                 FALSE
})


test_that("use_r_cmd_check() works with full build option", {
  name <- "call-full-build-check.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(workflow_name = name, use_full_build_matrix = TRUE)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() works with full build option and tmb", {
  name <- "call-full-build-check.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(workflow_name = name, use_full_build_matrix = TRUE, depends_on_tmb = TRUE)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() works with tmb", {
  name <- "call-full-tmb.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(workflow_name = name, use_full_build_matrix = FALSE, depends_on_tmb = TRUE)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() works with depends on quarto", {
  name <- "call-full-quarto.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(workflow_name = name, use_full_build_matrix = FALSE, depends_on_quarto = TRUE)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() works with depends on quarto and tmb", {
  name <- "call-full-quarto-tmb.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(workflow_name = name, use_full_build_matrix = FALSE, 
  depends_on_tmb = TRUE, depends_on_quarto = TRUE)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})


test_that("use_r_cmd_check() works with additional_args", {
  name <- "call-rcmd-additional-args-tmb.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(
    workflow_name = name,
    use_full_build_matrix = FALSE,
    depends_on_tmb = TRUE,
    additional_args = list(
      "ubuntu" = c(
        "sudo apt-get update",
        "sudo apt-get install -y libcurl4-openssl-dev",
        "sudo add-apt-repository ppa:ubuntu-toolchain-r/test",
        "sudo apt-get install --only-upgrade libstdc++6"
      ),
      "windows" = c("tree"),
      "macos" = c("brew install curl")
    )
  )
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)

  name <- "call-rcmd-additional-args-full.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(
    workflow_name = name,
    use_full_build_matrix = TRUE,
    depends_on_tmb = FALSE,
    additional_args = list(
      "macos" = c("brew install curl")
    )
  )
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() works with additional_args, depends_on_tmb, and depends_on_quarto", {
  name <- "call-rcmd-add-args-quarto-tmb.yml"
  path <- file.path(".github", "workflows", name)
  use_r_cmd_check(
    workflow_name = name,
    use_full_build_matrix = FALSE,
    depends_on_tmb = TRUE,
    depends_on_quarto = TRUE,
    additional_args = list(
      "ubuntu" = c(
        "sudo apt-get update",
        "sudo apt-get install -y libcurl4-openssl-dev",
        "sudo add-apt-repository ppa:ubuntu-toolchain-r/test",
        "sudo apt-get install --only-upgrade libstdc++6"
      ),
      "windows" = c("tree"),
      "macos" = c("brew install curl")
    )
  )
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("use_r_cmd_check() doesn't work with invalid additional_args", {
  # Invalid inputs: not a list
  expect_error(
    use_r_cmd_check(additional_args = "brew install curl"),
    regexp = "must be a named list"
  )

  # Invalid inputs: list without names
  expect_error(
    use_r_cmd_check(additional_args = list("brew install curl")),
    regexp = "Invalid platform in"
  )

  # Invalid inputs: list with invalid names
  expect_error(
    use_r_cmd_check(additional_args = list(linux = "sudo apt-get update")),
    regexp = "Invalid platform in"
  )

  # Invalid inputs: list with non-character values
  expect_error(
    use_r_cmd_check(additional_args = list(windows = 123)),
    regexp = "must be character vectors"
  )
})

test_that("use_calc_coverage() works", {
  use_calc_coverage()
  expect_true(file.exists(".github/workflows/call-calc-coverage.yml"))
  test <- readLines(".github/workflows/call-calc-coverage.yml")
  expect_snapshot(test)
})

test_that("use_calc_coverage() works with use-public-rspm = FALSE", {
  workflow_name <- "call-calc-cov-false.yml"
  use_calc_coverage(workflow_name = workflow_name, use_public_rspm = FALSE)
  expect_true(file.exists(file.path(".github", "workflows", workflow_name)))
  test <- readLines(file.path(".github", "workflows", workflow_name))
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() works", {
  use_doc_and_style_r(
    use_rm_dollar_sign = TRUE, how_to_commit = "directly",
    build_trigger = "pull_request"
  )
  expect_true(file.exists(".github/workflows/call-doc-and-style-r.yml"))
  test <- readLines(".github/workflows/call-doc-and-style-r.yml")
  expect_length(grep("run-rm_dollar_sign: true", test, fixed = TRUE), 1)
  expect_length(grep("commit-directly: true", test, fixed = TRUE), 1)
  expect_length(grep("pull_request:", test, fixed = TRUE), 1)
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() works with other options", {
  use_doc_and_style_r(
    workflow_name = "doc_style_cron.yml",
    use_rm_dollar_sign = FALSE, how_to_commit = "pull_request",
    build_trigger = "weekly"
  )
  expect_true(file.exists(".github/workflows/doc_style_cron.yml"))
  test <- readLines(".github/workflows/doc_style_cron.yml")
  expect_length(grep("run-rm_dollar_sign: true", test, fixed = TRUE), 0)
  expect_length(grep("commit-directly: true", test, fixed = TRUE), 0)
  expect_length(grep("schedule:", test, fixed = TRUE), 1)
  expect_length(grep("cron:", test, fixed = TRUE), 1)
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() works with push to main", {
  use_doc_and_style_r(
    workflow_name = "doc_style_main.yml",
    use_rm_dollar_sign = FALSE, how_to_commit = "pull_request",
    build_trigger = "push_to_main"
  )
  expect_true(file.exists(".github/workflows/doc_style_main.yml"))
  test <- readLines(".github/workflows/doc_style_main.yml")
  expect_length(grep("run-rm_dollar_sign: true", test, fixed = TRUE), 0)
  expect_length(grep("commit-directly: true", test, fixed = TRUE), 0)
  expect_length(grep("branches:", test, fixed = TRUE), 1)
  expect_length(grep("push:", test, fixed = TRUE), 1)
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() works with manual trigger", {
  use_doc_and_style_r(
    workflow_name = "doc_style_manual.yml",
    use_rm_dollar_sign = FALSE, how_to_commit = "pull_request",
    build_trigger = "manual"
  )
  expect_true(file.exists(".github/workflows/doc_style_manual.yml"))
  test <- readLines(".github/workflows/doc_style_manual.yml")
  expect_length(grep("run-rm_dollar_sign: true", test, fixed = TRUE), 0)
  expect_length(grep("commit-directly: true", test, fixed = TRUE), 0)
  expect_true(length(grep("workflow_dispatch:", test, fixed = TRUE)) > 0)
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() works with pat option", {
  use_doc_and_style_r(
    workflow_name = "doc_style_pat.yml",
    use_rm_dollar_sign = FALSE, how_to_commit = "pull_request",
    use_pat = TRUE, pat_name = "MYPAT"
  )
  expect_true(file.exists(".github/workflows/doc_style_pat.yml"))
  test <- readLines(".github/workflows/doc_style_pat.yml")
  expect_length(grep("secrets.MYPAT", test, fixed = TRUE), 1)
  expect_length(grep("^    secrets:", test), 1)
  expect_snapshot(test)
})

test_that("use_doc_and_style_r() errors when a bad combo", {
  expect_error(use_doc_and_style_r(
    workflow_name = "doc_style_bad.yml",
    how_to_commit = "directly",
    use_pat = TRUE
  ), "recursive")
})

test_that("use_update_pkgdown()) works", {
  use_update_pkgdown()
  expect_true(file.exists(".github/workflows/call-update-pkgdown.yml"))
  test <- readLines(".github/workflows/call-update-pkgdown.yml")
  expect_snapshot(test)
})

test_that("use_update_pkgdown()) works with additional_args", {
  use_update_pkgdown(
    workflow_name = "call-update-pkgdown.yml",
    additional_args = list(
      "ubuntu" = c(
        "sudo apt-get update",
        "sudo apt-get install -y libcurl4-openssl-dev",
        "sudo add-apt-repository ppa:ubuntu-toolchain-r/test",
        "sudo apt-get install --only-upgrade libstdc++6"
      ),
      "windows" = c("tree"),
      "macos" = c("brew install curl")
    )
  )
  expect_true(file.exists(".github/workflows/call-update-pkgdown.yml"))
  test <- readLines(".github/workflows/call-update-pkgdown.yml")
  expect_snapshot(test)
})

test_that("use_build_pkgdown()) works with additional_args", {
  use_build_pkgdown(
    workflow_name = "call-build-pkgdown.yml",
    additional_args = list(
      "ubuntu" = c(
        "sudo apt-get update",
        "sudo apt-get install -y libcurl4-openssl-dev",
        "sudo add-apt-repository ppa:ubuntu-toolchain-r/test",
        "sudo apt-get install --only-upgrade libstdc++6"
      ),
      "windows" = c("tree"),
      "macos" = c("brew install curl")
    )
  )
  expect_true(file.exists(".github/workflows/call-build-pkgdown.yml"))
  test <- readLines(".github/workflows/call-build-pkgdown.yml")
  expect_snapshot(test)
})

test_that("use_spell_check() works", {
  use_spell_check()
  expect_true(file.exists(".github/workflows/call-spell-check.yml"))
  test <- readLines(".github/workflows/call-spell-check.yml")
  expect_snapshot(test)
})
