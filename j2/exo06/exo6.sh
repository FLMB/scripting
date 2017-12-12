#!/bin/bash
# Florian Leparoux 
# Exo06 : Objectif : Création d'un menu + répétition 
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

while true; do
clear
cat<<EOF
1 Créer un répertoire
2 Listes le répertoire courant
3 Supprimer un repertoire
4 Afficher les permissions du répertoires
5 Changer les permissions du répertoires
6 Quitter

Votre choix :
EOF
read reponse
	case $reponse in 
		1) echo "Indiquer les répertoires à créer"
			 read  rep_mk
			 [ ! -d $rep_mk ] && mkdir $rep_mk || echo "Le répertoire existe"
			;;
		2) echo "Listage des répertoires courant"
			 ls -l
			;;
		3) echo "Suppression de repertoire"
       ls
			 echo "Indiquer le répertoires à supprimer :"
			 read rep_sup
			 [ -d $rep_sup ] && rm -rf $rep_sup 
			;;
		4) echo "Affichage des permissions du répertoires :"
       ls
			 echo "Veuillez indiquer quel répertoires :"
			 read rep_perm
			 [ -d $rep_perm ] && stat -c '%a %n' $rep_perm 
			;;
		5) echo "Changement des permissions du répertoire : "
		   ls -l
			 echo "Veuillez indiquer quel répertoires :"
			 read rep_perm
			 echo "Veuillez indiquer  les permission en octal"
			 read perm
			 [ -d $rep_perm ] && chmod $perm $rep_perm
			 ls -l
			;;
		6) break
			;;
		*) echo "Options inconnu"
			;;
	esac
sleep 3
clear
done

echo "Fin du script" && exit 0
