# Alfred Workflows for ObsidianVault

Pre-configured Alfred workflows for seamless vault integration with 1Password and CleanShot X.

## Quick Setup

1. Open Alfred Preferences (⌘,)
2. Go to **Workflows** tab
3. Click **+** → **Import Workflow**
4. Navigate to `.integrations/alfred/workflows/`
5. Import each `.alfredworkflow` file

## Available Workflows

### 1. Vault Commands (obs)
Quick access to common vault operations.

**Keywords:**
- `obs` - Show all vault commands
- `obs open` - Open vault in Obsidian
- `obs daily` - Create/update today's daily note
- `obs dashboard` - Open dashboard
- `obs weekly` - Create weekly review

**Hotkeys:**
- `⌃⌥⌘O` - Open vault
- `⌃⌥⌘D` - Open today's daily note

---

### 2. Screenshot to Vault (vss)
Capture screenshots directly to vault folders.

**Keywords:**
- `vss` - Capture to Resources/Screenshots/
- `vss daily` - Capture to Daily/attachments/
- `vss project [name]` - Capture to specific project folder

**Hotkey:**
- `⌃⌥⌘S` - Quick screenshot to vault

---

### 3. 1Password API Keys (api)
Retrieve and copy API keys from 1Password.

**Keywords:**
- `api` - List all stored APIs
- `api anthropic` - Copy Anthropic API key
- `api perplexity` - Copy Perplexity API key
- `api github` - Copy GitHub token

**Features:**
- Auto-copies to clipboard
- Uses Touch ID authentication
- No plaintext storage

---

### 4. Quick Note (note)
Create new notes in vault quickly.

**Keywords:**
- `note [title]` - Create new note in Inbox/
- `note project [title]` - Create in current project
- `note daily` - Quick daily note entry

**Hotkey:**
- `⌃⌥⌘N` - Quick note creation

---

### 5. Search Vault (vs)
Fuzzy search across all vault notes.

**Keywords:**
- `vs [query]` - Search note titles and content
- `vs tag:[tag]` - Search by tag
- `vs project:[name]` - Search within project

**Features:**
- Real-time fuzzy matching
- Preview in Alfred
- Quick open in Obsidian

---

## Manual Setup Instructions

If you prefer to create workflows manually, follow these instructions:

### Workflow 1: Vault Commands

1. Create new workflow: **ObsidianVault Commands**
2. Add **Keyword** input: `obs`
3. Add **List Filter** with items:
   - Open Vault
   - Daily Note
   - Dashboard
   - Weekly Review
4. Connect to **Run Script** (bash):

```bash
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
```

5. Add **Hotkey** trigger: `⌃⌥⌘O` → Connect to "Open Vault" action

---

### Workflow 2: Screenshot to Vault

1. Create new workflow: **Vault Screenshot**
2. Add **Keyword** input: `vss`
3. Add **Run Script** (bash):

```bash
DATE=$(date +%Y-%m-%d_%H-%M-%S)
SCREENSHOT_DIR="$HOME/Documents/ObsidianVault/Resources/Screenshots"

mkdir -p "$SCREENSHOT_DIR"

# Trigger CleanShot X
open "cleanshot://capture-area?filepath=${SCREENSHOT_DIR}/screenshot-${DATE}.png"

# Show notification
osascript -e 'display notification "Screenshot saved to vault" with title "CleanShot X"'
```

4. Add **Hotkey** trigger: `⌃⌥⌘S`

---

### Workflow 3: 1Password API Keys

1. Create new workflow: **Get API Keys**
2. Add **Keyword** input: `api {query}`
3. Add **Script Filter** (bash):

