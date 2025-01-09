#!/bin/bash

# Source directory (bulky folder)
SOURCE_DIR="/path/to/bulky/folder"

# Destination base directory
DEST_BASE_DIR="/path/to/destination/folder"

# Create destination base directory if it doesn't exist
mkdir -p "$DEST_BASE_DIR"

# Loop through all files in the source directory
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        # Get the creation date of the file
        creation_date=$(stat -f "%SB" -t "%Y-%m-%d" "$file")
        
        # Create the destination directory based on the creation date
        DEST_DIR="$DEST_BASE_DIR/$creation_date"
        mkdir -p "$DEST_DIR"
        
        # Move the file to the destination directory
        mv "$file" "$DEST_DIR"
    fi
done

echo "Files have been moved to their respective creation date folders."