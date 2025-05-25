
# Prepare School Capital Funding Allocation 2025-26 dataset

library(readxl)
library(dplyr)
library(janitor)

capital_funding_file <- "data-raw/School_capital_funding_allocations_for_2025_to_2026.xlsx"

# Schools sheet

capfunding2526_schools_raw <- read_excel(
  path = capital_funding_file,
  sheet = "2_Schools",
  skip = 7
)

capfunding2526_schools <- capfunding2526_schools_raw |> 
  clean_names(case = "snake") |> 
  select(
    urn,
    laestab = df_e_number,
    local_authority_name,
    school_name,
    dfc,
    weighted_pupils = weighted_pupils_displayed_to_1_decimal_place,
    va_status = va_status_note1,
    sca_condition_band = sca_condition_band_note_3,
    sca_location_factor,
    sca_pfi_status = sca_pfi_status_note_2,
    sca_funding_floor_applies = sca_funding_floor_applies_y_n,
    sca_responsible_body = sca_responsible_body_as_at_the_start_of_april_2025_note_1,
    responsible_body_type = rb_type
  )

usethis::use_data(capfunding2526_schools, overwrite = TRUE)

# Responsible Bodies

capfunding2526_rb_raw <- read_excel(
  path = capital_funding_file,
  sheet = "3_Responsible_Bodies", 
  skip = 18
)

capfunding2526_rb <- capfunding2526_rb_raw |> 
  clean_names(case = "snake") |> 
  select(
    rb_name = responsible_body_rb_name,
    rb_type,
    local_authority_name,
    dfc,
    total_dfc_and_sca
  )

usethis::use_data(capfunding2526_rb, overwrite = TRUE)


# Non-Maintained Special Schools

capfunding2526_nmss_raw <- read_excel(
  path = capital_funding_file,
  sheet = "4_NMSSs", 
  skip = 13
)

capfunding2526_nmss <- capfunding2526_nmss_raw |> 
  clean_names(case = "snake") |> 
  select(
    urn,
    laestab = df_e_number,
    local_authority_name,
    school_name,
    dfc,
    total_dfc_and_sca,
    weighted_pupils = weighted_pupils_note_2,
    sca_condition_band = sca_condition_band_note_3,
    sca_location_factor,
    sca_funding_floor_applies = sca_funding_floor_applies_y_n
  )

usethis::use_data(capfunding2526_nmss, overwrite = TRUE)

# SPIs

capfunding2526_spi_raw <- read_excel(
  path = capital_funding_file,
  sheet = "5_SPIs", 
  skip = 13
)

capfunding2526_spi <- capfunding2526_spi_raw |> 
  clean_names(case = "snake") |> 
  select(
    urn,
    laestab = df_e_number,
    local_authority_name,
    school_name,
    dfc,
    total_dfc_and_sca,
    weighted_pupils = weighted_pupils_note_2,
    sca_location_factor,
    sca_funding_floor_applies = sca_funding_floor_applies_y_n
  )

usethis::use_data(capfunding2526_spi, overwrite = TRUE)