```bash
source ~/.zshrc

# Check if 1Password CLI is available
if ! command -v op &> /dev/null; then
    echo '{"items":[{"title":"1Password CLI not installed","subtitle":"Install: brew install --cask 1password-cli","valid":false}]}'
    exit 0
fi

QUERY="{query}"

cat << EOF
{
  "items": [
    {
      "uid": "anthropic",
      "title": "Anthropic API",
      "subtitle": "Copy Anthropic API key to clipboard",
      "arg": "Anthropic API",
      "autocomplete": "anthropic",
      "icon": {"path": "/Applications/1Password.app"}
    },
    {
      "uid": "perplexity",
      "title": "Perplexity API",
      "subtitle": "Copy Perplexity API key to clipboard",
      "arg": "Perplexity API",
      "autocomplete": "perplexity",
      "icon": {"path": "/Applications/1Password.app"}
    },
    {
      "uid": "github",
      "title": "GitHub Token",
      "subtitle": "Copy GitHub personal access token",
      "arg": "GitHub Token",
      "autocomplete": "github",
      "icon": {"path": "/Applications/1Password.app"}
    },
    {
      "uid": "openai",
      "title": "OpenAI API",
      "subtitle": "Copy OpenAI API key to clipboard",
      "arg": "OpenAI API",
      "autocomplete": "openai",
      "icon": {"path": "/Applications/1Password.app"}
    }
  ]
}
EOF
```

4. Add **Run Script** (bash) after Script Filter:

```bash
source ~/.zshrc

ITEM_NAME="{query}"

# Get API key from 1Password
API_KEY=$(op read "op://Private/${ITEM_NAME}/credential" 2>/dev/null)

if [ $? -eq 0 ]; then
    echo -n "$API_KEY" | pbcopy
    echo "✓ Copied ${ITEM_NAME} to clipboard"
else
    echo "✗ Error: Could not retrieve ${ITEM_NAME}"
    exit 1
fi
```

5. Add **Post Notification**:
   - Title: `{query}`
   - Text: `Copied to clipboard`

---

### Workflow 4: Quick Note

1. Create new workflow: **Quick Vault Note**
2. Add **Keyword** input: `note {query}`
3. Add **Run Script** (bash):

```bash
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
```

4. Add **Hotkey** trigger: `⌃⌥⌘N`

---

### Workflow 5: Search Vault

1. Create new workflow: **Search Vault**
2. Add **Keyword** input: `vs {query}`
3. Add **Script Filter** (bash):

```bash
source ~/.zshrc

VAULT="/Users/username/Documents/ObsidianVault"
QUERY="{query}"

# Find matching notes
results=$(cd "$VAULT" && find . -name "*.md" -type f \
    ! -path "./.git/*" \
    ! -path "./.obsidian/*" \
    ! -path "./.trash/*" \
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
```

4. Add **Run Script** (bash) after Script Filter:

```bash
FILE_PATH="{query}"
open "obsidian://open?vault=ObsidianVault&file=${FILE_PATH}"
```

---

## Keyboard Shortcuts Summary

| Shortcut | Action |
|----------|--------|
| `⌃⌥⌘O` | Open vault in Obsidian |
| `⌃⌥⌘D` | Open today's daily note |
| `⌃⌥⌘S` | Screenshot to vault |
| `⌃⌥⌘N` | Create quick note |

## Tips

1. **Path Configuration**: All paths assume vault at `~/Documents/ObsidianVault`
2. **Shell Environment**: Scripts use `source ~/.zshrc` to load PATH
3. **1Password Setup**: Requires items in "Private" vault with exact names
4. **CleanShot X**: Requires Pro version for URL scheme support
5. **Obsidian URI**: Enable "Advanced URI" community plugin for best results

## Troubleshooting

**Workflow not running:**
- Check script has execute permissions
- Verify PATH includes homebrew binaries
- Test script manually in Terminal first

**1Password authentication:**
- Ensure 1Password app is running
- Enable "CLI integration" in 1Password settings
- Run `op signin` manually first

**CleanShot X not capturing:**
- Verify Pro license is active
- Check URL scheme is enabled in preferences
- Grant accessibility permissions in System Settings

## Customization

Edit workflow scripts directly in Alfred:
1. Right-click workflow → Show in Finder
2. Edit bash scripts in your preferred editor
3. Save and test

## Resources

- [Alfred Workflows Documentation](https://www.alfredapp.com/help/workflows/)
- [1Password CLI Reference](https://developer.1password.com/docs/cli/)
- [CleanShot X API Docs](https://cleanshot.com/docs-api)
- [Obsidian URI Schemes](https://help.obsidian.md/Advanced+topics/Using+obsidian+URI)

---

**Created:** 2025-10-27
**Version:** 1.0
**Author:** Mike Finneran
