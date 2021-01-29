#!/bin/bash

set -euo pipefail

BACKUP_NAME="$1"
GCP_SA="$2"
GCS="$3"

backup_file="/tmp/mastodon-$BACKUP_NAME-$(date +%s).tar.gz"
pgdump_file=/tmp/pgdump.sql

PG_PASSWORD=$DB_PASS pg_dump -h $DB_HOST -U $DB_USER -p $DB_PORT $DB_NAME > $pgdump_file
tar -czf $backup_file $pgdump_file

gcloud auth activate-service-account --key-file=$GCP_SA
gsutil -o "GSUtil:state_dir=/tmp/state_dir" cp $backup_file gs://$GCS

rm $backup_file $pgdump_file
