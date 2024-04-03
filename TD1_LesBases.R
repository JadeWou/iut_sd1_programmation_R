#EXERCICE 1 
# Les fonctions c(), rm(), print()
a = 10
b = 5
resultat = a * b
print(resultat)
A = 7.2
B = 10.1
resultat = A + B

rm(a,b,resultat,A,B)

#Exercice 2 - Fonctions usuelles
#Les fonctions c(), class
vecteur <- c(1, 2, 3, 4, 5)
class(nb)
nb[3]

v1 = 1:5
v2 = v1 + 3
v3 = 1:6
v4 = v3 ** 2
v5 = v4 / 2

jours = c("Lundi","Mardi","Mercredi","Jeudi",
          "Vendredi","Samedi","Dimanche")
class(jours)
jours[c(2,7)]

vecteur = c(TRUE, FALSE, TRUE, FALSE, TRUE)
class(vecteur)

vecteur = c(1.2, 2.5, 3.8, 4.1, 5.6)
class(vecteur)
vecteur[-3]

mois = c("Janvier", "Février", "Mars", "Avril",
         "Mai", "Juin", "Juillet", "Août",
         "Septembre", "Octobre", "Novembre",
         "Décembre")
mois[1:3]
mois[c(-1,-2)]

vecteur = c(-1.2, -2.5, -3.8, -4.1, -5.6)
class(vecteur)
vecteur[c(5,1)]

vecteur = c(1, 2, NA, 4, 5)
class(vecteur)

#Les fonctions c(), seq(), length()
seq = seq(1,10,1)
seq = seq(2,20,2)
seq = seq(0,-5,-1)
seq = seq(5,50,5)
seq = seq(10,1,-1)
seq = seq(0,1,0.1)
seq = seq(5,-5,-1)
seq = seq(1,10,2)
length(seq)

# Les fonctions c(), rep()
vec = rep(5,3)
lettre = rep(c('A','B','C'),3)
sqc = rep(1:3,3)
tf = rep(c('True','False'),4)

# La fonction rm()
rm(list=ls())
#SUPPRIME TOUT LES OBJETS

#EXERCICE 3
#Les fonctions runif(), mean(), median(), min(), max()

vec =runif(5,0,1)
vec = runif(10,-5,5)
vec = runif(100,10,20)
vec = runif(15,50,100)
mean(vec)
median(vec)
min(vec)
max(vec)

#Les fonctions rnorm(), mean(), sd(), hist(), quantile()

vct = rnorm(20,-2,3)
mean(vct)
sd(vct)
hist(vct)

vct = rnorm(2000,-2,3)
vct = rnorm(2000,0,1)
quantile(vct,c(0.25,0.5,0.75))
deciles = quantile(vct,seq(0.1,1,0.1))
centiles =quantile(vct,seq(0.1,1,0.01))

#Les fonctions sum() , round()

sal =rnorm(3000,2400,300)
mean(sal)
sd(sal)
sal = round(sal,2)
masse = sum(sal)
median(sal)
quantile(sal,c(0.20,0.99))

#Les fonctions sample(), table(), prop.table() , unique(), sort()

de = sample(seq(1,6,1),1)
sim = sample(seq(1,6,1),12,TRUE)
unique(sim)
table(sim)
sort(table(sim))
prop.table(table(sim))

simu = sample(seq(1,6,1),100000,TRUE)
unique(simu)
table(simu)
sort(table(simu))
prop.table(table(simu))
print("Oui, toute le valeurs se rapproche de 0.16")
