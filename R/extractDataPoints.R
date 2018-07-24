#' extractDataPoints
#'
#' This function extracts calibration points.
#'
#' To use this function first prepare an extraction plot using the
#' prepareExtractionPlot function.
#' 
#' Count the number of points in the dataset to be extracted.
#' 
#' Run the function
#' 
#' Click on every point in the dataset
#'
#' The text printed from this function can be copied directly as R code.
#' This way the image does not need to be recalibrated every time the code 
#' is run.
#'
#' @param numberOfPoints the number of datapoints to extract
#' @param numberOfPointsInRow the number of points printed in the output 
#' of the row
#' @param type same as pch in bas graphics
#' @param pch same as pch base graphics
#' @param col same as col in base graphics
#' @param lwd same as lwd in base graphics
#' @param roundValue number of decimal points to round text output
#' @keywords datapoint extraction
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
  
  # Copy the first point to text
  xTextPoints <- format(round(datasetPoints$x[1], roundValue),
                        nsmall = roundValue)
  yTextPoints <- format(round(datasetPoints$y[1], roundValue),
                        nsmall = roundValue)
  
  # Copy subsequent points to text
  if (numberOfPoints > 1){
    for(iPoint in 2:numberOfPoints){
      
      if (iPoint %% numberOfPointsInRow == 1){
        
        xTextPoints <- paste0(xTextPoints, ",\n          ", 
                              format(round(datasetPoints$x[iPoint], roundValue),
                                     nsmall = roundValue))
        yTextPoints <- paste0(yTextPoints, ",\n          ",
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
  }
  
  datasetPointsText <-
    paste0("list(", "\n",
           "     x = c(", xTextPoints, ")," ,"\n",
           "     y = c(", yTextPoints, "))" ,"\n")
  
  cat(datasetPointsText)
  
  return(datasetPoints)
  
}
