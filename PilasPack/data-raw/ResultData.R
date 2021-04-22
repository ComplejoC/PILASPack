usethis::use_data(ResultData, overwrite = TRUE)

file.create("R/data.R")

ResultTags <- read.csv(file = "data-raw/ResultTags.csv")

usethis::use_data(ResultTags)
