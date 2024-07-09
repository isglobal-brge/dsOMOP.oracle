.onAttach <- function(libname, pkgname) {
  if (!requireNamespace("oracle.resourcer", quietly = TRUE)) {
    stop("Package `oracle.resourcer` is required but not available. If you have already tried to install the `oracle.resourcer` package, it is possible that there were errors with its dependencies. Please refer to https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation for installation instructions.")
  }
}
