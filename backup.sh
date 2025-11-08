#!/bin/bash
# ----------------------------------------
# Script Name: backup.sh
# Purpose: Backup a specific file with timestamp
# Author: Farhan
# Date: $(date)
# ----------------------------------------

# Define source file and backup destination
source_file="/home/farhan7860/photo2/myphoto.png"
backup_dir="/home/farhan7860/backup_photo"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Create a timestamp (e.g., 20251108_103045)
timestamp=$(date +%Y%m%d_%H%M%S)

# Define backup file name
backup_file="$backup_dir/myphoto_backup_$timestamp.png"

# Copy the file
cp "$source_file" "$backup_file"

# Display confirmation
echo "✅ Backup successful!"
echo "Original file: $source_file"
echo "Backup saved at: $backup_file"
