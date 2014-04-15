directorio="/zafiro"
directoriorrds="/etc/rrds"
#fecha=$(date +%Y%m%d%H%M)
fecha=$(date +%Y%m%d)
mkdir $directorio/backups/$fecha
mysqldump --databases zafiro > $directorio/backups/$fecha/$fecha-backupdb.bak
cp $directoriorrds/* $directorio/backups/$fecha
