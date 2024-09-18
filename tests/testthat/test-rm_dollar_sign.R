on.exit(ifelse(
  file.exists("test_rm_dollar_sign.txt"),
  file.remove("test_rm_dollar_sign.txt"),
  ""
), add = TRUE)
on.exit(ifelse(
  file.exists("out_rm_dollar_sign.txt"),
  file.remove("out_rm_dollar_sign.txt"),
  ""
), add = TRUE)
test_that("rm dollar sign works", {
  test_text <- c(
    "x$my_name <- y$test",
    "x[['my_name']]",
    "no_replace_here <- 44",
    "x$names<-new_assign;x$`22`",
    "x$names <- new_assign; x$`22`",
    "x$`$$weirdcharacters`<-222",
    "x$`nameinbacktick`",
    "x$mylist$my_col$YetAnotherCol",
    "x$mylist$my_col$`1_somename`",
    "x()$my_name <- y$test"
  )
  expect_output <- c(
    "x[[\"my_name\"]] <- y[[\"test\"]]",
    "x[['my_name']]",
    "no_replace_here <- 44",
    "x[[\"names\"]]<-new_assign;x[[\"22\"]]",
    "x[[\"names\"]] <- new_assign; x[[\"22\"]]",
    "x[[\"$$weirdcharacters\"]]<-222",
    "x[[\"nameinbacktick\"]]",
    "x[[\"mylist\"]][[\"my_col\"]][[\"YetAnotherCol\"]]",
    "x[[\"mylist\"]][[\"my_col\"]][[\"1_somename\"]]",
    "x()[[\"my_name\"]] <- y[[\"test\"]]"
  )
  writeLines(test_text, "test_rm_dollar_sign.txt")
  new_text <- rm_dollar_sign(
    file = "test_rm_dollar_sign.txt",
    out_file = NULL
  )
  expect_equal(new_text, expect_output)
  file.remove("test_rm_dollar_sign.txt")
})

test_that("rm dollar sign exits on error when it should", {
  test_text <- c(
    "x$mylist$my_col$`1_somename`",
    "x$`bad$name` <- 55",
    "x$`other_$badname`"
  )
  writeLines(test_text, "test_rm_dollar_sign.txt")
  expect_error(rm_dollar_sign(
    file = "test_rm_dollar_sign.txt",
    out_file = NULL
  ))
  file.remove("test_rm_dollar_sign.txt")
})

test_that("rm dollar sign writes to file", {
  test_text <- c(
    "x$my_name <- y$test",
    "x[['my_name']]",
    "no_replace_here <- 44",
    "x$names<-new_assign;x$`22`",
    "x$names <- new_assign; x$`22`",
    "x$`$$weirdcharacters`<-222",
    "x$`nameinbacktick`",
    "x$mylist$my_col$YetAnotherCol",
    "x$mylist$my_col$`1_somename`",
    "x()$my_name <- y$test"
  )
  writeLines(test_text, "test_rm_dollar_sign.txt")
  new_text <- rm_dollar_sign(
    file = "test_rm_dollar_sign.txt",
    out_file = "out_rm_dollar_sign.txt"
  )
  expect_true(file.exists("out_rm_dollar_sign.txt"))
  file.remove("test_rm_dollar_sign.txt")
  file.remove("out_rm_dollar_sign.txt")
})
