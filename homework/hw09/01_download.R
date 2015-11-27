## Download the raw data,
## but first check if you have downloadr package
if (require(downloader)) {
  download(url = "https://rawgit.com/csiu/skyscraper/master/inst/skyscraper.csv",
           destfile = "skyscraper.csv")
} else {
  message("
#> PACKAGE NOT FOUND: PLEASE INSTALL 'downloadr' R PACKAGE
")
}
