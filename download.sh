#!/bin/bash
# ----------------------------------------
# Script Name: download.sh
# Purpose: Download two GitHub repositories as ZIP files
# Author: Farhan
# Date: $(date)
# ----------------------------------------

# Repositories to download
REPO1="https://github.com/Farhan0386/Lab-Assignment-KRMU-Web-Dev-1"
REPO2="https://github.com/Farhan0386/PYTHON-BASICS-CWH"

# Destination directory
DEST_DIR="/home/$(whoami)/Downloads/github_repos"
mkdir -p "$DEST_DIR"

echo "Starting download of repositories..."
cd "$DEST_DIR"

# Function to download a repo
download_repo() {
    local REPO_URL="$1"
    local ZIP_URL="${REPO_URL}/archive/refs/heads/main.zip"
    local REPO_NAME=$(basename "$REPO_URL")

    echo "Downloading $REPO_NAME ..."
    wget -q -O "${REPO_NAME}.zip" "$ZIP_URL"

    if [ $? -eq 0 ]; then
        echo "✅ Successfully downloaded: ${REPO_NAME}.zip"
    else
        echo "❌ Failed to download $REPO_NAME"
    fi
}

# Download both repos
download_repo "$REPO1"
download_repo "$REPO2"

echo "All downloads complete!"
echo "Files saved in: $DEST_DIR"
