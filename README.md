# Shiny App of To Do List
### Introduction
This Repo contains a shiny app that accesses a shared Google Sheet to create a timeline plot of a To-Do List. 

### Links
The example App is deployed at my [shinyapps.io page](https://peter-t-ruehr.shinyapps.io/to-do-list/).
The underlying Google Sheet can be viewed (but not changed) [here](https://docs.google.com/spreadsheets/d/1HxKdDuA7pt1r-LGCbkwBYxr4jZ2Tvwq2GBRBf3skKho/).

### Example
Here is a screenshot of the App from Apr. 13th, 2023:

![App screenshot](https://live.staticflickr.com/65535/52815732388_493bda7420_o.png)

The light green trace is always at the system date, so it should usually show "today".

The projects and taks will be sorted by their end-date (aka deadline), with projects having the a task end next being on top, and the ones that still have more time available at the bottom of the plot. The tasks in the table below are sorted by their deadline, regardless of what project they belong to.

### Documentation
So far, I have not added any documentation, so basic knowledge on R and Shiny Apps is required. The App makes heavy use of the [vistime package](https://cran.r-project.org/web/packages/vistime/vignettes/vistime-vignette.html#usage-in-shiny-apps).

Have fun with it, and drop me a message _via_ the [issues page](https://github.com/Peter-T-Ruehr/To-Do-List-in-R-example/issues) in case you run into problems.
