#' extractCalibrationPoints
#'
#' This function extracts calibration points.
#'
#' The text printed from this function can be copied into R code.
#' This way the image does not need to be recalibrated every time the code is run.
#'
#'
#' @param type same as pch in bas graphics
#' @param pch same as pch base graphics
#' @param col same as col in base graphics
#' @param lwd same as lwd in base graphics
#' @param roundValue number of decimal points to round text output
#' @keywords time
#' @examples
#'
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#' calpoints <- extractCalibrationPoints()
#'
#'
#' @export
#'


extractCalibrationPoints <- function( type = 'p',
                                      pch = 4,
                                      col = 'blue',
                                      lwd = 2,
                                      roundValue = 5){

  message(paste0("Click points on graph in this order \n",
                 "(1)Ymax  (2)Ymin  (3)Xmax  (4)Xmin"))

  calpoints <- locator(n = 4, type = type,
                       pch = pch, col = col, lwd = lwd)

  calpointsText <-
    paste0("list(x = c(",
           round(calpoints$x[1],  roundValue), ", ",
           round(calpoints$x[2],  roundValue), ", ",
           round(calpoints$x[3],  roundValue), ", ",
           round(calpoints$x[4],  roundValue), ")," ,"\n",
           "     y = c(",
           round(calpoints$y[1],  roundValue), ", ",
           round(calpoints$y[2],  roundValue), ", ",
           round(calpoints$y[3],  roundValue), ", ",
           round(calpoints$y[4],  roundValue), "))"
           )

  cat(calpointsText)

  return(calpoints)


}
