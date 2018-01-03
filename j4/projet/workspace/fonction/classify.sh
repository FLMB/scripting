# Classify.sh: fichier de fonction
function classify () {
for j in $@; do
	# first string
	first=${j:0:1}
	dst=${first^^}
	echo "Déplacement de $j vers $dst"
	mv -v temp/$j archivage/$dst/$j
done
}

