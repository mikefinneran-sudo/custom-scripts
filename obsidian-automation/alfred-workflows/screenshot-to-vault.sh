#!/bin/bash
# Alfred Workflow: Screenshot to Vault
# Keyword: vss
# Hotkey: ⌃⌥⌘S

DATE=$(date +%Y-%m-%d_%H-%M-%S)
SCREENSHOT_DIR="$HOME/Documents/ObsidianVault/Resources/Screenshots"

mkdir -p "$SCREENSHOT_DIR"

# Trigger CleanShot X area capture
open "cleanshot://capture-area?filepath=${SCREENSHOT_DIR}/screenshot-${DATE}.png"

# Show notification
osascript -e 'display notification "Screenshot will be saved to vault" with title "CleanShot X → Vault"'

echo "Screenshot: screenshot-${DATE}.png"
