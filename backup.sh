#!/usr/bin/env sh
# vim:syntax=sh
# vim:filetype=sh

BACKUP=${SCRIPTS}/backup

backup.home() {
    local mountnasshare="echo; echo 'Mount the NAS share'; ${BACKUP}/nas-share-mount;"
    local nashomebackup="echo; echo 'Backing up HOME to NAS'; ${BACKUP}/Backup-home-nas;"
    local unmountnasshare="echo; echo 'Unmount the NAS share'; ${BACKUP}/nas-share-unmount;"
    sh -c $mountnasshare$nashomebackup$unmountnasshare
}

backup.books(){
    source ${BACKUP}/nas-books.sh
    mount_book_nas && upload_book && unmount_book_nas
}

restore.books(){
    source ${BACKUP}/nas-books.sh
    mount_book_nas && download_book && unmount_book_nas
}

