
# prepare GIAS dataset

library(readr)
library(dplyr)
library(janitor)
library(sf)

gias_raw <- read_csv("data-raw/edubasealldata20250524.csv")

gias <- gias_raw |> 
  clean_names(case = "snake") |> 
  filter(establishment_status_name == "Open") |> 
  select(
    urn, 
    la_code,
    la_name,
    establishment_number,
    establishment_name,
    establishment_type = type_of_establishment_name,
    establishment_type_group = establishment_type_group_name,
    education_phase = phase_of_education_name,
    number_of_pupils,
    percentage_fsm,
    easting,
    northing,
    lsoa_code,
    pcon_code = parliamentary_constituency_code
  )

gias_latlong <- gias_raw |> 
  select(urn = URN, easting = Easting, northing = Northing) |> 
  mutate(point = map2(easting, northing, ~st_point(x = c(.x, .y)))) |> 
  st_as_sf() |> 
  st_set_crs(27700) |> 
  st_transform(crs = 4326) |> 
  mutate(coords = st_coordinates(point),
         longitude = coords[, "X"],
         latitude  = coords[, "Y"]) |> 
  select(urn, longitude, latitude) |> 
  st_drop_geometry()

gias <- gias |> inner_join(gias_latlong, by = c("urn"))
  
usethis::use_data(gias, overwrite = TRUE)
