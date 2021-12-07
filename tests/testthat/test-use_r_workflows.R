
temp_path <- file.path(tempdir(), "rcmdcheck")
dir.create(temp_path)
old_wd <- getwd()
setwd(temp_path)
on.exit(setwd(old_wd), add = TRUE)
on.exit(unlink(temp_path, recursive = TRUE), add = TRUE)

test_that("use_r_cmd_check() works", {
  pkg <- usethis::create_package(".")
  usethis::proj_set(".")
  use_r_cmd_check()
  expect_true(file.exists(".github/workflows/call-r-cmd-check.yml"))
  expect_true(file.exists(".github/.gitignore"))
})
