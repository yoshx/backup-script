EXEC_PATH=$(dirname $0)
. $EXEC_PATH/save.cfg

echo "Sauvegarde de la liste des paquets" | tee -a $LOG
dpkg --get-selections > $BACKUP_DIR/liste_paquets | tee -a $LOG

#divers copie des scripts
cp $FILES/save $FILES/*.lst $FILES/*.sh $FILES/save.cfg $FILES/save.txt /home/ydu/Spideroak/
chown ydu: /home/ydu/Spideroak/save /home/ydu/Spideroak/*.lst /home/ydu/Spideroak/*.sh /home/ydu/Spideroak/save.cfg 

echo "Sauvegarde de la conf de backup" | tee -a $LOG
cd $FILES
tar -cvf $BACKUP_DIR/save.tar save save.cfg include_files.lst exclude_files.lst pre_backup.sh post_backup.sh

echo "Sauvegarde des scripts de check" | tee -a $LOG
tar -cvf $BACKUP_DIR/checks_scripts.tar check*

echo "Envoi des scripts vers Spideroak" | tee -a $LOG
cp $BACKUP_DIR/*.tar /home/ydu/Spideroak/
