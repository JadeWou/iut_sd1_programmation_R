#EXO 1 :
df <- read.csv(file = "nba2014_2015.csv", sep = ";",
               header = FALSE, dec = ";")
nrow(nba)
ncol(nba)
colname(df)
srt(df)
df$Period <- as.factor(df$Period)
df$PTSTYPE -> as.factor(df$PTSTYPE)
df$SHOOTER = as.factor(df$shooter)

# Les séparateurs du csv sont des "," et pas des ";"
# header doit être TRUE car il y a des titres aux colonnes
# Les décimals du csv sont des "." et pas des ";"

#nrow(nba) n'est pas possible car la dataframe a été nommé "df" pas "nba"
#c'est pas "colname" mais "colnames"

#df$Period est faux car le nom de colonne est "PERIOD"
# -> est faux c'est <- et PTSTYPE c'est PTS_TYPE
# SHOOTER pas Shooter

df <- read.csv(file = "nba2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")
nrow(df)
ncol(df)
colnames(df)
#srt(df)
df$PERIOD <- as.factor(df$PERIOD)
class(df$PERIOD)
df$PTS_TYPE <- as.factor(df$PTS_TYPE)
class(df$PTS_TYPE)
df$SHOOTER = as.factor(df$SHOOTER)


#EXO 2 :

# lenght mal écrit c'est "length" ; levels avec s ; PERIOD en maj
# lenght mal écrit c'est "length" ; PTS_TYPE avec _
# summary(df) pas "ddf

length(levels(df$PERIOD))
length(df$PTS_TYPE)
length(df$SHOOTER)
summary(df)

#df en minuscule pour sd(df...); manque ) a la fin
#() pas [] ; na.rm = TRUE pour avoir le sd car il y a des valeurs manquantes

sd(df$SHOT_DIST)
sd(df$SHOT_CLOCK,na.rm = TRUE)

#combien de tirs manqués/réussis ;  df$ pas autre chose pour accéder a une colonne
table(df$SHOT_RESULT)

#les quartiles ; probs peut pas être 4 il faut entre 0 et 1 ; on doit préciser les valeurs manquantes
quantile(df$SHOT_CLOCK, probs = c(0.25,0.50,0.75),na.rm=TRUE)

#les déciles ; CLOSE_DIST existe pas c'est CLOSE_DEF_DIST ; pout les déciles on fait seq de 0.1 0.2 0.3... ; valeurs manquantes
quantile(df$CLOSE_DEF_DIST, probs = seq(0,1,0.1),na.rm=TRUE)

#nombre de matches différents ; ) en trop ; listegame existe pas c'est liste_game
liste_game <- unique(df$GAME_ID)
length(liste_game)

#nombre de joueurs différents ; pas as_factor mais as.factor ; nlevels avec s pour compter joueurs différents, ) a la fin
df$SHOOTER <- as.factor(df$SHOOTER)
nlevels(df$SHOOTER)
       
#conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
# "nba" existe pas c'est "df" ; un seul = car on définit une nouvelle colonne ; on précise df$SHOT_DIST sinon il ne trouve pas (SHOT_DIST)
df$SHOT_DIST_METRE = df$SHOT_DIST * 0.30

#nombre de points qu'a rapporté la tentative (0,2 ou 3)
# 2 = car on vérifie une valeur on ne définit pas un nouveau truc
df$PTS_MARQUES <- ifelse(df$SHOT_RESULT == "made", yes = df$PTS_TYPE, 0)

#On supprime la variable GAME_RESULT car elle n'est pas utile ; c'est NULL pas NUL
df$GAME_RESULT <- NULL
       
#création d'un objet sans la première colonne GAME_ID  ; -1 doit être a droite pour les colonnes
df2 <- df[  , -1  ]


#EXO 3 :
df <- read.csv(file = "nba2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")

#Les 100 tirs réussis ou manqués les plus loin
# deacreasing TRUE pour + grand a + petit ; rang doit être en ligne pour trié ; c'est df3 qu'on modifie et c'est une , pas ; 
rang <- order(df$SHOT_DIST, decreasing = TRUE)
df3 <- df[rang,]
df3 <- df3[1 : 100,]

#Les 100 tirs réussis les plus loin
#on utilise df pas df3 parcequ'elle est déja modifié df3 ; == et "made" pour une égalité
df4 <- df[rang, ]
df4 = subset(df4, SHOT_RESULT == "made")
df4 = df4[1:100,]


#Combien de tirs à 3 points a réussi Kobe Bryant ?  ; == "" et kobe bryant en minuscule comme dans la df
df_kobe = subset(df,SHOT_RESULT == "made" &
                   PTS_TYPE == 3 & 
                   SHOOTER == "kobe bryant")
dim(df_kobe)

#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df$PTS_MARQUES <- ifelse(df$SHOT_RESULT == "made", yes = df$PTS_TYPE, 0)

df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = sum)

df_total_tri <- df_total[order(df_total$PTS_MARQUES,decreasing = TRUE),]

df_top5 <-  df_total_tri[  1:5  ,  ]


#EXO 4 :
#Des graphiques adaptés selon le type de variable

#construction de la fonction ; pas as.factor mais is.factor
build_graph <- function(une_colonne, nom_colonne) {
  if(is.numeric(une_colonne)) {
    print(boxplot(une_colonne, main = nom_colonne))
  }
  else if (is.factor(une_colonne)) {
    tri <- table(une_colonne)
    print(barplot(tri, main = nom_colonne))
  }}
  
#on déroule la fonction sur chaque colonne du data frame.
  
for (colonne in colnames(df)) {
    build_graph(une_colonne = df[ ,colonne ] , nom_colonne = colonne)}
