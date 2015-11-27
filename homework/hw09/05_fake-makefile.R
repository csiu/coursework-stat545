# Download the right scripts if you don’t have them -----------------------
Rscripts <- c("01_download.R",
              "02_parse.R",
              "03_render.R",
              "04_summary.R")

## but first check if you have downloadr package
if (require(downloader)) {
  for (r in Rscripts) {
    if(!file.exists(r)){
      download(url = paste0("https://gist.githubusercontent.com/csiu/d7f30867d4907eff4086/raw/", r),
               destfile = r)
    }
  }

} else {
  message("
          #> PACKAGE NOT FOUND: PLEASE INSTALL 'downloadr' R PACKAGE
          ")
}

# Clean out previous work -------------------------------------------------
outputs <- c("skyscraper.csv",
             "skyscraper.fig.byCity.png",
             "skyscraper.fig.perFloor.png",
             "skyscraper.summary.md",
             "skyscraper2.csv")
suppressWarnings(file.remove(outputs))

# Run my scripts ----------------------------------------------------------
source("01_download.R")
source("02_parse.R")
source("03_render.R")
source("04_summary.R")
