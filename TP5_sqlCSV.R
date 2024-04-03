#EXERCICE 1

library(tools)
fichiers = list.files(pattern = ".csv$")
# pattern sert a lire seulement les fichiers avec la fin en .csv par exemple
print(fichiers[1])

name_file = basename(fichiers[1])
name_file = file_path_sans_ext(fichiers[1])
print(name_file)

assign(name_file, read.csv(fichiers[1],
                           sep = ",",
                           dec = "."))

debut = Sys.time()
for(i in fichiers){
  nom_fich = file_path_sans_ext(i)
  print(nom_fich)
  
  assign(nom_fich, read.csv(i,
                             sep = ",",
                             dec = "."))
}
fin = Sys.time()
print(fin-debut)

#EXERCICE 2
LA = subset(team, city == "Los Angeles")
dfjoin = merge(LA,game,by.x = "id",by.y = "team_id_home")
nrow(dfjoin)


dfinflu = merge(dfjoin,game_info,
                by = "game_id",
                all.x = TRUE)
mean(dfinflu$attendance, na.rm =TRUE)


saison = subset(game_summary, season == 2020, c("game_id","season"))
offi2020 = merge(saison,
                 officials,
                 by = "game_id",
                 all.x = TRUE)
length(unique(offi2020$official_id))


didi = subset(officials, first_name == "Dick" & last_name == "Bavetta", c("game_id","first_name","last_name"))
cbdidi = merge(game_summary,
               didi,
               by = "game_id",
               all.y = TRUE)
table(cbdidi$season)

#EXERCICE 3
install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)
mydb <- dbConnect(SQLite(), "nbaDb.sqlite")
dbListTables(mydb)
dbGetQuery(mydb, 'SELECT * FROM team LIMIT 5')
dbDisconnect(mydb)
