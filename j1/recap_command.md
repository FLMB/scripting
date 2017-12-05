# Scripting - Ynov
#### Florian Leparoux - 05/12/17 Récap de commandes

---
*Se connecter en root*
`su` ou `su -` ou `sudo -s`

---
*Lister un répertoire*
`ls`

*Lister un répertoire en récursif*
`ls -R`

*Lister des fichiers caché*
`ls -a`

*Lister les fichiers avec les détails (Permission, type, poids, propriétaire, groups,...)*
`ls -l`

*Lister les fichiers commencant par fi*
`ls fi*`

*Lister les fichiers commenant par file1.log file2.log ... et finissant **pas** par .log*
`ls file?!(.log)`

*Lister les fichiers commencant par un caractère puis file.log*
`ls ?file.log`

---
*Changer de répertoire*
`cd /path`

*Revenir dans le home de l'utilisateur courant*
`cd` ou `cd ~`

*Afficher le répertoire courant*
`pwd`

---
*Afficher le contenu d'un fichier*
```
cat file
view file
vi file
nano file
more file
less file
```

---
*Copier un fichier*
`cp file filenew`

*Déplacer un fichier*
`mv file filenew`

---
*Créer un fichier*
`touch file`

*Créer un répertoire*
`mkdir dir1`

*Créer un répertoire imbriqué et inexistant*
`mkdir -p dir1/dir2`

---
*Supprimer un fichier*
`rm file`

*Supprimer un dossier*
`rmdir dir` ou `rm -r dir`

---
*Insérer un contenu dans un fichier*
`echo "Some text" > file` ou
```
cat <<EOF
Some text
More text
EOF
```

---
*Compresser un fichier*
```
tar cf archive.tar.gz file
tar cfJ archive.tar.xz file
tar cfj archive.tar.bz2 file
```

*Lister les fichiers d'une archive*
```
tar tvf archive.tar.gz
tar tvf archive.tar.xz
tar tvf archive.tar.bz2
```

*Decompresser une archive*
`tar xf archive.tar.*`

---
*Executer 2 commandes sur une ligne*
`echo "Commande 1" ; echo "Commande 2"`

*Executer une 2eme commande si la première est valide
`echo "Commande 1" && echo Commande 2`

*Recuperer le code retour d'une erreur*
```
cat file1 >/dev/null 2>&1
echo $? (Code retour : 0 ok, 1 nok)
```

---
*Chercher une occurence dans plusieurs fichiers*
`grep -r 'occurence' ./*`

*Chercher une occurence dans plusieurs fichiers insensible à la casse*
`grep -ri 'occurence' file1 file2`

*Chercher une occurence dans plusieurs fichiers insensble à la casse et avec numéro de ligne*
`grep -rin 'occurence' file1 file2`

---
*Rediriger sortie normale vers rien*
`echo "ok" > /dev/null 2>&1`

*Rediriger sortie d'erreur  vers un fichier*
`Commande_fausse 2> fichier_erreur`

*Rediriger sortie normale vers fichier*
`echo "ok" 1> fichier_output`

---
*Afficher la dernière ligne d'un fichier*
`tail -1 file`

*Afficher la premier ligne d'un fichier*
`head -1 file`

*Compter le nombres de lignes*
`wc -l file` ou
`cat file |  wc -l`

---
*Afficher les disques et partitions
`lsblk`

*Lister les disques*
`fdisk -l`

*Lister les interfaces réseaux*
`ifconfig` ou `ip address` ou `ip a`

*Lister les routes*
`route -n` ou `ip route` ou `ip r`

*Lister les périphériques usb`
`lsusb`

*Lister les périphériques pci*
`lspci`

*Afficher les informations sur la matériels*
`lshw` ou `lshw -sort`

*Afficher les processus*
`ps -aux`

*Afficher les processus d'un service*
`ps -aux | grep service`

*Afficher l'espaces disques des partitions*
`df -h`

*Afficher les inodes des partitions*
`df -i`

*Afficher la taille d'un répertoire*
`du -hs /path`

*Afficher les tailles des fichiers/répertoires d'un répertoire*
`du -hsx /path/*` -> du -hsx /var/log/*

---
*Affecter une variable*
`variable=xxx`

*Affecter un tableau*
`array=(yyy)`

*Dé-initialiser une variable*
`unset variable`

---
*Afficher les utilisateurs*
`getent passwd` ou `cat /etc/passwd`

*Filtrer sur un utilisateur*
`getent passwd user` ou `grep -ri user /etc/passwd`

*Afficher les groupes*
`getent group` ou `cat /etc/group`

*Ajouter un utilisateur*
`useradd user`

*Modifier un utilisateur*
`usermod -G groups user`

*Supprimer un utilisateur*
`userdel` (-r pour supprimer le home)

*Ajouter un groupe*
`groupadd newgroup`

*Supprimer un groupe*
`groupdel groupe`

---

Syntaxe conditions/boucles

```
if [ statement ]; then
  command
elif [ statement ]; then
  command
else
  command
fi
```

```
for value in $array; do
  command
done
```

```
while statement; do
  command
done
```

```
case $value in
  choice1)
    command
  ;;
  choice1)
    command
  ;;
  *) <- tous les autres choix
    exit 0
  ;;
esac
```

*Lire une entrée clavier*
```
echo "Quel est votre question?"
read reponse

echo "Votre réponse est : $réponse"
```
