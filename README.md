# SimpleDigitizeR
R package for digitizing images of graphs

## General Information

This package can be used to convert a digital image of a plot to data. 

This package can handle date data on the x axis.

## Using SimpleDigitizeR


### Installing SimpleDigitizeR

Instructions for installing devtools can be found at https://www.r-project.org/nosvn/pandoc/devtools.html.

```r
    library(devtools)
    install_github("agriculturist/SimpleDigitizeR")
```

### Loading Library

After the library is installed it is to be loaded.

```r
    library(SimpleDigitizeR)
```

### Displaying plot for calibration and data extraction

After loading the library set the working directory to the image.  The image is plotted in a manner to prepare for data extraction.

```r
setwd("c:\wherever the image is")
prepareExtractionPlot("PlotImageFileName.png")
```

### Calibrating the plot

When the image is plotted run the calibration procedure

```r
calpoints <- extractCalibrationPoints()
```

Click on the figure following the instructions.

There are two outputs to this step.  
(1) calpoints will have the x-y coordinates of the points needed for calibration.
(2) text will be output so the calibration points can be hard coded for later pre-loading.  (This prevents from needing to repeat the step if modifying errant points.)

Show calibration points is a method for testing if pre-loaded points are in the correct location.

```r
showCalibrationPoints(calpoints)
```

### Extracting the data points

Count the number of data points in the plot.  Use the extractDataPoints command to extract the points.

After running the command click on each of the points.

```r
datapoints <- extractDataPoints(10)
```

The output will be the x-y coordinates of the data in the plot.

#### Recovering the data

The recoverDataFromPoints and RecoverDataFromDatePoints are available for retrieving the data from the plot.






