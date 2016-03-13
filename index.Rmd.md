Data Product using Iris Dataset
========================================================
author: Nazima
date: MArch 2016

Iris Flower Dataset
========================================================


The Iris flower data set or Fisher's Iris data set is a multivariate data set introduced by Ronald Fisher in his 1936 paper The use of multiple measurements in taxonomic problems as an example of linear discriminant analysis.
- 1. It is sometimes called Anderson's Iris data set because Edgar Anderson collected the data to quantify the morphologic variation of Iris flowers of three related species.
- 2.Two of the three species were collected in the Gaspe Peninsula "all from the same pasture, and picked on the same day and measured at the same time by the same person with the same apparatus""


Dataset Summary
========================================================


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

Data Product Summary
========================================================
 
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



IriSFlowerAnalysis (ui.R)
========================================================


```r
library(shiny)
data(iris)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel(title = h4("Developing data products Project using Iris flower Dataset", align = "center")),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3('Instructions'),
      p('The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and   Iris versicolor). Four features were measured from each sample: the length and the width of the sepals and petals, in centimetres.'),
      selectInput("var","1. Select quantitative variable",choices = c("Sepal Length" = 1,"Sepal Width" = 2,"Petal length" = 3,"Petal Width" = 4)),
      br(),
      sliderInput("bins","2. Select the number of Bins for the Histogram", min = 5,max = 25, value = 15),
      br(),
      radioButtons("color","3. Select the color of histogram", choices=c("Red","Green","Yellow"), selected = "Green")
    ),
    # Show a plot of the generated distribution in the plotPutput()
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      tabsetPanel(type="tab",
                  tabPanel("Summary", verbatimTextOutput("sum")),
                  tabPanel("Structure", verbatimTextOutput("str")),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", plotOutput("myhist")),
                  downloadButton(outputId = "down",label = "Download Plot"),
                  radioButtons("type","Select the File type", choices=c("pdf","png"), selected = "pdf")
                  
      )
    )
  ))
)
```

<!--html_preserve--><div class="container-fluid">
<h2>
<h4 align="center">Developing data products Project using Iris flower Dataset</h4>
</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<h3>Instructions</h3>
<p>The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and   Iris versicolor). Four features were measured from each sample: the length and the width of the sepals and petals, in centimetres.</p>
<div class="form-group shiny-input-container">
<label class="control-label" for="var">1. Select quantitative variable</label>
<div>
<select id="var"><option value="1" selected>Sepal Length</option>
<option value="2">Sepal Width</option>
<option value="3">Petal length</option>
<option value="4">Petal Width</option></select>
<script type="application/json" data-for="var" data-nonempty="">{}</script>
</div>
</div>
<br/>
<div class="form-group shiny-input-container">
<label class="control-label" for="bins">2. Select the number of Bins for the Histogram</label>
<input class="js-range-slider" id="bins" data-min="5" data-max="25" data-from="15" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="5" data-drag-interval="true" data-data-type="number"/>
</div>
<br/>
<div id="color" class="form-group shiny-input-radiogroup shiny-input-container">
<label class="control-label" for="color">3. Select the color of histogram</label>
<div class="shiny-options-group">
<div class="radio">
<label>
<input type="radio" name="color" value="Red"/>
<span>Red</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="color" value="Green" checked="checked"/>
<span>Green</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="color" value="Yellow"/>
<span>Yellow</span>
</label>
</div>
</div>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="text1" class="shiny-text-output"></div>
<div id="text2" class="shiny-text-output"></div>
<div id="text3" class="shiny-text-output"></div>
<div class="tabbable tabs-above">
<ul class="nav nav-tabs">
<li class="active">
<a href="#tab-4046-1" data-toggle="tab" data-value="Summary">Summary</a>
</li>
<li>
<a href="#tab-4046-2" data-toggle="tab" data-value="Structure">Structure</a>
</li>
<li>
<a href="#tab-4046-3" data-toggle="tab" data-value="Data">Data</a>
</li>
<li>
<a href="#tab-4046-4" data-toggle="tab" data-value="Plot">Plot</a>
</li>
<li>
<a href="#tab-4046-5" data-toggle="tab"></a>
</li>
<li>
<a href="#tab-4046-6" data-toggle="tab"></a>
</li>
</ul>
<div class="tab-content">
<div class="tab-pane active" data-value="Summary" id="tab-4046-1">
<pre id="sum" class="shiny-text-output"></pre>
</div>
<div class="tab-pane" data-value="Structure" id="tab-4046-2">
<pre id="str" class="shiny-text-output"></pre>
</div>
<div class="tab-pane" data-value="Data" id="tab-4046-3">
<div id="data" class="shiny-html-output"></div>
</div>
<div class="tab-pane" data-value="Plot" id="tab-4046-4">
<div id="myhist" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
<a id="tab-4046-5" class="btn btn-default shiny-download-link " href="" target="_blank">
<i class="fa fa-download"></i>
Download Plot
</a>
<div id="tab-4046-6" class="form-group shiny-input-radiogroup shiny-input-container">
<label class="control-label" for="type">Select the File type</label>
<div class="shiny-options-group">
<div class="radio">
<label>
<input type="radio" name="type" value="pdf" checked="checked"/>
<span>pdf</span>
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="type" value="png"/>
<span>png</span>
</label>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div><!--/html_preserve-->

IriSFlowerAnalysis (server.R)
========================================================


```r
library(shiny)
data(iris)

# Define server logic required to draw a histogram
# Expression that generates a histogram. The expression is
# wrapped in a call to renderPlot to indicate that:
#
#  1) It is "reactive" and therefore should be automatically
#     re-executed when inputs change
#  2) Its output type is a plot

shinyServer(
  
  function(input, output){
    
    colm <- reactive({
      as.numeric(input$var)
    })
    
    output$text1 <- renderText({
      #  colm = as.numeric(input$var)
      paste("Data set variable/colmn name is",names(iris[colm()]))
    })
    output$text2 <- renderText({
      paste("Color of histogram is", input$color)
    })
    
    output$text3 <- renderText({
      paste("Number of histogram BINs is", input$bins)
    })
    
    
    ## Define renderPrint function for Summary Tab. 
    output$sum  <- renderPrint({
      summary(iris)
    })
    
    ## Define renderPrint function for Structure Tab.
    output$str <- renderPrint({
      str(iris)
    })
    
    ## Define renderTable Function for user selcted column in the Data Tab.
    output$data <- renderTable({
      # colm <- as.numeric(input$var)
      iris[colm()]
      # head(iris)
    })
    
    ## Define the renderPlot function for the Plot Tab
    output$myhist <- renderPlot({
      # colm    <- as.numeric(input$var)
      
      # Draw the histogram with the specified number of bins
      hist(iris[,colm()], breaks = seq(0,max(iris[,colm()]),length.out = input$bins + 1),col = input$color,main = "Histogram of iris dataset",xlab = names(iris[colm()]))
    })
    
      
    output$down <- downloadHandler(
      # specify file name
      filename = function(){
        #iris.png
        #iris.pdf
        paste("iris",input$type, sep = '.')
      },
      
      content = function(file){
        #open the device
        #create the plot
        #close the plot
        #png()
        #pdf()
        
        if(input$type == "pdf")
          pdf(file)
        
        else
          
          png(file)
          plot(myhist())
        dev.off()
        
      })
    
  })
```
