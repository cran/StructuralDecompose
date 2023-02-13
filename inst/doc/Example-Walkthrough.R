## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries----------------------------------------------------------------
suppressMessages(suppressWarnings(library(changepoint)))
suppressMessages(suppressWarnings(library(strucchange)))

## ----Data Loading-------------------------------------------------------------
data <- StructuralDecompose::Nile_dataset[,1]

## ----Base data visualization--------------------------------------------------
matplot(data, type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile (10^8 m^3')

## ----stl decomposition--------------------------------------------------------
data <- StructuralDecompose::Nile_dataset[,1]

data <- ts(data = as.vector(t(data)), frequency = 12)

decomposed <- stl(data, s.window = 'periodic')

seasonal <- decomposed$time.series[,1]
trend <- decomposed$time.series[,2]
remainder <- decomposed$time.series[,3]

## ----stl plotting all---------------------------------------------------------
plot(cbind(seasonal, remainder, trend), type = 'l', main = 'Decomposed Series')

## ----Start of the function----------------------------------------------------
matplot(cbind(trend, data), type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile (10^8 m^3', main = 'Trend vs Base Data')

## ----Simple smoothening-------------------------------------------------------
Trend <- lowess(data)$y
matplot(cbind(Trend, data), type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile (10^8 m^3', main = 'Smoothened Trend vs Base Data')

## ----New smoothening with old data--------------------------------------------

Results <- StructuralDecompose::StructuralDecompose(Data = data)
  
matplot(cbind(Results$trend_line, data), type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile (10^8 m^3', main = 'New Trend vs Base Data')


## ----Seasonality--------------------------------------------------------------
matplot(cbind(as.numeric(Results$seasonality), c(data - Results$trend_line)), type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile 10^8 m^3',main = 'Seasonality vs Detrended Data')

## ----New smoothening with older data------------------------------------------
matplot(cbind(as.numeric(seasonal), c(data - trend)), type = 'l', xlab = 'Years', ylab = 'Annual Flow of the Nile 10^8 m^3',main = 'Seasonality vs Detrended Data')

