## Get arguments from command line
## if NA, add default arguments
args <- commandArgs(trailingOnly = TRUE)
fig1 <- args[1]
fig2 <- args[2]
outfile <- args[3]


# Make file content -------------------------------------------------------
fileContent <- sprintf('
---
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
