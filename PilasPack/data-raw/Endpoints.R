## code to prepare `PackData` dataset goes here

usethis::use_data(Endpoints, overwrite = TRUE)

file.create("R/data.R")

Endpoints <- read.csv(file = "data-raw/Endpoints.csv")

usethis::use_data(Endpoints, overwrite = TRUE)


