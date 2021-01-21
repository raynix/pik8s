#!/bin/bash

set -euo pipefail

BACKUP_NAME="$1"
ASSET_PATH="$2"
GCP_SA="$3"
GCS="$4"

backup_file="/tmp/wordpress-$BACKUP_NAME-$(date +%s).tar.gz"
mysqldump -u $dbuser -h $dbhost -p$dbpass $dbname --opt > mysqldump.sql
tar -czf $backup_file mysqldump.sql $ASSET_PATH

gcloud auth activate-service-account --key-file=$GCP_SA
gsutil cp $backup_file gs://$GCS

rm $backup_file mysqldump.sql
