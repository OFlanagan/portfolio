#ui.R
shinyUI(fluidPage(
  titlePanel("Welcome to the bug Pokemon"),
  
  mainPanel(plotOutput("plot")),
  
  selectInput("stat", 
           label = "Choose a Stat",
           choices = list("HP","Attack","Defense","Special Attack",
                          "Special Defense","Speed"),
           selected = "HP"),
  textOutput("text1"),
  
  sliderInput("range",
             "Stat level",
             0,300,c(0,300)
             
             ),
  
  dataTableOutput("table")
  
  
))
