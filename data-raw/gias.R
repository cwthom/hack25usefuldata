
# prepare GIAS dataset

library(readr)
library(dplyr)
library(janitor)

gias_raw <- read_csv("data-raw/edubaseallstatefunded20250524.csv")

gias <- gias_raw |> 
  clean_names(case = "snake") |> 
  select(
    urn, 
    la_code,
    la_name,
    establishment_number,
    establishment_name,
    establishment_type = type_of_establishment_name,
    education_phase = phase_of_education_name,
    town,
    postcode,
    school_website,
    telephone_num,
    head_title_name,
    head_last_name,
    pcon_code = parliamentary_constituency_code,
    pcon_name = parliamentary_constituency_name
  )

usethis::use_data(gias, overwrite = TRUE)
