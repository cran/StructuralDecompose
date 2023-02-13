## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(StructuralDecompose)

## ----eval = FALSE-------------------------------------------------------------
#  data <- StructuralDecompose::Nile_dataset[,1]
#  
#  x <- StructuralDecompose(data)
#  x$trend

## ----eval = FALSE-------------------------------------------------------------
#  x <- StructuralDecompose(data)
#  x$seasonality

