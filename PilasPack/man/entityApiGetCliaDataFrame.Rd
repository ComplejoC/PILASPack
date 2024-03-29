% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/entityApiGetCliaDataFrame.R
\name{entityApiGetCliaDataFrame}
\alias{entityApiGetCliaDataFrame}
\title{extracts the clia}
\usage{
entityApiGetCliaDataFrame(entityDataFrame)
}
\arguments{
\item{entityDataFrame}{data frame of entities obtained from the entity API}
}
\value{
data frame of laboratories with entityId, name and clia
}
\description{
extracts the clia
}
\examples{
labsWithClia=entityApiGetCliaDataFrame(entityDataFrame)

}
