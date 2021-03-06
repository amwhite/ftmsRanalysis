% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_kendrick.R
\name{calc_kendrick}
\alias{calc_kendrick}
\title{Calculate Kendrick Mass and Defect}
\usage{
calc_kendrick(ftmsObj)
}
\arguments{
\item{ftmsObj}{an object of class 'peakData' or 'compoundData', typically a result of \code{\link{as.peakData}} or \code{\link{mapPeaksToCompounds}}. e_meta must be present.}
}
\value{
an object of the same class as \code{ftmsObj} with columns in \code{e_meta} giving Kendrick mass and defects
}
\description{
Calculates the Kendrick mass and Kendrick defect needed for Kendrick plots
}
\author{
Lisa Bramer
}
