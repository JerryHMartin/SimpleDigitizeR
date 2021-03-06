% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recoverDataFromPoints.R
\name{recoverDataFromPoints}
\alias{recoverDataFromPoints}
\title{recoverDataFromPoints}
\usage{
recoverDataFromPoints(calibrationPoints, dataPoints, xmin, xmax, ymin, ymax,
  roundValue = 2, xValueName = "x", yValueName = "y")
}
\arguments{
\item{calibrationPoints}{a list of calibration points as
a list of x coordinates and another list with y coordinates.
The points are in the order of ymax, ymin, xmax, xmin}

\item{dataPoints}{a list of data points as
a list of x coordinates and another list with y coordinates.}

\item{xmin}{The minimum on the x axis of an extraction plot}

\item{xmax}{The maximum on the x axis of an extraction plot}

\item{ymin}{The minimum on the y axis of an extraction plot}

\item{ymax}{The maximum on the y axis of an extraction plot}

\item{roundValue}{The number of decimal points to round data.}

\item{xValueName}{The name of the x value in the returned dataset}

\item{yValueName}{The name of the y value in the returned dataset}
}
\description{
The function recovers data from a plot given the calibration points and
data points.
}
\details{
It is assumed the figure is rotated such that the x and y axis are in the
cardinal directions.  A distorted or rotated image should be processed with
image editing software before a recovery is attempted.

The extractCalibrationPoints() function can aquire the calibration points.
The extractDataPoints() function can aquire the data points.

This function is designed to work on a single dataset.  If multiple datasets are
in the software then this function should be called multiple times.

This function assumes min is on left and max is on right.
This function assumes the value goes from the minimum on the bottom to the
maximum on the top.
}
\examples{

prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
calibrationPoints <- extractCalibrationPoints()
datapoints <- extractDataPoints(24)

dataValues <- recoverDataFromDatePoints(calibrationPoints,
   datapoints, beginDate, endDate, ymin, ymax
)


}
\keyword{data}
\keyword{extraction}
