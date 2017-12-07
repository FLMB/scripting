#!/bin/bash
# Florian Leparoux 
# Exo01 : Objectif : Création/Modification/Suppression de fichier
# Solution

# Création du répertoire de travail
echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"

# Déplacement dans le répertoire de travail 
echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"

# Affichage phrase 
echo "Le répertoire courant est $(pwd)"

# Création de 10 répertoires de [A-J]
echo "## Début créations répertoires ##"
#mkdir A B C D E F G H I J
mkdir {A..J}
echo "## Fin créations répertoires ##"

# Création des fichiers de 01 à 05
## Plusieurs solutions possible
echo "## Début créations de fichiers ##"
touch ./A/{01..05} 
echo "## Fin créations de fichiers ##"

# On copie les fichiers de A vers ...
echo "## Début copie des fichiers de A vers ... ##"
cp A/* B; cp A/* C; cp A/* D;  cp A/* E; cp A/* F; cp A/* G; cp A/* H; cp A/* I; cp A/* J   
echo "## Fin de copie des fichiers de A ##"

# Listages des répertoires de façon récursive
## Plusieurs solution possible
echo "## Début listages des fichiers##"
#ls -lR ./
tree .
echo "## Fin listages des fichiers ##"

# Insertion du contenu dans les fichiers impaire

echo "## Début insertion contenu ##"
echo "Ce fichier est le 01" > A/01
echo "Ce fichier est le 01" > B/01
echo "Ce fichier est le 01" > C/01
echo "Ce fichier est le 01" > D/01
echo "Ce fichier est le 01" > E/01
echo "Ce fichier est le 01" > F/01
echo "Ce fichier est le 01" > G/01
echo "Ce fichier est le 01" > H/01
echo "Ce fichier est le 01" > I/01
echo "Ce fichier est le 01" > J/01
echo "## Fin insertion contenu ##"

# Supprimer les dossiers voyelles
## Plusieurs solution possibles
echo "## Début Suppression des dossiers voyelles ##"
rm -rfv ./{A,E,I}
echo "## Fin suppression des dossiers voyelles ##"

