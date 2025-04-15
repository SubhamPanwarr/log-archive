#!/bin/bash

# Check if user gave a folder
if [ -z "$1" ]; then
  echo "❌ Please provide a log folder to archive."
  echo "Usage: ./log-archive.sh ~/mylogs"
  exit 1
fi

# Save the folder path
LOG_FOLDER="$1"

# Check if it exists
if [ ! -d "$LOG_FOLDER" ]; then
  echo "❌ The folder '$LOG_FOLDER' does not exist."
  exit 1
fi

# Make a folder to store the archive
mkdir -p ~/log_archives

# Create a name with current date and time
TIME=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="logs_archive_$TIME.tar.gz"

# Create the archive
tar -czf ~/log_archives/$ARCHIVE_NAME -C "$LOG_FOLDER" .

# Write a log entry
echo "[$(date)] Archived $LOG_FOLDER to ~/log_archives/$ARCHIVE_NAME" >> ~/log_archives/archive.log

echo "✅ Done! Your logs are saved as $ARCHIVE_NAME"

