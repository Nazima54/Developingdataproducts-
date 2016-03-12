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