# functions to check inputs

#' Check the workflow name is formatted correctly
#'
#' Basically check that it is a filename that ends in .yml
#' @template workflow_name
check_workflow_name <- function(workflow_name) {
  stopifnot(is.character(workflow_name))
  stopifnot(length(workflow_name) == 1)
  get_ext <- grep("\\.yml$", workflow_name)
  stopifnot(isTRUE(length(get_ext) == 1))
  return(invisible(workflow_name))
}

#' Validate additional arguments for R functions
#'
#' @inheritParams use_r_cmd_check
validate_additional_args <- function(additional_args) {
  if (!is.null(additional_args)) {
    if (!is.list(additional_args)) {
      cli::cli_abort("{.var additional_args} must be a named list.")
    }
    invalid_platforms <- setdiff(names(additional_args), c("windows", "macos", "ubuntu"))
    if (length(invalid_platforms) > 0 | is.null(invalid_platforms)) {
      cli::cli_abort("Invalid platform in {.var additional_args}: {.val {invalid_platforms}}.
                      Allowed platforms are {.val windows}, {.val macos}, and {.val ubuntu}.")
    }
    if (!all(vapply(additional_args, is.character, logical(1)))) {
      cli::cli_abort("All values in {.var additional_args} must be character vectors.")
    }
  }
}
