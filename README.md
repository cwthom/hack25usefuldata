
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

|Dataset|Description|Source|Dataset Name (R)|
|:------|:----------|:-----|:---------------|
|Get Information About Schools|A download of all educational establishments in England and Wales|https://get-information-schools.service.gov.uk/Downloads|`gias`|
|Census 2021 Population|A download at LSOA level of usual residents by age group|https://www.ons.gov.uk/datasets/create|`census21_pop`|
|English Indices of Deprivation 2019|Official Stats - measures of deprivation at Lower-Layer Super Output Area (LSOA) level across different domains (Income, Health, Education etc)|https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019|`iod2019_eng`|
|Welsh Indices of Deprivation 2019|Official Stats - measures of deprivation at LSOA level in Wales - slightly different measures to England, so not directly comparable|https://www.gov.wales/welsh-index-multiple-deprivation-full-index-update-ranks-2019|`iod2019_wal`|
|Members of Parliament|A download of all 650 UK members of parliament, their constituency and party|https://members.parliament.uk/members/commons|`mps`|
|LSOAs 2011|Boundaries and centroids for LSOAs from the 2011 Census|https://geoportal.statistics.gov.uk/|`lsoa2011`, `lsoa2011_centroids`|
|Constituencies 2024|Boundaries and centroids for parliamentary constituencies from the 2024 general election|https://geoportal.statistics.gov.uk/|`pcon2024`, `pcon2024_centroids`|