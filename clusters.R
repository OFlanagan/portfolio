pokemon <- readRDS("pokemon.rds")

#This splits the pokemon into tibbles by their Type 1
Types<-split(pokemon,pokemon$`Type 1`)
for (i in 1:length(Types)){
  assign(Types[[i]]$`Type 1`[i],Types[[i]])
}
pull_stats <- function(x){
  data.frame("HP"=x$HP,
             "Attack"=x$Attack,
             "Defense"=x$Defense,
             "Sp Attack"=x$`Sp. Atk`,
             "Sp Defense"=x$`Sp. Def`,
             "Speed"=x$Speed)
}


pairs(pull_stats(pokemon))


coloring<-function(x) {
  if (x == "Bug")
    {color="light green"}
  else if (x == "Dark")
  {color="black"}
  else if (x == "Dragon")
  {color="Dark Red"}
  else if (x == "Electric")
  {color="yellow"}
  else if (x == "Fairy")
  {color="pink"}
  else if (x == "Fighting")
  {color="orange"}
  else if (x == "Fire")
  {color="red"}
  else if (x == "Ghost")
  {color="purple"}
  else if (x == "Grass")
  {color="dark green"}
  else if (x == "Ground")
  {color="orange"}
  else if (x == "Ice")
  {color="light blue"}
  else if (x == "Normal")
  {color="grey"}
  else if (x == "")
  {color="black"}
    else {color="black"}
}
  
  
  
  



colors<-sapply(pokemon$`Type 1`,coloring)


ggplot(data=pokemon,
       aes(Attack,HP))+geom_jitter(color=colors)

)
