#' Check dsOMOP.oracle prerequisites
#'
#' This function checks if the required packages `dsOMOP` and `oracle.resourcer` are installed.
#' If any of the required packages are missing, it stops and returns an error message.
#' If both packages are installed, it returns a confirmation message.
#' 
#' Please note that this function is added to the package so that, when registered as a method, 
#' the Opal UI correctly displays the `dsOMOP.oracle` package in the list of installed packages, 
#' facilitating its management and discoverability by the data manager.
#'
#' @return A message indicating whether the required packages are installed.
#' 
#' @export
.check_dsOMOP_oracle_prereqs <- function() {
  required_packages <- c("dsOMOP", "oracle.resourcer")
  missing_packages <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]

  if (length(missing_packages) > 0) {
    error_message <- paste("The following required packages are missing:", paste(missing_packages, collapse = ", "))
    if ("oracle.resourcer" %in% missing_packages) {
      error_message <- paste(error_message, "If you have already tried to install the `oracle.resourcer` package, it is possible that there were errors with its dependencies. Please refer to https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation for installation instructions.")
    }
    stop(error_message, call. = FALSE)
  } else {
    return("All `dsOMOP.oracle` dependencies are properly installed!")
  }
}
