#' recoverDataFromDatePoints
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
#' This function assumes time progresses from left to right on the x axis.
#' This function assumes the value goes from the minimum on the bottom to the
#' maximum on the top.
#'
#' This function will still work if minimum or maximum values are adjusted to 
#' other values so long as the values given match the coorsponding point on the plot.  
#'
#' @param calibrationPoints a list of calibration points as
#' a list of x coordinates and another list with y coordinates.
#' The points are in the order of ymax, ymin, xmax, xmin
#' @param dataPoints a list of data points as
#' a list of x coordinates and another list with y coordinates.
#' @param beginDate The beginning of a time coordinate on the x axis
#' @param endDate The end of a time coordinate on the x axis
#' @param ymin The minimum on the y axis of an extraction plot
#' @param ymax The maximum on the y axis of an extraction plot
#' @param dateFormat The formatting for the date.  The default is "%m/%d/%Y".
#' @param xValueName The name assigned to the x value in the output dataset
#' @param yValueName The name assigned to the y value in the output dataset
#' The formatting information for the date is the same as the as.Date function.
#' @param roundValue The number of decimal points to round data.
#' @keywords time
#' @examples
#'
#' prepareExtractionPlot(
#'    "figure_1_Global_Temperature_Change_Hansen_Et_Al_2006.png"
#'    )
#'
#' calibrationPoints <- extractCalibrationPoints()
#' datapoints <- extractDataPoints(24)
#'
#'
#'
#' @export
#'

recoverDataFromDatePoints <- function (calibrationPoints,
                                       dataPoints,
                                       beginDate, endDate,
                                       ymin, ymax,
                                       dateFormat = "%m/%d/%Y",
                                       roundValue = 2,
                                       xValueName = "date",
                                       yValueName = "yValues"){
  xmin <- 0
  xmax <- as.numeric(as.Date(endDate, dateFormat) -
                       as.Date(beginDate, dateFormat))

  x  <- calibrationPoints$x[c(3,4)]
  y  <- calibrationPoints$y[c(2,1)]

  cx <- lm(formula = c(xmin, xmax) ~ c(x))$coeff
  cy <- lm(formula = c(ymin, ymax) ~ c(y))$coeff

  returnData <- dataPoints

  returnData$x <- as.Date(beginDate, dateFormat) +
    dataPoints$x * cx[2] + cx[1]

  returnData$y <- round(dataPoints$y*cy[2] + cy[1], roundValue)
  
  names(returnData) <- c(xValueName, yValueName)
  
  return(returnData)
}
