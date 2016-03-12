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
     
        dev.off()
        
      })
    
  })

