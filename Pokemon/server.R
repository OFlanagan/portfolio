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
    coloring<-function(x) {
      if(x >= input$range[1] & x <= input$range[2])
      {color="black"}
      else
      {color="blue"}  
    }
    
    
    colors<-sapply(sort(Bug$Attack),coloring)
    
    ggplot(data=Bug,
           aes(Bug$Attack))+geom_histogram(bins=length(Bug$Attack),fill=colors)
               
    })
  
  output$table <- renderDataTable({
    #need to take input stat and range and use to display only that data
    
    current_stat<- switch(input$stat,
              "HP"=Bug$HP,
              "Attack"=Bug$Attack,
              "Defense"=Bug$Defense,
              "Special Attack"=Bug$`Sp. Atk`,
              "Special Defense"=Bug$`Sp. Def`,
              "Speed"=Bug$Speed
    )
    
    
    newdata <- subset(Bug, current_stat >= input$range[1]  & current_stat <= input$range[2])
    newdata
    
    
  })
  

})

