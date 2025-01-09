#' Package Initialization and Setup
#' 
#' @description
#' This function is automatically called when the package is attached (loaded with library).
#' It performs several critical setup steps:
#' 1. Checks for required dependencies
#' 2. Loads necessary packages
#' 3. Configures Oracle schema settings
#'
#' @param libname The library name (automatically provided by R)
#' @param pkgname The package name (automatically provided by R)
#'
#' @details
#' The function performs the following steps:
#' 
#' 1. Dependency Checks:
#'    - Verifies that oracle.resourcer is installed
#'    - Verifies that dsOMOP is installed
#'    
#' 2. Package Loading:
#'    - Ensures dsOMOP is loaded into the search path
#'    
#' 3. Oracle Configuration:
#'    - Registers the Oracle schema change query
#'    - Registers the schema retrieval query
#'
#' @note
#' If dependencies are missing, the function will provide detailed error messages
#' with installation instructions.
#'
#' @keywords internal
#' @noRd
.onAttach <- function(libname, pkgname) {
  # Step 1: Check for required dependencies
  # Verify oracle.resourcer availability
  if (!requireNamespace("oracle.resourcer", quietly = TRUE)) {
    stop(
      "Package `oracle.resourcer` is required but not available. ",
      "If you have already tried to install the `oracle.resourcer` package, ",
      "it is possible that there were errors with its dependencies. ",
      "Please refer to https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation ",
      "for installation instructions."
    )
  }

  # Verify dsOMOP availability
  if (!requireNamespace("dsOMOP", quietly = TRUE)) {
    stop(
      "Package `dsOMOP` is required but not available. ",
      "Please install the `dsOMOP` package before using this package."
    )
  }

  # Step 2: Load required package
  # Ensure dsOMOP is loaded in the search path before schema configuration
  if (!"package:dsOMOP" %in% search()) {
    library("dsOMOP", character.only = TRUE)
  }

  # Step 3: Configure Oracle schema settings
  # Register the query to change schema in Oracle sessions
  dsOMOP::registerSchemaQuery(
    dbms = "oracle",
    query = "ALTER SESSION SET CURRENT_SCHEMA = {schema}",
    override = TRUE
  )
  
  # Register the query to retrieve current schema in Oracle sessions
  dsOMOP::registerSchemaRetrievalQuery(
    dbms = "oracle",
    query = "SELECT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') FROM DUAL",
    override = TRUE
  )
}

# Verify schema queries registration
dsOMOP::getSchemaQueries()
dsOMOP::getSchemaRetrievalQueries()
