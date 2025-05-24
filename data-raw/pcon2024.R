
# prepare PCON2024 dataset

library(sf)
library(dplyr)
library(purrr)

pcon2024_raw <- read_sf("data-raw/PCON_JULY_2024")

pcon2024 <- pcon2024_raw |> 
  select(pcon24_code = PCON24CD,
         pcon24_name = PCON24NM,
         centre_lng = LONG,
         centre_lat = LAT) |> 
  st_transform(crs = st_crs(4326))

pcon2024_centroids <- pcon2024 |> 
  st_drop_geometry() |> 
  mutate(geometry = map2(centre_lng, centre_lat,
                         ~st_point(x = c(.x, .y)))) |> 
  select(pcon24_code, geometry) |> 
  st_as_sf() |> 
  st_set_crs(4326)

usethis::use_data(pcon2024, overwrite = TRUE)
usethis::use_data(pcon2024_centroids, overwrite = TRUE)
