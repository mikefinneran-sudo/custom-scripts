#!/bin/bash

# Sync Google Drive Documents to iCloud as backup
# This keeps iCloud as a redundant backup of your Google Drive Documents

SOURCE="/Users/username/Library/CloudStorage/GoogleDrive-email@domain.com/My Drive/Documents/"
BACKUP="/Users/username/Library/Mobile Documents/com~apple~CloudDocs/Documents/"

echo "Starting backup from Google Drive to iCloud..."
echo "Source: $SOURCE"
echo "Backup: $BACKUP"

# Sync with rsync (preserves timestamps, only copies changes)
rsync -av --delete "$SOURCE" "$BACKUP"

echo "Backup complete! $(date)"
