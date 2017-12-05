#!/bin/bash

# Définition d'un nombre fixe à trouver
nombre=33

while true; do
	echo 'Quel est votre nombre ?'
	# On lit l'entre clavier
	read reponse

	# On test si nombre inférieur à réponse
	if [ $nombre -lt $reponse ]; then
		echo "Votre nombre est plus grand"
	# On test si nombre supérieur à réponse
	elif [ $nombre -gt $reponse ]; then
		echo "Votre nombre est plus petit"
	# On test si nombre egale à réponse
	elif [ $nombre -eq $reponse ]; then
		echo "C'est le bon nombre"
		# On quitte le while
		break
	fi
done

# On termine le script par un code retour 0 -> Tous est ok
exit 0
