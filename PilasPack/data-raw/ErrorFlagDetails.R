## code to prepare `PackData` dataset goes here

usethis::use_data(ErrorFlagDetails, overwrite = TRUE)

file.create("R/data.R")

ErrorFlagDetails <- read.csv(file = "data-raw/ErrorFlagDetails.csv")

usethis::use_data(ErrorFlagDetails, overwrite = TRUE)
