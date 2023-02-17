temp_path <- file.path(tempdir(), "rcmdcheck")
dir.create(temp_path)
old_wd <- getwd()
setwd(temp_path)
on.exit(setwd(old_wd), add = TRUE)
on.exit(unlink(temp_path, recursive = TRUE), add = TRUE)
on.exit(usethis::proj_set(), add = TRUE)
pkg <- usethis::create_package(".")
usethis::proj_set(".")

test_that("use_r_cmd_check() works", {
  use_r_cmd_check()
  expect_true(file.exists(".github/workflows/call-r-cmd-check.yml"))
  expect_true(file.exists(".github/.gitignore"))
})

test_that("use_calc_coverage()) works", {
  use_calc_coverage()
  expect_true(file.exists(".github/workflows/call-calc-coverage.yml"))
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
})

test_that("update_pkgdown()) works", {
  update_pkgdown()
  expect_true(file.exists(".github/workflows/call-update-pkgdown.yml"))
})

test_that("use_update_roxygen_docs() works", {
  use_update_roxygen_docs()
  expect_true(file.exists(".github/workflows/call-update-docs.yml"))
})

test_that("use_style_r_code() works", {
  use_style_r_code()
  expect_true(file.exists(".github/workflows/call-style.yml"))
})

test_that("use_build_deploy_bookdown() works", {
  use_build_deploy_bookdown()
  expect_true(file.exists(".github/workflows/call-build-deploy-bookdown.yml"))
  txt <- readLines(".github/workflows/call-build-deploy-bookdown.yml")
  expect_length(grep("bookdown_input:", txt), 1)
  expect_length(grep("bookdown_output_dir:", txt), 1)
  expect_length(grep("deployment_dir:", txt), 1)
})
