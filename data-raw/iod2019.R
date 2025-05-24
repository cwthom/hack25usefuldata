
# prepare IoD 2019 dataset

library(readxl)
library(readODS)
library(dplyr)
library(janitor)
library(stringr)

# England

iod2019_eng_raw <- read_excel("data-raw/IoD2019 - England.xlsx",
                              sheet = "IoD2019 Domains")

iod2019_eng <- iod2019_eng_raw |> 
  clean_names(case = "snake") |> 
  rename(
    lsoa11_code = lsoa_code_2011,
    lsoa11_name = lsoa_name_2011,
    lad19_code = local_authority_district_code_2019,
    lad19_name = local_authority_district_name_2019,
  ) |> 
  rename_with(
    ~str_remove(.x, "_where_.+$"),
    .cols = matches("rank|decile")
  ) |> 
  select(
    lsoa11_code, lsoa11_name,
    lad19_code,  lad19_name,
    ends_with("rank"),
    ends_with("decile")
  )

usethis::use_data(iod2019_eng, overwrite = TRUE)

# Wales

iod2019_wal_raw <- read_ods("data-raw/IoD2019 - Wales.ods",
                            sheet = "WIMD_2019_ranks",
                            skip = 2)

iod2019_wal <- iod2019_wal_raw |> 
  clean_names(case = "snake") |> 
  select(-local_authority_name_eng, -x13) |> 
  rename(
    lsoa11_code = lsoa_code,
    lsoa11_name = lsoa_name_eng
  ) |> 
  mutate(
    across(
      .cols = -c(lsoa11_code, lsoa11_name),
      .fns = ~ntile(.x, 10),
      .names = "{.col}_decile"
    )
  ) |> 
  rename_with(
    ~paste0(.x, "_rank"),
    .cols = -c(lsoa11_code, lsoa11_name, ends_with("decile"))
  )

usethis::use_data(iod2019_wal, overwrite = TRUE)

