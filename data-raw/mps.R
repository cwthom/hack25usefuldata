
# prepare MPs dataset

library(readr)
library(dplyr)
library(janitor)

mps_raw <- read_csv("data-raw/mps.csv")

mps <- mps_raw |> 
  clean_names(case = "snake") |> 
  select(
    country,
    pcon24_code = constituency_ons,
    pcon24_name = constituency,
    name,
    title = addressable_title,
    party,
    position,
    source_url = source_link
  )

usethis::use_data(mps, overwrite = TRUE)
