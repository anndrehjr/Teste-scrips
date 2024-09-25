#!/bin/bash

# Diretórios que deseja fazer backup
ASTERISK_DIR="/etc/asterisk"
RECORDINGS_DIR="/var/spool/asterisk/monitor"
BACKUP_DIR="/backup/asterisk"  # Diretório de destino do backup
DATE=$(date +"%Y-%m-%d")

# Criar o diretório de backup, se não existir
mkdir -p $BACKUP_DIR

# Realizar o backup dos arquivos de configuração e gravações
tar -czf $BACKUP_DIR/asterisk_config_backup_$DATE.tar.gz $ASTERISK_DIR
tar -czf $BACKUP_DIR/asterisk_recordings_backup_$DATE.tar.gz $RECORDINGS_DIR

# Se você usa banco de dados MySQL ou MariaDB para o CDR (Call Detail Records)
# Faça o backup do banco de dados (se aplicável)
DB_USER: asteriskuser
DB_PASSWORD: andrejr
DB_NAME: asteriskcdrdb

mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/asterisk_db_backup_$DATE.sql

# Mensagem de sucesso
echo "Backup realizado com sucesso para $BACKUP_DIR em $DATE"
