#!/bin/bash

#Simple Backup Script

#Backup sources 
HOME_DIRS=(
    ${HOME}/Documents
    ${HOME}/Pictures
    ${HOME}/Games
    ${HOME}/Micellaneous
    ${HOME}/Music
)

KDE_DIRS=(
    ${HOME}/.config
    ${HOME}/.local
)

MINECRAFT_DIR=${HOME}\/.var/app/com.modrinth.ModrinthApp/data/ModrinthApp/profiles/

#Create backup directories
BACKUP_DIR="/mnt/Backups/$(date -I)"
HOME_BACKUP="$BACKUP_DIR/Home folders"
KDE_BACKUP="$BACKUP_DIR/KDE folders"
MINECRAFT_BACKUP="$BACKUP_DIR/Minecraft"

mkdir -p "$BACKUP_DIR"
echo "Backup directory at $BACKUP_DIR" 

mkdir -p "$HOME_BACKUP"
echo "Home backup directory at $HOME_BACKUP"

mkdir -p "$KDE_BACKUP"
echo "KDE backup directory at $KDE_BACKUP"

mkdir -p "$MINECRAFT_BACKUP"
echo "Minecraft backup directory at $MINECRAFT_BACKUP"


#Copy home directories to backup
for dir in "${HOME_DIRS[@]}"; do
    echo "Copying $dir to $HOME_BACKUP"
    cp -a $dir "$HOME_BACKUP"
done


#Copy KDE directories to backup
for dir in "${KDE_DIRS[@]}"; do
    echo "Copying $dir to $KDE_BACKUP/KDE/"
    cp -a $dir "$KDE_BACKUP"
done

#Copy Minecraft directory to backup
echo "Copying Minecraft directory to $MINECRAFT_BACKUP"
cp -a "$MINECRAFT_DIR" "$MINECRAFT_BACKUP"

echo "Backup completed successfully!"
exit 0