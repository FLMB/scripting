#!/bin/bash
# Florian Leparoux 
# Exo08 : Objectif : Plus ou moins 
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# Vérrouillage du script
exec 200>.lock
trap 'rm -f .lock'
flock -n 200   || exit 1
echo $$ 1>&200

# On verifie que l'utilisateur qui lance le script n'est pas root
# Plusieurs solutions possibles
# if [ $(whoami) != "root" ]; then : ; fi
# [ $(whoami) != "root" ] || { echo "Root non autorisé" ; exit 1 ; }

if [ $UID == 0 ]; then
	echo "Vous ne devez pas executer le script en root"
	exit 1
fi

# On définit un nombre entre 1 et 50
random_magic=$(shuf -i1-50 -n1)

declare -a historique

for try in {1..10};  do
	echo "Trouver le nombre, essai numero $try"
	while true; do
		read -p "Quel est votre nombre ? : " nombre
		re='^[0-9]+$'
		if ! [[ $nombre =~ $re ]] ; then
  		 echo "Ce n'est pas un nombre : $nombre"
		else
			break
		fi
	done
	if [ $nombre -eq $random_magic ]; then
		echo "Vous avez trouver le bon nombre"
		historique+=($nombre)
		break
	elif [ $nombre -lt $random_magic ]; then
		echo "Votre nombre est plus petit"
	else
		echo "Votre nombre  est plus grand"
	fi
	historique+=($nombre)
done

echo "Voici les nombre utilisés : ${historique[@]}"

# On déverrouille le script
flock -u 200
rm -f .lock

# On quitte le script
echo "Fin du script" && exit 0
