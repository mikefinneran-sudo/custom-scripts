#!/bin/bash
# Alfred Workflow: Search Vault (Script Filter)
# Keyword: vs {query}

source ~/.zshrc

VAULT="/Users/username/Documents/ObsidianVault"
QUERY="{query}"

# Find matching notes
results=$(cd "$VAULT" && find . -name "*.md" -type f \
    ! -path "./.git/*" \
    ! -path "./.obsidian/*" \
    ! -path "./.trash/*" \
    ! -path "./Archive/*" \
    | grep -i "$QUERY" \
    | head -20)

# Build JSON output
echo '{"items":['

first=true
while IFS= read -r file; do
    if [ ! -z "$file" ]; then
        # Clean up path
        clean_path="${file#./}"
        title=$(basename "$file" .md)
        subtitle="$clean_path"

        # Get first line of content for preview
        preview=$(head -n 5 "$VAULT/$clean_path" | grep -v "^#" | grep -v "^-" | grep -v "^\*\*" | head -n 1)

        if [ "$first" = true ]; then
            first=false
        else
            echo ","
        fi

        cat << EOF
{
  "uid": "$clean_path",
  "title": "$title",
  "subtitle": "$subtitle",
  "arg": "$clean_path",
  "icon": {"path": "/Applications/Obsidian.app"}
}
EOF
    fi
done <<< "$results"

echo ']}'
