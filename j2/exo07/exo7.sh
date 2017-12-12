#!/bin/bash
# Florian Leparoux 
# Exo07 : Objectif : Récupération d'argument par entrée clavier bouclage de script
# Solution

# Création du répertoire de travail
mkdir -p ./tmp/$(basename $0)

# Déplacement dans le répertoire de travail 
cd ./tmp/$(basename $0)

# Vérrouillage du script
if [ -z ".lock" -o ! -f  ".lock" ]; then
	echo $$ > .lock
else
	echo "Une instance du script est déjà en cours d'execution"
	exit 1
fi

# Vérification de l'argument
if [[ $# != 1 && $1 != 0 ]]; then
	echo "Soucis au niveau de l'argument"
	exit 1
fi

# On réexecute le process de création autant de fois que l'argument l'indique
for nb in `seq 1 $1`; do
	echo "Processus de création d'utilisateur $nb"
	read -p "Merci de fournir le Nom de l'utilisateur : " nom
	read -p "Merci de fournir le Prénom de l'utilisateur : " prenom
	# Si argument faut on rebloucle la question
	while true; do
		read -p "Merci de précision le shell [bash, zsh, sh] :" shell
		[ $shell == "bash" -o $shell == "sh" -o $shell == "zsh" ] && break || echo "Mauvais shell"
	done
	while true; do
		read -p "Devons nous initialiser le mot de passe ? [O/N] ": mdp
		[ $mdp == "O" -o $mdp == "N" ] && break || echo "Mauvaise réponse"
	done
	
	# Création du répertoire
	mkdir -p "$nom.$prenom"

	# On  verifie l'initialisation
	if [ $mdp == "O" ]; then
# On stock les infos dans un fichiers
cat<<MSG >> $nom.$prenom/info
Nom: ${nom}
Prenom: $prenom
Shell: ${shell}
MSG

# Le mot de passe trop secure 
echo "LEm07d3P@55e" > $nom.$prenom/.mdp

	else
		# Message d'erreur car N donc pas d'initialisation
		echo "Pas d'initialisation"
	fi

# Affichage du répertoire en arbo
tree $nom.$prenom
done

# On déverrouille le script
find . -type f -name ".lock" -delete

# On quitte le script
echo "Fin du script" && exit 0
