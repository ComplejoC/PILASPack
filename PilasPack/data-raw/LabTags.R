file.create("R/data.R")

LabTags <- read.csv(file = "data-raw/LabTags.csv")

usethis::use_data(LabTags)
