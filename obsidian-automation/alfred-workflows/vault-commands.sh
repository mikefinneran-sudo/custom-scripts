#!/bin/bash
# Alfred Workflow: Vault Commands
# Keyword: obs

source ~/.zshrc

VAULT="/Users/username/Documents/ObsidianVault"

case "{query}" in
    "Open Vault")
        open -a "Obsidian" "$VAULT"
        ;;
    "Daily Note")
        python3 "$VAULT/.scripts/update_daily_note.py"
        DATE=$(date +%Y-%m-%d)
        open "obsidian://open?vault=ObsidianVault&file=Daily/${DATE}.md"
        ;;
    "Dashboard")
        open "obsidian://open?vault=ObsidianVault&file=Dashboard.md"
        ;;
    "Weekly Review")
        "$VAULT/.scripts/create_weekly_review_enhanced.sh"
        ;;
esac
