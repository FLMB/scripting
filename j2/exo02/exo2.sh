#!/bin/bash
# Florian Leparoux 
# Exo01 : Objectif : Vérification de la présence d'un répertoire/fichier 
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# Affichage phrase 
echo "Le répertoire courant est $(pwd)"

# Création de 1 répertoire A s'il n'existe pas
if [ ! -d "A" ]; then
	mkdir A
else 
	echo "Le répertoire existe" 
fi

for file in {01..05}; do
	[ ! -f "A/$file" ] && touch ./A/{$file} || echo "le fichier existe"
done


# Création des fichiers de 01 à 05 s'il n'existe pas
## Plusieurs solutions possible
[ ! -f "A/01" ] && touch ./A/01 || echo "le fichier existe"
[ ! -f "A/02" ] && touch ./A/02 || echo "le fichier existe"
[ ! -f "A/03" ] && touch ./A/03 || echo "le fichier existe"
[ ! -f "A/04" ] && touch ./A/04 || echo "le fichier existe"
[ ! -f "A/05" ] && touch ./A/05 || echo "le fichier existe"

# On copie les fichiers de A vers ...
## Plusieurs solution possible
cp -r A B 

# Listage du répertoire
## Plusieurs solution possible
tree .
find .

# Insertion du contenu dans les fichiers impaire
## Plusieurs solution possible
echo "Ce fichier est le 01" > A/01

# Affichage du fichier B/01
## Plusieurs solution possible
cat B/01

# Ajout ligne supplémentaire si le fichier est en écriture (B/01)
[ -w "B/01" ] && echo "Ligne supplémentaire" >> B/01

# Fin du script
echo "Fin du script" && exit 0
