% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lagApiToDates.R
\name{lagApiToDates}
\alias{lagApiToDates}
\title{Manipulates Dates in to Date Objects}
\usage{
lagApiToDates(DataFrame)
}
\arguments{
\item{DataFrame}{A Data Frame object from lag API}
}
\value{
The same Data Frame with date columns transformed into R Date objects (%Y-%m-%d)
}
\description{
Manipulates Dates in to Date Objects
}
\examples{
All_Tests=lagApiToDates(All_Test)
}
