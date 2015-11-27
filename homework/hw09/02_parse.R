## Load packages
## Because we are in stat544, I'll assume you have this dplyr
suppressPackageStartupMessages(library(dplyr))

## I will also check if you have readr
if (require(readr)) {

  ## enter command line arguments
  args <- commandArgs(trailingOnly = TRUE)
  infile  <- ifelse(!is.na(args[1]), args[1], "skyscraper.csv")
  outfile <- ifelse(!is.na(args[2]), args[2], "skyscraper2.csv")

  ## read data
  skyscraper <- read_csv(infile)

  ## add average floor height
  dat <- skyscraper %>%
    mutate(avg_floor_height_m = height_m / floors)

  write_csv(dat, outfile)
} else {
  message("
#> PACKAGE NOT FOUND: PLEASE INSTALL 'readr' R PACKAGE
")
}
