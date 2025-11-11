#!/bin/bash
# Script Name: backup.sh
# Purpose: Backup a specific file with timestamp
# Author: Farhan
# Date: $(date)

source_file="/home/farhan7860/photo2/myphoto.png"
backup_dir="/home/farhan7860/backup_photo"

mkdir -p "$backup_dir"

timestamp=$(date +%Y%m%d_%H%M%S)

backup_file="$backup_dir/myphoto_backup_$timestamp.png"

cp "$source_file" "$backup_file"

echo "Backup successful!"
echo "Original file: $source_file"
echo "Backup saved at: $backup_file"
