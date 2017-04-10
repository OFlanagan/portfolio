#server.R
library(shiny)
library(ggplot2)
source("helpers.R")
shinyServer(function(input,output){
  
  output$plot <- renderPlot({
    
    plotting <- switch(input$stat,
                       "HP"=Bug$HP,
                       "Attack"=Bug$Attack,
                       "Defense"=Bug$Defense,
                       "Special Attack"=Bug$`Sp. Atk`,
                       "Special Defense"=Bug$`Sp. Def`,
                       "Speed"=Bug$Speed
                       
    )
    
    ggplot(data=Bug,
           aes(plotting))+geom_histogram()
  })
  

})

