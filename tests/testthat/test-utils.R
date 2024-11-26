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

test_that("add_args() works with additional_args", {
  use_update_pkgdown()
  workflow_name <- "call-update-pkgdown.yml"
  additional_args <- list(
    ubuntu = c("sudo apt-get update",
                 "sudo apt-get install -y libcurl4-openssl-dev"),
    windows = c("tree"),
    macos = c("brew install curl")
  )
  
  add_args(workflow_name = workflow_name,
           additional_args = additional_args)
  path <- file.path(".github", "workflows", workflow_name)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})

test_that("add_args() works with txt and prev_line", {
  use_update_pkgdown()
  workflow_name <- "call-update-pkgdown.yml"
  path <- file.path(".github", "workflows", workflow_name)
  
  txt <- readLines(path)
  prev_line <- grep(
    paste0(
      "uses: nmfs-fish-tools/ghactions4r/.github/workflows/",
      gsub("call-", "", workflow_name),
      "@main"
    ),
    txt,
    fixed = TRUE
  )
  add_args(workflow_name = workflow_name,
           additional_args = list(ubuntu = "sudo apt-get install --only-upgrade libstdc++6"),
           txt = txt,
           prev_line = prev_line)
  expect_true(file.exists(path))
  test <- readLines(path)
  expect_snapshot(test)
})