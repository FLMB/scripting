#!/bin/bash
# Florian Leparoux 
# Exo04 : Objectif : Récupération d'argument par entrée clavier et changement de permissions
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# Demande des arguments
echo "Renseigner nom  d'un répertoire à créer"
read reponse

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

# Fin du script
echo "Fin du script" && exit 0
