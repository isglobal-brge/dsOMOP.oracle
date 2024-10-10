.onAttach <- function(libname, pkgname) {
  # Require oracle.resourcer
  if (!requireNamespace("oracle.resourcer", quietly = TRUE)) {
    stop("Package `oracle.resourcer` is required but not available. If you have already tried to install the `oracle.resourcer` package, it is possible that there were errors with its dependencies. Please refer to https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation for installation instructions.")
  }

  # Require dsOMOP
  if (!requireNamespace("dsOMOP", quietly = TRUE)) {
    stop("Package `dsOMOP` is required but not available. Please install the `dsOMOP` package before using this package.")
  }

  # Load it before injecting the schema query
  if (!"package:dsOMOP" %in% search()) {
    library("dsOMOP", character.only = TRUE)
  }

  # Register the schema query for Oracle
  dsOMOP::registerSchemaQuery("oracle", "ALTER SESSION SET CURRENT_SCHEMA = {schema}", override = TRUE)
  dsOMOP::registerSchemaRetrievalQuery("oracle", "SELECT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') FROM DUAL", override = TRUE)
}

dsOMOP::getSchemaQueries()
dsOMOP::getSchemaRetrievalQueries()
