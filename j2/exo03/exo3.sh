#!/bin/bash
# Florian Leparoux 
# Exo03 : Objectif : Récupération d'argument 
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# Affichage phrase 
echo "Le script comporte $# argument"

# Création des répertoires si le nombre d'argument est 3, sinon exit
if [ $# == 3 ]; then
	mkdir $@
else 
	echo "Vous avez trop ou peu d'arguments"
	exit 1 
fi

# Fin du script
echo "Fin du script" && exit 0
