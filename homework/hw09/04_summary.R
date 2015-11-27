## Get arguments from command line
## if NA, add default arguments
args <- commandArgs(trailingOnly = TRUE)
fig1 <- ifelse(!is.na(args[1]), args[1], "skyscraper.fig.byCity.png")
fig2 <- ifelse(!is.na(args[2]), args[2], "skyscraper.fig.perFloor.png")
outfile <- ifelse(!is.na(args[3]), args[3], "skyscraper.summary.md")


# Make file content -------------------------------------------------------
fileContent <- sprintf('---
output:
    html_document:
        keep_md: yes
---
# Looking at the 100 tallest completed buildings

## Cities with the tallest buildings
<img src="%s" width="540px">

In figure 1, we can see that Dubai is the city with the tallest building.

## Average floor height
<img src="%s" width="640px">

In figure 2, we can see that the tallest building does not have the tallest floor height.

## Reference
> Skyscrapercenter.com,. (2015). *100 Tallest Completed Buildings in the World - The Skyscraper Center.* Retrieved 25 November 2015, from http://www.skyscrapercenter.com/buildings
', fig1, fig2)

# Save content to file ----------------------------------------------------
writeLines(fileContent, outfile)
