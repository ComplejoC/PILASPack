## code to prepare `PackData` dataset goes here

usethis::use_data(PackData, overwrite = TRUE)

file.create("R/data.R")

LabTags <- read.csv(file = "data-raw/LabNames.csv")

usethis::use_data(LabTags, overwrite = TRUE)
