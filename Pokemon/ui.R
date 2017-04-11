#ui.R
shinyUI(
  navbarPage("Navbar",
             tabPanel("Summary",
  fluidPage(
  titlePanel("Welcome to Pokemon"),
  
  mainPanel(plotOutput("plot")),
  
  selectInput("type",
              label="What Type of Pokemon",
              choices = list("All","Bug","Dark","Dragon","Electric","Fairy","Fighting","Fire",
                             "Ghost","Grass","Ground","Ice","Normal","Poison","Psychic",
                             "Steel","Water"),
              selected="All"),
  
  
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
)),

  tabPanel("Comparison",
           titlePanel("TEST")
  
           )
)
)