#!/bin/bash
set -euo pipefail

WORK_DIR="$1"

cd $WORK_DIR
find . -mtime -1 \( -iname \*.jpg -o -iname \*.jpeg \) |while read jpeg; do
  exiftool -all= $jpeg || echo error processing $jpeg file!
  touch -d '1 day ago' $jpeg
done
