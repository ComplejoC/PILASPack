pkgname <- "PilasPack"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "PilasPack-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('PilasPack')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("testApiCalculateTurnaround")
### * testApiCalculateTurnaround

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiCalculateTurnaround
### Title: Calculates Turnaround time (Tat) for when the sample was
###   reported, when the repost was uploaded and when the sample was
###   uploaded
### Aliases: testApiCalculateTurnaround

### ** Examples

testApiCalculateTurnaround(All_Test)
testApiCalculateTurnaround(sub_Test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiCalculateTurnaround", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiDateList")
### * testApiDateList

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiDateList
### Title: Generates List of Dates
### Aliases: testApiDateList

### ** Examples

testApiDateList()



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiDateList", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiDatePlot")
### * testApiDatePlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiDatePlot
### Title: Generates Plots that include dates in the x axis
### Aliases: testApiDatePlot

### ** Examples

testApiDatePlot(PCR_Test)
testApiDatePlot(PCR_Test, col = "Reported")




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiDatePlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiIsPositive")
### * testApiIsPositive

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiIsPositive
### Title: Extracts Positive test
### Aliases: testApiIsPositive

### ** Examples

testApiIsPositive(PCR_Test)
testApiIsPositive(ByLab_Test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiIsPositive", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiMonthAsColumn")
### * testApiMonthAsColumn

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiMonthAsColumn
### Title: Adds Columns Stating the months the test where Sampled, Reposted
###   and Uploaded to Bioportal
### Aliases: testApiMonthAsColumn

### ** Examples

testApiMonthAsColumn(PCR_Test)
testApiMonthAsColumn(ByLab_Test)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiMonthAsColumn", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiPositivity")
### * testApiPositivity

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiPositivity
### Title: Returns Positivity for test available in TestApi Table
### Aliases: testApiPositivity

### ** Examples

testApiPositivity(PCR_Test)
testApiPositivity(ByLab_Test)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiPositivity", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiPositivityPlot")
### * testApiPositivityPlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiPositivityPlot
### Title: Plots Positivity results
### Aliases: testApiPositivityPlot

### ** Examples

testApiPositivityPlot(PCR_Test)
testApiPositivityPlot(ByLab_Test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiPositivityPlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiSubset")
### * testApiSubset

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiSubset
### Title: Subsets DataFrame by any of the available parameters in TestApi
###   Table
### Aliases: testApiSubset

### ** Examples

testApiSubset(PCR_Test)
testApiSubset(ByLab_Test)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiSubset", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("testApiToDates")
### * testApiToDates

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: testApiToDates
### Title: Manipulates Dates in to Date Objects
### Aliases: testApiToDates

### ** Examples

testApiToDates(All_Test)
testApiToDates(sub_Test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("testApiToDates", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
