pokemon <- readRDS("pokemon.rds")

#This splits the pokemon into tibbles by their Type 1
Types<-split(pokemon,pokemon$`Type 1`)
for (i in 1:length(Types)){
  assign(Types[[i]]$`Type 1`[i],Types[[i]])
}


#pull_stats is a function that retreives the statistics for the pokemon from the full set
pull_stats <- function(x){
  data.frame("HP"=x$HP,
             "Attack"=x$Attack,
             "Defense"=x$Defense,
             "Sp Attack"=x$`Sp. Atk`,
             "Sp Defense"=x$`Sp. Def`,
             "Speed"=x$Speed)
}






#can we use a cluster algorithm for this e.g. k-means?
#general clusters form for most stats, what happens if we segregate into types?
#would be good to have evolution stage as a variable
#what level are these pokemon?
