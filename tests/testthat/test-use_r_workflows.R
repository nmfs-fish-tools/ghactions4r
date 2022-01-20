
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
  use_doc_and_style_r()
  expect_true(file.exists(".github/workflows/call-doc-and-style-r.yml"))
})

test_that("use_pkgdown()) works", {
  use_pkgdown()
  expect_true(file.exists(".github/workflows/call-update-pkgdown.yml"))
})

test_that("use_update_roxygen_docs() works", {
  use_update_roxgyen_docs()
  expect_true(file.exists(".github/workflows/call-update-docs.yml"))
})

test_that("use_style_r_code() works", {
  use_style_r_code()
  expect_true(file.exists(".github/workflows/call-style.yml"))
})
