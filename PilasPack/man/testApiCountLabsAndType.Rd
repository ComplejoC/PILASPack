% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/testApiCountLabsAndType.R
\name{testApiCountLabsAndType}
\alias{testApiCountLabsAndType}
\title{Generates Plots that include dates in the x axis}
\usage{
testApiCountLabsAndType(data_frame = All_Tests)
}
\arguments{
\item{data_frame}{A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn}
}
\value{
Plot of data changing over time
}
\description{
Generates Plots that include dates in the x axis
}
\examples{
testApiCountLabsAndType(All_Tests)
testApiSubset(lab_tag="quest", test_type="pcr") \%>\% testApiCountLabsAndType()


}
