# Info.sh: Script de fonction
function infos () {

videos=$(wc -l log/success_dl.log | awk '{print $1}')
archives=$(find archivage -type f | wc -l)
du_projet=$(du -hs . | awk '{print $1}')
du_video=$(du -hs archivage | awk '{print $1}')
du_backup=$(du -hs sauvegarde | awk '{print $1}')

cat<<EOF
Recapitulatif du workspace:
- ${videos} téléchargées
- ${archives} archivages de video
- Espace disque utilise pour le projet : ${du_projet} 
- Espace dique utilise pour les videos : ${du_video}
- Espace disque utilise pour la sauvegarde : ${du_backup} 
EOF
}
