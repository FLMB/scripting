# Backup.sh: fichier de fonction
function backup {
	echo "Sauvegarde en cours"
	tar czf sauvegarde/$(date +%d-%m-%Y_%H-%M-%S).tar.gz archivage
	echo "Sauvegarde fini"
}

