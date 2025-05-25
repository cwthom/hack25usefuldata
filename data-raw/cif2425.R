
# Prepare Condition Improvement Fund (CIF) Outcomes 2024-25 dataset

library(readODS)
library(dplyr)
library(janitor)

cif2425_file <- "data-raw/Condition_Improvement_Fund_2024_to_2025_outcomes__1_.ods"

cif2425_approved_raw <- read_ods(path = cif2425_file, sheet = "Approved")
cif2425_pending_raw  <- read_ods(path = cif2425_file, sheet = "Pending_Approval") 

cif2425 <- bind_rows(
  cif2425_approved_raw |> mutate(project_status = "Approved"),
  cif2425_pending_raw  |> mutate(project_status = "Pending Approval")
) |> 
  clean_names(case = "snake") |> 
  rename(local_authority_name = la)

usethis::use_data(cif2425, overwrite = TRUE)
