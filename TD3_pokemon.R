install.packages("readxl")
library(readxl)
pokemon = read_excel("pokemon.xlsx","pokemon")
dim(pokemon)

summary(pokemon)
pokemon$generation = as.factor(pokemon$generation)
pokemon$is_legendary = as.factor(pokemon$is_legendary)
pokemon$type = as.factor(pokemon$type)

pokemon$attack_group = as.factor(ifelse(pokemon$attack >= median(pokemon$attack),"attack+","attack-"))
View(pokemon)

pokemon$water_fire = as.factor(ifelse(pokemon$type == "water"
                                      | pokemon$type == "fire"
                                      ,"yes","no"))
summary(pokemon)
qattack = quantile(pokemon$attack,0.75)
qdef = quantile(pokemon$defense,0.75)
qspeed = quantile(pokemon$speed,0.75)
pokemon$best = as.factor(ifelse(pokemon$attack > qattack & pokemon$defense > qdef
                                & pokemon$speed > qspeed,"yes","no"))
summary(pokemon$best)

#is na fonction
requete = subset(pokemon,is.na(weight_kg))
requete3 = subset(pokemon,!is.na(height_m))
View(requete2)
requete2 = subset(pokemon,!is.na(weight_kg))


mediweight = median(requete2$weight_kg)
mediheight = median(requete3$height_m)
summary(requete2)
View(requete3)
pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg),mediweight,pokemon$weight_kg)
pokemon$height_mNA = ifelse(is.na(pokemon$height_m),mediheight,pokemon$height_m)

#cut() fonction
pokemon$weight_group = cut(pokemon$weight_kg,
                        breaks = 3, labels = c("léger", "moyen", "lourd"))

pokemon$height_m_group = cut(pokemon$height_m,breaks = c(0,1,2,3,max(pokemon$height_m, na.rm = TRUE)))
                                            
pokemon$defense_group = cut(pokemon$defense,
                            breaks = quantile(pokemon$defensena.rm = TRUE),
                            include.lowest = TRUE)
                            