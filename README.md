# DataStorageSystems
OSS Split

mr. sc. Tatjana Listeš, viši predavač

Godina 2024./2025.

## Table of Contents📜
* [Topics Covered](#topics-covered)
* [Seminar Tasks](#seminar-tasks)


## Topics Covered
- The need for building a data warehouse.
- Goals of building a data warehouse.
- Basic properties of a data warehouse.
- Historical overview.
- Data warehouse architectures.
- Data granularity in the data warehouse.
- Data marts.
- Basic procedures in data warehousing.
- Using the data warehouse.
- Dimensional modeling.
- Facts, measures, and dimensions.
- Dimensional modeling techniques.
- Basic techniques for designing fact tables.
- Fact table models.
- ETL strategy.
- Steps in the ETL process.
- Phases in refreshing the data warehouse.
- Data transformation and cleaning.
- Detecting data changes in source systems.
- Data warehouse infrastructure.

## Seminar Tasks
1. Create a database with approximately 10 tables.
2. Populate the database with data.
3. Create a data warehouse with one fact table and at least 4 dimensions.
4. One of the dimensions should be `dimDate` or `dimDateTime`.
5. Dimension tables should have surrogate keys.
6. Programmatically populate the time dimension.
7. Implement change tracking for one of the dimensions using Slowly Changing Dimension (SCD), supporting both SCD Type 1 and SCD Type 2.
8. Create an SSIS package for loading one of the dimensions with data from two or three tables using Merge Join. The package should support incremental load.
9. Create a package that loads the fact table and uses lookups to find surrogate keys.
10. Create two queries to display aggregated data from the data warehouse.
