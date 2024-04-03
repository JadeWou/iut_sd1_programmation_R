#Exercice 1 - Comprendre la loi normale
# Créer une toile de fond vide pour le graphique
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")
# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)


serie = rnorm(1e4,0,1)
hist(serie,probability = TRUE)
lines(density(serie))
median(serie)
quantile(serie,seq(0,1,0.25))
quantile(serie,seq(0,1,0.01))
quantile(serie,0.95)

#Les commandes pnorm() et qnorm().
qnorm(0.95,0,1)
pnorm(1.644854,0,1)

qnorm(0.975,0,1)
1-pnorm(1.96,0,1)

#Exercice 2 - Construire la table de loi normale
num_ligne = seq(0,3.9,0.1)
vecteur = c()

for (i in num_ligne) {
  k = pnorm(i,0,1)
  vecteur = round(c(vecteur,k),4)
}
vecteur

#code précedent modifié pour avir la table entière
num_ligne = seq(0,3.9,0.1)
num_col = seq(0,0.09,0.01)

resultat = NULL
for(j in num_col){
  vecteur = c()
  for (i in num_ligne) {
    k = pnorm(i+j,0,1)
    vecteur = round(c(vecteur,k),4)}
  resultat = cbind(resultat,vecteur)
}
resultat

df = data.frame(resultat)
rownames(df) = num_ligne
colnames(df) = num_col
View(df)


#Exercice 3 - Simulation d'une population
population = rnorm(1e7,171.9,9)
mean(population)
sd(population)

hist(population)

pnorm(190,171.9,9)
pop190 = population[population < 190]
length(pop190)/length(population)

1-pnorm(200,171.9,9)
pop200 = population[population >= 200]
length(pop200)/length(population)

#Exercice 4 - Simulation d'échantillon
#La commande sample()
echantillon = sample(population,100)
mean(echantillon)
sd(echantillon)

largeur<-qnorm(p = 0.975,mean=0,sd=1)*9/sqrt(100)
borne_inf<-171.9-largeur
borne_sup <-171.9+largeur

#Les commandes sample() et apply().
echantillons = replicate(1000,sample(population,100))
moyennes = apply(echantillons,MARGIN = 2,FUN = function(x) mean(x))
ecarts = apply(echantillons,MARGIN = 2,FUN = function(x) sd(x))

hist(moyennes)
mean(moyennes)
sd(moyennes)

largeur<-apply(X = echantillons,
               MARGIN = 2,
               FUN = function(x) pnorm(0.975)*sd(x)/100)

borne_inf_IC<-moyennes-largeur
borne_sup_IC<-moyennes+largeur

res = data.frame(largeur,borne_inf_IC,borne_sup_IC)
View(res)
