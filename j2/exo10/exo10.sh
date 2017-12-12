#!/bin/bash
# Florian Leparoux 
# Exo10 : Objectif : Journalisation
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# On récupère le fichier
wget https://t1loc.fr/passwd

# On récupere les id non système
declare -a user
user=($(awk -F':'  '$3 > 500  {print $1}' passwd))

# On compte les utilisateurs commencent par aurel
count_test=$(echo ${user[@]} | grep -o 'test' | wc -l)
count_aure=$(echo ${user[@]} | grep -o 'aurel' | wc -l)
count_ore=$(echo ${user[@]} | grep -o 'ore' | wc -l)

cat<<MSG
Il y a ${count_test} occurence de test
Il y a ${count_aure} occurence de aurel
Il y a ${count_ore} occurence de ore
MSG


# Afficher  la 17eme  ligne 
head -17 passwd | tail -1

# On quitte le script
echo "Fin du script" && exit 0
