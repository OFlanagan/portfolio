#server.R
library(shiny)
library(ggplot2)
source("helpers.R")
shinyServer(function(input,output){
  


  
  
  
  
  output$plot <- renderPlot({
    
    type <- switch(input$type,
                   "Bug"=Bug,
                   "Dark"=Dark,
                   "Dragon"=Dragon,
                   "Electric"=Electric,
                   "Fairy"=Fairy,
                   "Fighting"=Fighting,
                   "Fire"=Fire,
                   "Ghost"=Ghost,
                   "Grass"=Grass,
                   "Ground"=Ground,
                   "Ice"=Ice,
                   "Normal"=Normal,
                   "Poison"=Poison,
                   "Psychic"=Psychic,
                   "Steel"=Steel,
                   "Water"=Water)
    
    plotting <- switch(input$stat,
                       "HP"=type$HP,
                       "Attack"=type$Attack,
                       "Defense"=type$Defense,
                       "Special Attack"=type$`Sp. Atk`,
                       "Special Defense"=type$`Sp. Def`,
                       "Speed"=type$Speed
                       
    )
    coloring<-function(x) {
      if(x >= input$range[1] & x <= input$range[2])
      {color="blue"}
      else
      {color="black"}  
    }
    
    
    colors<-sapply(sort(type$Attack),coloring)
    
    ggplot(data=type,
           aes(type$Attack))+geom_histogram(bins=length(type$Attack),fill=colors)
               
    })
  
  output$table <- renderDataTable({
    #need to take input stat and range and use to display only that data
    
    type <- switch(input$type,
                   "Bug"=Bug,
                   "Dark"=Dark,
                   "Dragon"=Dragon,
                   "Electric"=Electric,
                   "Fairy"=Fairy,
                   "Fighting"=Fighting,
                   "Fire"=Fire,
                   "Ghost"=Ghost,
                   "Grass"=Grass,
                   "Ground"=Ground,
                   "Ice"=Ice,
                   "Normal"=Normal,
                   "Poison"=Poison,
                   "Psychic"=Psychic,
                   "Steel"=Steel,
                   "Water"=Water)
    
    current_stat<- switch(input$stat,
              "HP"=type$HP,
              "Attack"=type$Attack,
              "Defense"=type$Defense,
              "Special Attack"=type$`Sp. Atk`,
              "Special Defense"=type$`Sp. Def`,
              "Speed"=type$Speed
    )
    
    
    newdata <- subset(type, current_stat >= input$range[1]  & current_stat <= input$range[2])
    newdata
    
    
  })
  

})

