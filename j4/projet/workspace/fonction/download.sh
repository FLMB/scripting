# Download.sh: script de fonction
function download () {
	
for i in $@; do
	name=$(awk -F'=' '{print $NF}' <<< $i)
	echo "Téléchargement de : $name" | tee -a log/success_dl.log
	youtube-dl -q -o temp/$name $i
done
}
