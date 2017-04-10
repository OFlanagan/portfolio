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








#note outliers in the plots vs HP, are these the same pokemon with special stats.

high_HP<-pokemon[which(pokestats$HP>200),]
high_attack<-pokemon[which(pokestats$Attack>180),]
high_defense<-pokemon[which(pokestats$Defense>200),]
high_SpAttack<-pokemon[which(pokestats$Sp.Attack>180),]
high_SpDefense<-pokemon[which(pokestats$Sp.Defense>180),]
high_speed<-pokemon[which(pokestats$Speed>170),]
high_stats<-rbind(high_HP,high_attack,high_defense,high_SpAttack,high_SpDefense,high_speed)


#can we use a cluster algorithm for this e.g. k-means?
#general clusters form for most stats, what happens if we segregate into types?
#would be good to have evolution stage as a variable
#what level are these pokemon?
