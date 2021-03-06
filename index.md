---
title       : Data Product using Iris Dataset
subtitle    : Coursera Project
author      : Nazima
job         : DataAnalyst
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny,interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Iris Flower Dataset

The Iris flower data set or Fisher's Iris data set is a multivariate data set introduced by Ronald Fisher in his 1936 paper The use of multiple measurements in taxonomic problems as an example of linear discriminant analysis.
- 1. It is sometimes called Anderson's Iris data set because Edgar Anderson collected the data to quantify the morphologic variation of Iris flowers of three related species.
- 2.Two of the three species were collected in the Gaspe Peninsula "all from the same pasture, and picked on the same day and measured at the same time by the same person with the same apparatus"

--- .class #id 


## Dataset Summary

The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and Iris versicolor). Four features were measured from each sample: the length and the width of the sepals and petals, in centimetres. Based on the combination of these four features, Fisher developed a linear discriminant model to distinguish the species from each other.

 Attribute Information:

1. sepal length in cm 
2. sepal width in cm 
3. petal length in cm 
4. petal width in cm 
5. class: 
-- Iris Setosa 
-- Iris Versicolour 
-- Iris Virginica

---

## Data Product Summary

Shiny app called irisfloweranalysis is helpful for the Analyst to study the data using different widgets.The data can be analysized in steps using the following widgets...

-  SelectInput : 
   It gives user the choice to pick one of the quantitive variable from the data sets.    The user can select from Sepal Length","Sepal Width","Petal length","Petal Width".
-  SliderInput : 
   In the second choice it asks the user to selct the required amount of bins required    for plotting the histogram for better analysis.
-  radioButtons : 
   It allows the user to change the colot of the Histogram.
-  DownloadButton :  
   User can dowload the generated plot in his device 
-  radioButtons : 
   It gives a choice to user to save the genrated plot either in png or pdf format.

--- 

```r
slidifyUI(
  sidebarPanel(
      
      selectInput("var","1. Select quantitative variable",choices = c("Sepal Length" = 1,"Sepal Width" = 2,"Petal length" = 3,"Petal Width" = 4)),
      br(),
      sliderInput("bins","2. Select the number of Bins for the Histogram", min = 5,max = 25, value = 15),
      br(),
      radioButtons("color","3. Select the color of histogram", choices=c("Red","Green","Yellow"), selected = "Green")
    ),
    # Show a plot of the generated distribution in the plotPutput()
    mainPanel(
            )
  
)
```

```
## Error in eval(expr, envir, enclos): could not find function "slidifyUI"
```
