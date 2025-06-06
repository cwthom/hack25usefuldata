
#' Lower-Layer Super Output Areas & Centroids, 2011
#' 
#' Boundaries and centroids for LSOAs from the 2011 census. 2011 is used, not
#' 2021, since the deprivation dataset in this repo uses the 2011 boundaries.
#' Boundaries are super-generalised and clipped.
#' 
#' @source <https://geoportal.statistics.gov.uk/search?q=BDY_LSOA%20DEC_2011>
#' 
#' @format Both are spatial datasets requiring the `sf` package to be loaded to 
#'     print nicely in the console.
#' 
"lsoa2011"

#' @rdname lsoa2011
#' @format NULL
"lsoa2011_centroids"

