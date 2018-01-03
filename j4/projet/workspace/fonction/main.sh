# Main.sh: fichier de fonctions
function header {
clear
cat<<EOF
#############################################
### Script de téléchargement/archivage et ###
### sauvegarde de videos youtube          ###
#############################################
### 1) Téléchargement de videos           ###
### 2) Archivage de videos                ###
### 3) Sauvegarde de videos               ###
### 4) Récapitulatif du projet            ###
### 5) Quitter (exit,q)                   ###
#############################################
Votre choix:
EOF
}


function select_menu () {
case $1 in
  1)
    echo "Téléchargement des vidéos depuis : ./workspace/list.txt dans 10s"
    sleep 10
    source fonction/download.sh
    download $(cat list.txt)
    ;;
  2)
    source fonction/classify.sh
    classify $(ls temp)
    sleep 3
    ;;
  3)
    source fonction/backup.sh
    backup
    sleep 3
    ;;
  4)
    source fonction/infos.sh
    infos
    sleep 3
    ;;
  5|q|exit)
    break
    ;;
  *)
    echo "Option inconnu, choisissez : 1, 2, 3, 4 ou 5"
    sleep 5
    ;;
esac
}

