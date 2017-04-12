#server.R
library(shiny)
library(ggplot2)
source("helpers.R")
shinyServer(function(input,output){
  


  
  
  
  
  output$plot <- renderPlot({
    
    type <- switch(input$type,
                   "All"=pokemon,
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
                       "Speed"=type$Speed)
                       
 
  
ggplot(data=type,aes_string(input$stat)) +
    geom_histogram(data=subset(type,plotting<input$range[1],binwidth=10), fill="dark green",color="black")+
    geom_histogram(data=subset(type,plotting>=input$range[1] & plotting<input$range[2],binwidth=10),fill="blue",color="black")+
    geom_histogram(data=subset(type,plotting>=input$range[2],binwidth=10),fill="dark green",color="black")
  
    }) 
  
  output$table <- renderDataTable({
    #need to take input stat and range and use to display only that data
    
    type <- switch(input$type,
                   "All"=pokemon,
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

