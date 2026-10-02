#!/bin/bash
set -e

SRC_DIR="$HOME/ict_lab2/docs"
BACKUP_DIR="$HOME/ict_lab2/backup"
LOG_FILE="$HOME/ict_lab2/logs/backup.log"
DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="docs_backup_$DATE.tar.gz"

if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory $SRC_DIR does not exist." >> "$LOG_FILE"
    exit 1
fi

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$HOME/ict_lab2" docs/
echo "[$DATE] Backup created: $ARCHIVE_NAME" >> "$LOG_FILE"
find "$BACKUP_DIR" -type f -name "docs_backup_*.tar.gz" -mtime +7 -exec rm {} \;
