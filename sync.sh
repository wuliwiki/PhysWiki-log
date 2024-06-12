#!/bin/bash

# usage:
#     sudo nohup ./sync.sh >> sync.log &

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

SOURCE="../PhysWiki/contents/"
DESTINATION="contents/"

sync_files() {
    rsync -av --include '*.tex' --delete "$SOURCE" "$DESTINATION"
}

while true; do
    date
    echo -----------------------------------
    sync_files
    git add contents && git commit -m 1 && git push
    printf "sleeping...\n\n\n"
    sleep 24h
done
