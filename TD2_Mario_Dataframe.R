getwd()
setwd("L:/BUT/SD/Promo 2023/jwouters/progra/prog stat/dataset")

bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")

dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)

#Résumé des dataset
resum_body = summary(bodies_karts)
resum_tire = summary(tires)
resum_gliders = summary(gliders)
resum_drivers = summary(drivers)

plot(x = drivers$Weight, y = drivers$Acceleration, xlab = "weight", ylab = "Accel", main = " titre")
#Plus le poid est lourd plus l'accélération est faible
#Les drivers peuvent avoir les même statistique

corr = cor(drivers$Weight,drivers$Acceleration)

cov = cov(drivers$Weight,drivers$Acceleration)
#espXY = mean(drivers$Weight * drivers$Acceleration)
#espXespY = mean(drivers$Weight) * mean(drivers$Acceleration)
sdx = sd(drivers$Weight)
sdy = sd(drivers$Acceleration)

#correcal = (espXY - espXespY)/(sdx * sdy)
correcal2 = cov/(sdx * sdy)

#coefficient de détermination
deter = correcal2^2
print(deter)

matriceDRIVE = round(cor(drivers[-1]), 2)

install.packages("corrplot")
library(corrplot)
corrplot(matrice)


matriceBODIES = round(cor(bodies_karts[-1]), 2)
matriceGLIDE = round(cor(gliders[-1]), 2)
matriceTIRES = round(cor(tires[-1]), 2)

corrplot(matriceBODIES)
corrplot(matriceGLIDE)
corrplot(matriceTIRES)


matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="lower", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE)

#Pour avoir des précision sur la fonction :
?corrplot

resultat = drivers[c("Driver","Weight")]
