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
