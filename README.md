# Oracle dsOMOP Extension

`dsOMOP.oracle` is an extension of the [`dsOMOP`](https://github.com/isglobal-brge/dsOMOP) package. It expands its functionality to support the interaction with Oracle databases. 

## Prerequisites

To use the `dsOMOP.oracle` package, you need to have the following packages installed on your system:
- [`dsOMOP`](https://github.com/isglobal-brge/dsOMOP)
- [`oracle.resourcer`](https://github.com/isglobal-brge/oracle.resourcer)

The installation of `dsOMOP.oracle` will fail if either of these two components is not installed correctly on the system.

**Important:** Please note that the `oracle.resourcer` package requires the Oracle Instant Client Basic and SDK components to be installed on your system. For more detailed installation instructions, please refer to the [oracle.resourcer installation guide](https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation).

## Example Dockerfile

For a comprehensive setup, you can use the provided Dockerfile to create an environment with all the necessary dependencies for using `dsOMOP.oracle`. The Dockerfile sets up a rock instance and includes all the required Oracle Instant Client components, as well as the following packages: `oracle.resourcer`, `dsOMOP`, and `dsOMOP.oracle`.

You can find the Dockerfile at the following link: [dsOMOP.oracle Dockerfile](inst/docker/Dockerfile)
