#' extractDataPoints
#'
#' This function extracts calibration points.
#'
#' The text printed from this function can be copied directly as R code.
#' This way the image does not need to be recalibrated every time the code is run.
#'
#' @param type same as pch in bas graphics
#' @param pch same as pch base graphics
#' @param col same as col in base graphics
#' @param lwd same as lwd in base graphics
#' @param roundValue number of decimal points to round text output
#' @keywords time
#' @examples
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' dataPoints <- extractDataPoints(24)
#'
#' @export
#'

extractDataPoints <- function(numberOfPoints,
                              numberOfPointsInRow = 7,
                              type = 'p',
                              pch = 4,
                              col = 'blue',
                              lwd = 2,
                              roundValue = 5){

  message(paste0("Click points on graph."))

  datasetPoints <- locator(n = numberOfPoints, type = type,
                       pch = pch, col = col, lwd = lwd)

  # Prepare points for displaying as text
  xTextPoints <- format(round(datasetPoints$x[1], roundValue),
                                   nsmall = roundValue)
  yTextPoints <- format(round(datasetPoints$x[1], roundValue),
                                   nsmall = roundValue)
  for(iPoint in 2:numberOfPoints){
    
    if (iPoint %% numberOfPointsInRow == 1){

      xTextPoints <- paste0(xTextPoints, ",\n        ", 
                            format(round(datasetPoints$x[iPoint], roundValue),
                                   nsmall = roundValue))
      yTextPoints <- paste0(yTextPoints, ",\n        ",
                            format(round(datasetPoints$y[iPoint], roundValue),
                                  nsmall = roundValue))
      
    }else{
    
      xTextPoints <- paste0(xTextPoints, ", ",
                            format(round(datasetPoints$x[iPoint], roundValue),
                                  nsmall = roundValue))
      yTextPoints <- paste0(yTextPoints, ", ",
                            format(round(datasetPoints$y[iPoint], roundValue),
                                  nsmall = roundValue))
    }
  }

  datasetPointsText <-
    paste0("list(", "\n",
           "     x = c(", xTextPoints, ")," ,"\n",
           "     y = c(", yTextPoints, "))" ,"\n")

  cat(datasetPointsText)

  return(datasetPoints)

}
