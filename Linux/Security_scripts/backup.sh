#! /bin/bash

tar fc /var/backups/home.tar /home
mv /var/backups/home.tar /var/backups/home.'date--iso-8601'.tar
ls -lay /var/backups >> /var/backups/file_report.txt
echo date--iso-8601 >> /var/backups/file_report.txt
free -h >> /var/backup/disk_report.txt

