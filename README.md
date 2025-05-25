
# hack25usefuldata

The goal of hack25usefuldata is to provide easy access to some useful open-source datasets, to speed up development during the hackathon in May 2025.

## Installation

You can install the development version of `hack25usefuldata` from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("cwthom/hack25usefuldata")
```

## Datasets

The datasets included are:

|Title|Description|Source|Dataset Name|
|:----|:----------|:-----|:-----------|
|Get Information About Schools|A download of all educational establishments in England and Wales|[GIAS](https://get-information-schools.service.gov.uk/Downloads)|`gias`|
|School Capital Funding Allocation 2025-26|Published data on the 2025-26 capital funding allocation for schools, including high-level condition information|[GOV.UK - School Capital Funding](https://www.gov.uk/guidance/school-capital-funding)|`capfunding2526_schools`, `capfunding2526_rb`, `capfunding2526_nmss`, `capfunding2526_spi`|
|Condition Improvement Fund Outcomes, 2024-25|Published dataset of projects funded by the Condition Improvement Fund in 2024-25. 2025-26 not yet available.|[GOV.UK - CIF](https://www.gov.uk/government/publications/condition-improvement-fund-2024-to-2025-outcome)|`cif2425`|
|Census 2021 Population|A download at LSOA level of usual residents by age group|[ONS Build a Dataset](https://www.ons.gov.uk/datasets/create)|`census21_pop`|
|English Indices of Deprivation 2019|Official Stats - measures of deprivation at Lower-Layer Super Output Area (LSOA) level across different domains (Income, Health, Education etc)|[GOV.UK - Deprivation](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019)|`iod2019_eng`|
|Welsh Indices of Deprivation 2019|Official Stats - measures of deprivation at LSOA level in Wales - slightly different measures to England, so not directly comparable|[GOV.WALES](https://www.gov.wales/welsh-index-multiple-deprivation-full-index-update-ranks-2019)|`iod2019_wal`|
|Members of Parliament|A download of all 650 UK members of parliament, their constituency and party|[parliament.uk - members](https://members.parliament.uk/members/commons)|`mps`|
|LSOAs 2011|Boundaries and centroids for LSOAs from the 2011 Census|[ONS Geoportal](https://geoportal.statistics.gov.uk/)|`lsoa2011`, `lsoa2011_centroids`|
|Constituencies 2024|Boundaries and centroids for parliamentary constituencies from the 2024 general election|[ONS Geoportal](https://geoportal.statistics.gov.uk/)|`pcon2024`, `pcon2024_centroids`|