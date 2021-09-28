#!/bin/sh
DEST=${DEST:-/sideloader}
EXECUTABLE=${EXECUTABLE:-yes}
set -xe

until [ -z ${1+x} ] || [ -z ${2+x} ]; do
    curl -fSL --create-dirs -o $DEST/$1 $2
    shift 2
done
if [ "$EXECUTABLE" = "yes" ]; then
    chmod +x $DEST/*
fi

ls -lht $DEST

