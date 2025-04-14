#' @param use_public_rspm Use posit package manager instead of CRAN to install dependencies? The
#'  advantage here is that dependencies are precompiled, so install should be much quicker. In
#'  rare situations (like packages with TMB dependencies), using use_public_rspm = FALSE may be
#'  a better option. Note a setting only needs to be specified in the yml if use_public_rspm is FALSE, so
#'  there will be no setting added if use_public_rspm is TRUE.
