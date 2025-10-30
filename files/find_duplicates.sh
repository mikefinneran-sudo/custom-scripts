#!/bin/bash

# Find and report duplicate files in Google Drive Documents
DOCS_PATH="/Users/username/Library/CloudStorage/GoogleDrive-email@domain.com/My Drive/Documents"
TEMP_FILE="/tmp/file_hashes.txt"
DUPLICATES_FILE="/tmp/duplicates.txt"

echo "Scanning for duplicate files..."
echo "This may take a few minutes for large directories..."
echo ""

# Clear temp files
> "$TEMP_FILE"
> "$DUPLICATES_FILE"

# Find all files (excluding .DS_Store and hidden files) and compute MD5 hashes
find "$DOCS_PATH" -type f ! -name ".DS_Store" ! -path "*/.*" -print0 2>/dev/null | while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        hash=$(md5 -q "$file" 2>/dev/null)
        if [ -n "$hash" ]; then
            echo "$hash|$file" >> "$TEMP_FILE"
        fi
    fi
done

echo "Files scanned. Analyzing duplicates..."

# Find duplicate hashes
sort "$TEMP_FILE" | awk -F'|' '{
    hash=$1
    file=$2
    if (hash in files) {
        files[hash] = files[hash] "\n" file
        count[hash]++
    } else {
        files[hash] = file
        count[hash] = 1
    }
}
END {
    for (hash in files) {
        if (count[hash] > 1) {
            print "=== DUPLICATE SET (Hash: " hash ") ==="
            print files[hash]
            print ""
        }
    }
}' > "$DUPLICATES_FILE"

# Display results
if [ -s "$DUPLICATES_FILE" ]; then
    cat "$DUPLICATES_FILE"
    echo ""
    echo "Duplicates found! Review them in: $DUPLICATES_FILE"
else
    echo "No duplicate files found!"
fi

# Cleanup
rm -f "$TEMP_FILE"
