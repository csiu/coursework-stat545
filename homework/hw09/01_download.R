## Download the raw data,
## but first check if you have downloadr package
if (require(downloader)) {
  download(url = "https://cdn.jsdelivr.net/gh/csiu/skyscraper/inst/skyscraper.csv",
           destfile = "skyscraper.csv")
} else {
  message("
#> PACKAGE NOT FOUND: PLEASE INSTALL 'downloadr' R PACKAGE
")
}
