
# prepare LSOA2011 dataset

library(sf)
library(dplyr)
library(purrr)

lsoa2011_raw <- read_sf("data-raw/LSOA_2011")

lsoa2011 <- lsoa2011_raw |> 
  select(lsoa11_code = LSOA11CD,
         lsoa11_name = LSOA11NM,
         centre_lng = LONG,
         centre_lat = LAT) |> 
  st_transform(crs = st_crs(4326))

lsoa2011_centroids <- lsoa2011 |> 
  st_drop_geometry() |> 
  mutate(geometry = map2(centre_lng, centre_lat,
                         ~st_point(x = c(.x, .y)))) |> 
  select(lsoa11_code, geometry) |> 
  st_as_sf() |> 
  st_set_crs(4326)

usethis::use_data(lsoa2011, overwrite = TRUE)
usethis::use_data(lsoa2011_centroids, overwrite = TRUE)

