getwd()
velos = read.csv("velov.csv",header = TRUE, dec = ",", sep = ";")
summary(velos)
# Exercice 1 - Importer les données

velos$status = as.factor(velos$status)
velos$CodePostal = as.factor(velos$CodePostal)
velos$bornes = ifelse(velos$capacity == velos$bikes + velos$stands,"OK","KO")
velos$bornes = as.factor(velos$bornes)
summary(velos$bornes)
table(velos$bornes)

# Exercice 2 - L'histogramme

hist(velos$capacity, main = "Histogramme des capacités",
                      xlab = "Capacité", 
                      col = "gold")
hist(velos$capacity, main = "Histogramme des capacités",
     xlab = "Capacity", 
     col = "red",
     breaks = 6)
abline(h=100, col = "blue", lty = 2)

hist(velos$capacity, main = "Histogramme des capacités",
     xlab = "Capacity",
     probability = TRUE,
     col = "red",
     breaks = 6,
     ylim = c(0,0.08))
lines(density(velos$capacity), lwd = 1, lty = 2, col = "blue")

# Exercice 3 - Le boxplot
boxplot(velos$capacity, main = "Boxplot des capacités",
     col = "red",
     horizontal = TRUE)
boxplot(velos$capacity, main = "Boxplot des capacités",
        outline = FALSE)
points(mean(velos$capacity, na.rm = TRUE),pch = 15, col = "red", cex = 2)
#cex change la taille du point

par(mfrow=c(1,2))
ar7 = subset(velos, CodePostal == "69007")
boxplot(ar7$capacity, main = "Boxplot des capacités 7",ylim = c(0,40))
ar8 = subset(velos, CodePostal == "69008")
boxplot(ar8$capacity, main = "Boxplot des capacités 8",ylim = c(0,40))

par(mfrow=c(1,1))
boxplot(formula = bikes ~ bonus, data = velos,main = "dispo velo/bonus")

moyennes = tapply(X =velos$bikes, INDEX = velos$bonus, FUN = mean)
points(moyennes,pch = 19, col = "red")

# Exercice 4 - Le diagramme

table(velos$bonus)
barplot(table(velos$bonus), main = "repartition bonus", col = "lightblue",horiz = TRUE)

barplot(prop.table(table(velos$bonus)), main = "repartition bonus", col = "lightblue", horiz = TRUE)

truc = table(velos$bonus, velos$banking)
barplot(truc, main = "repartition bonus", xlab = "bonus", col = c("red","green"))
legend(x = "topright", legend = c("FALSE", "TRUE"), fill = c("red", "green"))

frequence = prop.table(truc)
barplot(height = frequence,
        main = "Bonus vs Banking",
        xlab = "Station Bonus ?",
        col = c("red","green"))
legend(x = "topright", legend = c("FALSE", "TRUE"), fill = c("red", "green"))

frequence = prop.table(truc)
barplot(height = frequence,
        main = "Bonus vs Banking",
        xlab = "Station Bonus ?",
        col = c("red","green"),
        beside = TRUE)
legend(x = "topright", legend = c("FALSE", "TRUE"), fill = c("red", "green"))

nbBonus = table(velos$bonus)
leg = paste(rownames(nbBonus)," ",nbBonus)
pie(nbBonus, main = "rep bonus", col = c("yellow","green"), labels = leg)

cdePost = table(velos$CodePostal)
top = sort(cdePost, TRUE)[1:10]
print(top)
barplot(height = top,
        main = "code postal",
        las = 2,
        col = palette())
rainbow(8)
dev.print(device = png, file = "export.png", width = 600)

# Exercice 5 - Nuage de points

plot(velos$stands, velos$capacity, main = "cor place/capcité", xlim = c(0,60), ylim = c(0, 60), pch =19)

velos$bornes = as.factor(velos$bornes)
plot(velos$stands, velos$capacity, main = "cor place/capcité", xlim = c(0,60), ylim = c(0, 60), pch =19, col = velos$bornes)
legend("topright", legend = levels(velos$bornes),col = palette(), pch = 19)

mecouleur = rainbow(8)
plot(velos$stands, velos$capacity, main = "cor place/capcité", xlim = c(0,60), ylim = c(0, 60), pch =19, col = mecouleur[velos$bornes])
legend("topright", legend = levels(velos$bornes),col = mecouleur, pch = 19)

moyplace = mean(velos$stands)
moycapa = mean(velos$capacity)
points(moyplace, moycapa,pch = 19, col = "green", cex = 2)
