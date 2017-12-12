#!/bin/bash
# Florian Leparoux 
# Exo05 : Objectif : Récupération d'argument par entrée clavier bouclage de script
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

while true; do
	# Demande des arguments
	read -p "Renseigner nom  d'un répertoire à créer [exit pour quitter] : " reponse
	
  [ $reponse == "exit" ] && break

	# Affichage phrase 
	echo "Le nom du répertoire à créer est : $reponse"
	
	# Création des répertoires s'il n'existe pas, sinon exit
	if [ ! -d "$reponse" ]; then
		mkdir $reponse
	else 
		echo "Le répertoire existe"
		exit 1 
	fi
	
	# Création fichier dans le répertoire
	touch $reponse/fichier
	
	# Changement  des permissions si elle ne sont pas en 777
	if [ $(stat -c "%a" $reponse/fichier) != "777" ]; then
		chmod 777 $reponse/fichier
	fi
	
	# Affichage des permissions étendu du fichier
	ls -l $reponse/fichier
done	
	# Fin du script
echo "Fin du script" && exit 0
