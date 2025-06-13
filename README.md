# dsOMOP Oracle Extension

`dsOMOP.oracle` is an extension of the [`dsOMOP`](https://github.com/isglobal-brge/dsOMOP) package. It expands its functionality to support the interaction with Oracle databases. 

## Prerequisites

To use the `dsOMOP.oracle` package, you need to have the following packages installed on your system:
- [`dsOMOP`](https://github.com/isglobal-brge/dsOMOP)
- [`oracle.resourcer`](https://github.com/isglobal-brge/oracle.resourcer)

The installation of `dsOMOP.oracle` will fail if either of these two components is not installed correctly on the system.

**Important:** Please note that the `oracle.resourcer` package requires the Oracle Instant Client Basic and SDK components to be installed on your system. For more detailed installation instructions, please refer to the [oracle.resourcer installation guide](https://github.com/isglobal-brge/oracle.resourcer/blob/main/README.md#installation).

## Installation verification

Please note that packages which do not expose assign and aggregate methods may be installed correctly on the system, but will not appear in the list of installed packages in the `Administration` > `DataSHIELD` > `(Profile)` > `Packages` section of the Opal UI. This is to avoid displaying other installed packages and dependencies, while focusing solely on DataSHIELD items.

In the case of `dsOMOP.oracle`, users can verify the installation in the `Administration` > `R` > `(Profile)` > `Packages` section of the Opal UI. This section lists all installed packages and can be filtered by name.

## Example Dockerfile

For a comprehensive setup, you can use the provided Dockerfile to create an environment with all the necessary dependencies for using `dsOMOP.oracle`. The Dockerfile sets up a rock instance and includes all the required Oracle Instant Client components, as well as the following packages: `oracle.resourcer`, `dsOMOP`, and `dsOMOP.oracle`.

You can find the Dockerfile at the following link: [dsOMOP.oracle Dockerfile](inst/docker/Dockerfile)

## Usage 

Having `dsOMOP.oracle` properly installed on an Opal server will extend the resource creation interface provided by the Opal server. Specifically, it will add a new category under the creation of OMOP CDM resources from `dsOMOP`, named `OMOP CDM Database (Oracle)`.

This new category allows users to easily configure and manage resources specifically designed for OMOP CDM databases using Oracle directly from the GUI.

To use it, simply access the management dashboard of a project and go to the `Resources` subsection. In the `Add Resource` option, you will find the `OMOP CDM` category, and under it, the `OMOP CDM Database (Oracle)` option:

<p align="center">
  <img src="man/figures/add_oracle_resource.png" alt="Add Oracle Resource">
</p>

The parameters for creating an `OMOP CDM Database (Oracle)` resource are the same as those described in the [OMOP CDM Resource Creation guide](https://github.com/isglobal-brge/dsOMOP/blob/main/README.md#creating-resources-from-gui), except for the `driver` parameter, which will always be Oracle.

## Acknowledgements

- The development of dsOMOP has been supported by the **[RadGen4COPD](https://github.com/isglobal-brge/RadGen4COPD)**, **[P4COPD](https://www.clinicbarcelona.org/en/projects-and-clinical-assays/detail/p4copd-prediction-prevention-personalized-and-precision-management-of-copd-in-young-adults)**, **[CADSET](https://www.ersnet.org/science-and-research/clinical-research-collaboration-application-programme/cadset-chronic-airway-diseases-early-stratification/)**, and **[DATOS-CAT](https://datos-cat.github.io/LandingPage)** projects. These collaborations have not only provided essential financial backing but have also affirmed the project's relevance and application in significant research endeavors.
- This project has received funding from the **[Spanish Ministry of Education, Innovation and Universities](https://www.ciencia.gob.es/en/)**, the **[National Agency for Research](https://www.aei.gob.es/en)**, and the **[Fund for Regional Development](https://ec.europa.eu/regional_policy/funding/erdf_en)** **(PID2021-122855OB-I00)**. We also acknowledge support from the grant **CEX2023-0001290-S** funded by **MCIN/AEI/10.13039/501100011033**, and support from the **[Generalitat de Catalunya](https://web.gencat.cat/en/inici/index.html)** through the **[CERCA Program](https://cerca.cat/en/)** and the **Consolidated Group on HEALTH ANALYTICS (2021 SGR 01563)**.
- Additionally, this project has received funding from the **[Instituto de Salud Carlos III (ISCIII)](https://www.isciii.es/)** through the project **"PMP21/00090,"** co-funded by the **[European Union's](https://european-union.europa.eu/index_en)** **Resilience and Recovery Facility**. It has also been partially funded by the **"Complementary Plan for Biotechnology Applied to Health,"** coordinated by the **[Institut de Bioenginyeria de Catalunya (IBEC)](https://ibecbarcelona.eu/)** within the framework of the **Recovery, Transformation, and Resilience Plan (C17.I1)** – Funded by the **[European Union](https://european-union.europa.eu/index_en)** – **[NextGenerationEU](https://next-generation-eu.europa.eu/index_en)**.

## Contact

For further information or inquiries, please contact:

- **Juan R González**: juanr.gonzalez@isglobal.org
- **David Sarrat González**: david.sarrat@isglobal.org

For more details about **DataSHIELD**, visit [https://www.datashield.org](https://www.datashield.org).

For more information about the **Barcelona Institute for Global Health (ISGlobal)**, visit [https://www.isglobal.org](https://www.isglobal.org).