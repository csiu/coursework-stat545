.PHONY: clean
.PRECIOUS: %.R %2.csv %.fig.byCity.png %.perFloor.png %.summary.md

all: skyscraper.summary.pdf

## REQUIREMENTS
# - wget
# - Rscript
# - pandoc   | if pandoc is not installed, enter: "make skyscraper.summary.md"

%.R:
	wget https://gist.githubusercontent.com/csiu/d7f30867d4907eff4086/raw/$@

skyscraper.csv: 01_download.R
	Rscript 01_download.R

%2.csv: %.csv 02_parse.R
	Rscript 02_parse.R $< $@

%.fig.byCity.png %.fig.perFloor.png: %2.csv 03_render.R
	Rscript 03_render.R $< $*.fig.byCity.png $*.fig.perFloor.png
	rm Rplots.pdf

%.summary.md: 04_summary.R %.fig.byCity.png %.fig.perFloor.png
	Rscript $^ $@

%.html: %.md
	pandoc -o $@ $<

%.pdf: %.html
	pandoc -o $@ $<

clean:
	rm -f skyscraper.csv skyscraper2.csv skyscraper.fig.byCity.png skyscraper.fig.perFloor.png skyscraper.summary.md skyscraper.summary.html skyscraper.summary.pdf 01_download.R 02_parse.R 03_render.R 04_summary.R
