#!/bin/bash

set -euo pipefail

BACKUP_NAME="$1"
ASSET_PATH="$2"
GCP_SA="$3"
GCS="$4"

backup_file="/tmp/wordpress-$BACKUP_NAME-$(date +%s).tar.gz"
mysqldump_file=/tmp/mysqldump.sql

mysqldump -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME --opt > $mysqldump_file
tar -czf $backup_file $mysqldump_file $ASSET_PATH

gcloud auth activate-service-account --key-file=$GCP_SA
gsutil -o "GSUtil:state_dir=/tmp/state_dir" cp $backup_file gs://$GCS

rm $backup_file $mysqldump_file
