#' showDataPoints
#'
#' This is a wrapper function for displaying a set of
#' data points on a plot.
#'
#' @param dataPoints a list with a list of x coordinates and another list
#' with y coordinates
#' @param dataSetNumber if more than one dataset is included this changes the
#' color of the dataset
#' @param numofDatasets number of datasets to be plotted (only needs to be changed
#' if more than 10 datasets are being plotted)
#' @param pch same as pch base graphics
#' @param col same as col in base graphics
#' @param lwd same as lwd in base graphics
#' @keywords time
#' @examples
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' datapoints <- extractDataPoints()
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' showDataPoints(datapoints)
#'
#' @export
#'

showDataPoints <- function (dataPoints,
                            dataSetNumber = 1,
                            numofDatasets = 10,
                            pch = 4,
                            cex = 2,
                            colorPalette = NULL,
                            lwd = 3){

  if (is.null(colorPalette)){
    colorPalette <- palette(rainbow(10))
  }

  points(dataPoints,
         pch = pch,
         cex = cex,
         col = colorPalette[dataSetNumber],
         lwd = lwd)

}
