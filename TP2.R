#Exo 1 : Imoporter les données
getwd()
setwd("L:/BUT/SD/Promo 2023/jwouters/progra/prog stat/dataset")
df = read.csv("fao.csv",TRUE,dec = ",",sep=";")

nrow(df)
summary(df)

#Exo 2 : Statistiques descriptives

#Moyenne de dispo_alim mais comme dispo alim est déjà une moyenne pour chaque
#pais, il fallait ponderé
sum(df$Dispo_alim * df$Population, na.rm = TRUE)/sum(df$Population, na.rm = TRUE)
sum(df$Population, na.rm = TRUE)
sd(df$Import_viande)
sd(df$Export_viande, na.rm = TRUE)
mean(df$Prod_viande, na.rm = TRUE)
quantile(df$Dispo_alim, c(0.25,0.5,0.75))
quantile(df$Import_viande, seq(0,1,0.01))

#Exo 3 : Tris et filtres

rang = order(df$Population)
resultat = df[rang,]
resultat[1:5,]

rang2 = order(df$Population, decreasing = TRUE)
resultat2 = df[rang2,]
resultat2[1:5,]

rangV = order(df$Prod_viande, decreasing = TRUE)
resultatV = df[rangV,]
resultatV[1:5,]

rangI = order(df$Import_viande, decreasing = TRUE)
resultatI = df[rangI,]
resultatI[1:5,]

Q5 = subset(df,df$Dispo_alim >= 2300)
nrow(Q5)

Q6 = subset(df,df$Dispo_alim > 3500 & df$Import_viande * 1000 >= 1000000 )
nrow(Q6)

Q7 = subset(df, df$Nom == c("France","Belgique"))

#Exo 4 : Modifier le dataframe
df$part_export = df$Export_viande/df$Prod_viande

df$dispo_alim_pays = df$Dispo_alim * df$Population

write.table(df,"ExportTp2.csv", sep=";")
