#EXERCICE 1
iris
class(iris)
View(iris)
nrow(iris)
ncol(iris)
colnames(iris)
summary(iris)
iris[ , c("Sepal.Length","Species")]
iris[c(100,103,105),]
iris[c(50:100),]
mean(iris$Sepal.Length)
median(iris$Sepal.Width)
sd(iris$Petal.Length)
quantile(iris$Petal.Width,seq(0.1,0.9,0.1))

#EXERCICE 2
#La fonction read.csv()
dfManga = read.csv("L:/BUT/SD/Promo 2023/jwouters/progra/prog stat/manga.csv")
dfAnime = read.csv("L:/BUT/SD/Promo 2023/jwouters/progra/prog stat/anime.csv")
class(dfManga)
View(dfAnime)
dim(dfAnime)
mean(dfAnime$Score)
mean(dfManga$Score)
#Anime a une meilleure moyenne de score
sum(dfAnime$Vote)
sum(dfManga$Vote)
#Les Animes ont plus de votes
sd(dfAnime$Score)
sd(dfManga$Score)
#Les mangas ont des scores plus homogènes
quantile(dfAnime$Score,seq(0.1,0.9,0.1))
quantile(dfManga$Score,seq(0.1,0.9,0.1))
#Les animes ont le décile 1 le plus petit

#Les fonctions subset(), table() et prop.table()
#Manga
note = subset(dfManga,Score >9)
nrow(note)
View(note)

votes = subset(dfManga, Vote >= 200000)
nrow(votes)
View(votes)

votenote = subset(dfManga, Vote > 200000 & Score >= 8)
nrow(votenote)
View(votenote)

notentr = subset(dfManga,Score >= 7 & Score <= 8)
nrow(notentr)
View(notentr)

#Anime
length(unique(dfAnime$Rating))
table(dfAnime$Rating)
prop.table(table(dfAnime$Rating))

nrow(subset(dfAnime, 
            Rating == "R - 17+ (violence & profanity)"))

nrow(subset(dfAnime, Rating == "R - 17+ (violence & profanity)" 
            & Score > 8))

nrow(subset(dfAnime, 
            Rating != "R - 17+ (violence & profanity)"))

nrow(subset(dfAnime,
            Rating %in% c("PG - Children","G - All Ages")))

nrow(subset(dfAnime,
            !Rating %in% c("PG - Children","G - All Ages")))

vn = subset(dfAnime, Vote > 400000 | Score >= 9)
nrow(vn)
View(vn)     

#Les fonctions rbind() et write.table()
ani = dfAnime[ ,c("Title","Score","Vote","Ranked")]
man = dfManga[ ,c("Title","Score","Vote","Ranked")]
ani$type = "Anime"
man$type = "Manga"
View(ani)
Concat = rbind(ani,man)
View(Concat)
write.table(Concat, file = "L:/BUT/SD/Promo 2023/jwouters/progra/prog stat/FinalTP1.csv", 
            sep = ",", 
            row.names = TRUE)
