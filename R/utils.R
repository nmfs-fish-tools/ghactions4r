#' Add platform-specific additional arguments to a GitHub workflow YAML file
#'
#' @inheritParams use_r_cmd_check
#' @param txt A character vector of YAML file lines. If NULL, the function reads the YAML file
#'   automatically. Default is NULL.
#' @param prev_line An integer specifying the line number in txt where the arguments
#'   should be added. If NULL, the function determines this value automatically. Default is NULL.
add_args <- function(workflow_name, additional_args, txt = NULL, prev_line = NULL) {
  path_to_yml <- file.path(".github", "workflows", workflow_name)
  if (is.null(txt) | is.null(prev_line)) {
    txt <- readLines(path_to_yml)

    prev_line <- grep(
      "uses: nmfs-fish-tools/ghactions4r/.github/workflows/",
      txt,
      fixed = TRUE
    )
    if (grepl("with:", txt[prev_line+1], fixed = TRUE)) {
      prev_line <- prev_line + 1
    } else {
      txt <- append(txt, "    with:", prev_line)
      prev_line <- prev_line + 1
    }
  }

  # Add platform-specific additional arguments
  for (platform in c("windows", "macos", "ubuntu")) {
    if (!is.null(additional_args[[platform]])) {
      txt <- append(txt, paste0("        ", additional_args[[platform]]), prev_line)
      txt <- append(txt, paste0("      additional_args_", platform, ": |"), prev_line)
    }
  }
  writeLines(txt, path_to_yml)
}
