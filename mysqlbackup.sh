#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`

DB_BACKUP_PATH='/home/backup/dbbackup'
MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USER="root"
MYSQL_PASSWORD="12345"
MYSQL_DB="testdb"

mkdir -p ${DB_BACKUP_PATH}/${TODAY}
echo "Backup started succesfully - ${MYSQL_DB}"

mysqldump -h $MYSQL_HOST \
    -P $MYSQL_PORT \
    -u $MYSQL_USER \
    -p$MYSQL_PASSWORD \
    $MYSQL_DB > ${DB_BACKUP_PATH}/${TODAY}/${MYSQL_DB}-${TODAY}.sql

if [ $? -eq 0 ] then 
    echo "Database backup succesfull"
else
    echo "Error occured during Database Backup"
    exit 1
fi