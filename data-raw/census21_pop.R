
# Prepare the Census Population estimates data

library(readr)
library(dplyr)
library(janitor)

census21_pop_raw <- read_csv("data-raw/census2021_pop.csv")

census21_pop <- census21_pop_raw |> 
  clean_names(case = "snake") |> 
  select(lsoa21_code = lower_layer_super_output_areas_code,
         lsoa21_name = lower_layer_super_output_areas,
         age_group = age_6_categories,
         usual_residents = observation)

usethis::use_data(census21_pop, overwrite = TRUE)
