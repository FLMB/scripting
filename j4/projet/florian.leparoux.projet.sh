#!/bin/bash
# florian.leparoux
# 12/12/17
# Script principale de recuperation/archivage et sauvegarde de video youtube

# Creation de l'environnement : workspace
mkdir -p workspace/{log,fonction,archivage,sauvegarde,temp}
mkdir -p workspace/archivage/{{A..Z},{0..9}}

# Deplacement dans le workspace
cd workspace

# Initialisation des logs erreurs
error_log="log/errors_cmd.log"
exec 2> $error_log
# Test des logs d'erreur
#eho "test"


# Appel des fonctions
source ./fonction/main.sh 

if [ $# == 0 ]; then
	while true; do
		# Affichage de header du script
		header
		# Lecture de la réponse et appel des actions
		read choice
		select_menu $choice
	done
else
	source fonction/download.sh
  download $@
	source fonction/classify.sh
	classify $(ls temp)
	source fonction/backup.sh   
	backup
	source fonction/infos.sh
  infos
fi

exit 0
