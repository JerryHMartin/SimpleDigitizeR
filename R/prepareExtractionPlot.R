#' prepareExtractionPlot.R
#'
#' This function plots an image to a graph.  This is necissary to extract the data.
#'
#' @param file png file of data to be extracted
#' @param workingDirectory the directory the file is located. If this value is
#' null the function assumes it is in the working directory
#' @param main main label for the plots
#' @param xlab label for the x axis
#' @param ylab label for the y axis
#' @keywords point extraction plot
#' @examples
#'
#'
#' prepareExtractionPlot("figure_7_Rogers_Commission_1986.png")
#'
#' @export

prepareExtractionPlot <- function(file,
                                  workingDirectory = NULL,
                                  main = "Data Extraction Plot",
                                  xlab = "x",
                                  ylab = "y"){

  library(png)

  if (!is.null(workingDirectory)){
    setwd(workingDirectory)
  }

  extractionImage <- readPNG(file)

  plot(1:2, type = 'n', main = main, xlab = xlab, ylab = ylab)
  extremeDimensions <- par()$usr
  rasterImage(extractionImage,
              extremeDimensions[1], extremeDimensions[3],
              extremeDimensions[2], extremeDimensions[4])

}
