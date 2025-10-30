#!/bin/bash
# Alfred Workflow: Quick Note Creation
# Keyword: note {query}
# Hotkey: ⌃⌥⌘N

source ~/.zshrc

VAULT="/Users/username/Documents/ObsidianVault"
TITLE="{query}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
FILENAME="${TITLE// /-}.md"

# Create note in Inbox
NOTE_PATH="${VAULT}/Inbox/${FILENAME}"

cat > "$NOTE_PATH" << EOF
# ${TITLE}

**Created:** ${DATE} ${TIME}

## Notes



## Links
- [[Dashboard]]

---
Tags: #inbox

EOF

# Open in Obsidian
open "obsidian://open?vault=ObsidianVault&file=Inbox/${FILENAME}"

echo "Created: ${FILENAME}"
