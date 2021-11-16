## code to prepare `PackData` dataset goes here

usethis::use_data(BARRIOS_Y_MUNICIPIOS, overwrite = TRUE)

file.create("R/data.R")

BARRIOS_Y_MUNICIPIOS <- read.csv(file = "data-raw/BARRIOS_Y_MUNICIPIOS_CLEAN.csv")

usethis::use_data(BARRIOS_Y_MUNICIPIOS, overwrite = TRUE)
