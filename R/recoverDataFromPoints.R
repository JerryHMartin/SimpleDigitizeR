#' recoverDataFromPoints
#'
#' The function recovers data from a plot given the calibration points and
#' data points.
#'
#' It is assumed the figure is rotated such that the x and y axis are in the
#' cardinal directions.  A distorted or rotated image should be processed with
#' image editing software before a recovery is attempted.
#'
#' The extractCalibrationPoints() function can aquire the calibration points.
#' The extractDataPoints() function can aquire the data points.
#'
#' This function is designed to work on a single dataset.  If multiple datasets are
#' in the software then this function should be called multiple times.
#'
#' This function assumes min is on left and max is on right.
#' This function assumes the value goes from the minimum on the bottom to the
#' maximum on the top.
#'
#' This code is based on https://rdataviz.wordpress.com/tag/locator/
#'   (accessed July of 2018)
#'
#' @param calibrationPoints a list of calibration points as
#' a list of x coordinates and another list with y coordinates.
#' The points are in the order of ymax, ymin, xmax, xmin
#' @param dataPoints a list of data points as
#' a list of x coordinates and another list with y coordinates.
#' @param xmin The minimum on the x axis of an extraction plot
#' @param xmax The maximum on the x axis of an extraction plot
#' @param ymin The minimum on the y axis of an extraction plot
#' @param ymax The maximum on the y axis of an extraction plot
#' @param dateFormat The formatting for the date.  The default is "%m/%d/%Y".
#' @param xValueName The name of the x value in the returned dataset
#' @param yValueName The name of the y value in the returned dataset
#' The formatting information for the date is the same as the as.Date function.
#' @param roundValue The number of decimal points to round data.
#' @keywords time
#' @examples
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' calibrationPoints <- extractCalibrationPoints()
#' datapoints <- extractDataPoints(24)
#'
#' dataValues <- recoverDataFromDatePoints(calibrationPoints,
#'    datapoints, beginDate, endDate, ymin, ymax
#' )
#'
#'
#' @export
#'

recoverDataFromPoints <- function (calibrationPoints,
                                       dataPoints,
                                       xmin, xmax,
                                       ymin, ymax,
                                       dateFormat = "%m/%d/%Y",
                                       roundValue = 2,
                                       xValueName = "x",
                                       yValueName = "y"){

  x  <- calibrationPoints$x[c(3,4)]
  y  <- calibrationPoints$y[c(2,1)]

  cx <- lm(formula = c(xmin, xmax) ~ c(x))$coeff
  cy <- lm(formula = c(ymin, ymax) ~ c(y))$coeff

  returnData <- dataPoints

  returnData$x <- as.Date(beginDate, dateFormat) +
    dataPoints$x * cx[2] + cx[1]

  returnData$y <- round(dataPoints$y * cy[2] + cy[1], roundValue)

  names(returnData) <- c(xValueName, yValueName)
  
  return(returnData)
}
