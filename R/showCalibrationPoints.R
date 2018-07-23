#' showCalibrationPoints
#'
#' This is a wrapper function for displaying a set of calibration points on a plot.
#'
#' @param calibrationPoints a list with a list of x coordinates and another list
#' with y coordinates
#' @param pch same as pch base graphics
#' @param cex same as cex in base graphics
#' @param col same as col in base graphics
#' @param lwd same as lwd in base graphics
#' @keywords time
#' @examples
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' calpoints <- extractCalibrationPoints()
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' showCalibrationPoints(calpoints)
#'
#' @export
#'

showCalibrationPoints <- function (calibrationPoints,
                                   pch = 4,
                                   cex = 2,
                                   col = 'red',
                                   lwd = 3){

  points(calibrationPoints,
         pch = pch, cex = cex,
         col = col, lwd = lwd)

}
