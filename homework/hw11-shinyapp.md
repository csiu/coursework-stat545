---
title: "Building Shiny app"
author: "csiu"
date: "December 11, 2015"
output: html_document
---

## Locations

Greetings! I have added my shiny app to [`csiu/shiny-server`](https://github.com/csiu/shiny-server/tree/master/bc_liquor_store). Specifically, the shiny R files are at:

- https://github.com/csiu/shiny-server/blob/master/bc_liquor_store/global.R
- https://github.com/csiu/shiny-server/blob/master/bc_liquor_store/server.R
- https://github.com/csiu/shiny-server/blob/master/bc_liquor_store/ui.R

The published Shiny app is located at:

- https://csiu.shinyapps.io/bc_liquor_store

The nice accompanying README is located at:

- https://github.com/csiu/shiny-server/blob/master/bc_liquor_store/README.md

## New features
Some of the new featues added include:

- Adding parameters to the plot
- Placing the plots to separate tabs
- Showing the number of results found whenever the filters change
- Turning the current results table into an interactive table
- Allowing the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc.
- Allowing the user to add numeric inputs

## Reflection

Initially, I didn't know what to do. I knew how the Shiny system works, but I had no idea of what to implement or what the final product will look like. It was only after playing around with the data (i.e. "[Which drink?](https://github.com/csiu/shiny-server/blob/master/bc_liquor_store/README.md)") did I have an idea. Overall, it was an interesting final assignment.
