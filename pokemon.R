library(readr)
pokemon <- read_csv("~/Downloads/pokemon.zip")
pokestats<- data.frame("HP"=pokemon$HP,
                       "Attack"=pokemon$Attack,
                       "Defense"=pokemon$Defense,
                       "Sp Attack"=pokemon$`Sp. Atk`,
                       "Sp Defense"=pokemon$`Sp. Def`,
                       "Speed"=pokemon$Speed)
head(pokestats)
pairs(pokestats)
#note outliers in the plots vs HP, are these the same pokemon with special stats.
#can we use a cluster algorithm for this e.g. k-means?
#general clusters form for most stats, what happens if we segregate into types?
#would be good to have evolution stage as a variable
#what level are these pokemon?