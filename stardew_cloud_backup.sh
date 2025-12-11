#!/bin/bash

# =================CONFIGURATION =================
# 1. Source Directory: Default Linux location for Stardew Valley Saves
# Note: If you use the Flatpak version, this path might be different.
SOURCE_DIR="$HOME/.config/StardewValley/Saves"

# 2. Backup Directory: Where you want your safe copies stored
BACKUP_DIR="$HOME/Documents/stardew_backups"

# 3. How many backups to keep?
MAX_BACKUPS=5
# ================================================

# --- Step 1: Safety Checks ---
# Check if the save folder actually exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Save folder not found at $SOURCE_DIR"
    echo "Are you using the Steam Flatpak or a custom install?"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# --- Step 2: Create the Backup ---
# Get current date and time for a unique folder name (e.g., backup_2023-10-27_1430)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
NEW_BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

echo "Backing up saves to: $NEW_BACKUP_PATH"
cp -r "$SOURCE_DIR" "$NEW_BACKUP_PATH"

# Verify the copy succeeded before deleting anything
if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Error: Backup failed. No old files will be deleted."
    exit 1
fi

# --- Step 3: Rotate Backups (Delete Oldest) ---
# List backups by time (oldest last), skip the first $MAX_BACKUPS, and delete the rest
cd "$BACKUP_DIR" || exit

# Count how many backups exist
COUNT=$(ls -1d backup_* 2>/dev/null | wc -l)

if [ "$COUNT" -gt "$MAX_BACKUPS" ]; then
    echo "Cleaning up old backups..."
    # ls -t sorts by time (newest first).
    # tail -n +$((MAX_BACKUPS + 1)) skips the newest 5 and lists the older ones
    ls -dt backup_* | tail -n +$((MAX_BACKUPS + 1)) | xargs -I {} rm -rf "{}"
    echo "Deleted old backups. Keeping the latest $MAX_BACKUPS."
else
    echo "Total backups: $COUNT (Limit is $MAX_BACKUPS). No deletion needed."
fi

echo "All done."
