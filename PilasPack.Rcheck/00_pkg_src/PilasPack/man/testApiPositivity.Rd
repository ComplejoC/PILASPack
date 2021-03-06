% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/testApiPositivity.R
\name{testApiPositivity}
\alias{testApiPositivity}
\title{Returns Positivity for test available in TestApi Table}
\usage{
testApiPositivity(
  DataFrame = All_Tests,
  cutoff_min = FALSE,
  cutoff_max = FALSE,
  cutoff_lower = "no",
  cutoff_upper = "no"
)
}
\arguments{
\item{DataFrame}{A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.}

\item{cutoff_min}{FALSE}

\item{cutoff_max}{FALSE}

\item{cutoff_lower}{"no"}

\item{cutoff_upper}{"no"}
}
\value{
NewFrame with the positivity calculated by unit of time
}
\description{
Returns Positivity for test available in TestApi Table
}
\examples{
testApiPositivity(PCR_Test)
testApiPositivity(ByLab_Test)

}
