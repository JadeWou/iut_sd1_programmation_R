#EXO 1
# COMMANDE FUNCTION()
salaire_net_cadre = function(salairebrut = 2500,temps_travail=1) {
  salairenet = salairebrut * 0.75 * temps_travail
  return(salairenet)
  }
salaire_net_cadre(2500,0.8)

#COMMANDE IF

salaire_net_cadre = function(salairebrut = 2500,temps_travail=1) {
  if(is.numeric(salairebrut) == FALSE) {return(print("Valeur non numérique"))}
  if(is.numeric(temps_travail) == FALSE | temps_travail <= 0 | temps_travail > 1) {return(print("Valeur non numérique ou pa entre 0 et 1"))}
  salairenet = salairebrut * 0.75 * temps_travail
  return(salairenet)
}
salaire_net_cadre(3000,1)

#COMMANDE ELSE

salaire_net = function(salairebrut = 2500,temps_travail=1,statut) {
  if(is.numeric(salairebrut) == FALSE) {return(print("Valeur non numérique"))}
  if(is.numeric(temps_travail) == FALSE | temps_travail <= 0 | temps_travail > 1) {return(print("Valeur non numérique ou pa entre 0 et 1"))}
  if (!statut %in% c("cadre","non cadre")) {return("Erreur :  le statut doit être cadre ou non cadre")}
  
  if(statut == "cadre") {salairenet = salairebrut * 0.75 * temps_travail}
  else {salairenet = salairebrut * 0.78 * temps_travail}
  return(salairenet)
}
salaire_net(2500,1,"non cadre")

#COMMANDE ELSE IF

salaire_net = function(salairebrut = 2500,temps_travail=1,statut) {
  if(is.numeric(salairebrut) == FALSE) {return(print("Valeur non numérique"))}
  if(is.numeric(temps_travail) == FALSE | temps_travail <= 0 | temps_travail > 1) {return(print("Valeur non numérique ou pa entre 0 et 1"))}
  if (!statut %in% c("cadre","non cadre")) {return("Erreur :  le statut doit être cadre ou non cadre")}
  
  if(statut == "cadre") {salairenet = salairebrut * 0.75 * temps_travail}
  else {salairenet = salairebrut * 0.78 * temps_travail}
  
  if(salairenet <= 1591){salairenet = salairenet}
  else if(salairenet <= 2006){salairenet = salairenet * (1-0.029)}
  else if(salairenet <= 3476){salairenet = salairenet * (1-0.099)}
  else if(salairenet <= 8557){salairenet = salairenet * (1-0.2)}
  else (salairenet = salairenet * (1-0.43))
  
  return(salairenet)
}
salaire_net(4000,1,"non cadre")

#shifumi
shifumi = function() {
  joueur = readline("Votre signe (pierre,papier,ciseaux) :")
  
  if(!joueur %in% c("pierre","papier","ciseaux")) {return("Valeur fausse")}
  
  ordi = sample(c("pierre","papier","ciseaux"),1)
  
  cat("joueur :" ,joueur, "\n")
  cat("ordi :", ordi, "\n")
  
  if(joueur == ordi) {resultat = "Egalité"}
  else if(joueur == "pierre" & ordi == "ciseaux" |
          joueur == "papier" & ordi == "pierre" |
          joueur == "ciseaux" & ordi == "papier")
  {resultat = "joueur a gagné"}
  else {resultat = "ordi a gagné"}
  return(resultat)
}

shifumi()

#EXO 2

resultat = 0
for(i in c(1,2,3,4,5)) {
  resultat = resultat + i
  print(resultat)
}

somme = 0
nb = 1
while(somme < 50){
  somme = somme + nb
  print(resultat)
  nb = nb + 1
}