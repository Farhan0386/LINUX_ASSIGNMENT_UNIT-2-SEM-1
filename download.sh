#!/bin/bash
# Script Name: download.sh
# Purpose: Download GitHub repositorie 
# Author: Farhan hussain
# Date: 10-11-2025

REPO1="https://github.com/Farhan0386/KRMU_PYTHON_ASSIGNEMENT_SEM_1" 

DEST_DIR="/home/farhan7860/Downloads/github_repos" 
mkdir -p "$DEST_DIR"

echo "Starting download of repositories..."
cd "$DEST_DIR"
wget -O repo1.zip "$REPO1/archive/refs/heads/main.zip"


echo "downloads complete!"
