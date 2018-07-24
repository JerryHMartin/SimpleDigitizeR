# SimpleDigitizeR
R package for digitizing images of graphs

## General Information

This package performs the digitization process in descrete segments. This has several advantages.

(1) Some functionality is encapsulated
(2) This is useful for converting a large amount of similar data

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

### Displaying plot Prior to Calibration and Data Extraction

prepareExtractionPlot(PlotImageFileName)
