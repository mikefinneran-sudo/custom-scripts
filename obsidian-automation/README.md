# ObsidianVault Automation Scripts

**Complete automation toolkit for Obsidian personal knowledge management**

22 custom scripts + 7 Alfred workflows + 1 MCP server powering automated daily notes, metrics tracking, integrations with Notion/Gmail/Calendar, screenshot management, and AI-powered research.

---

## 📋 Quick Start

```bash
# Clone the repository
git clone https://github.com/mikefinneran-sudo/custom-scripts.git
cd custom-scripts/obsidian-automation

# Most common scripts
./daily-automation/create_daily_note_enhanced.sh  # Create today's note
python3 utilities/update_metrics.py               # Update metrics
./setup/setup-integrations.sh                     # Setup integrations
```

---

## 📂 Directory Structure

```
obsidian-automation/
├── daily-automation/     # Daily & weekly note automation (4 scripts)
├── integrations/         # Notion, Gmail, Calendar sync (5 scripts)
├── screenshots/          # Screenshot capture & OCR (4 scripts)
├── setup/                # Setup wizards & utilities (4 scripts)
├── utilities/            # Metrics & backup tools (2 scripts)
├── project-scripts/      # Project-specific automation (3 scripts)
├── alfred-workflows/     # Alfred launcher workflows (7 scripts)
├── mcp-servers/          # AI research MCP server (1 server)
└── docs/                 # Complete documentation (13+ files)
```

---

## 🚀 Scripts by Category

### 1. Daily Automation (4 scripts)

**Purpose:** Automated daily and weekly note creation with templates

| Script | Description |
|--------|-------------|
| `create_daily_note_enhanced.sh` | Creates comprehensive daily notes with structured templates |
| `create_weekly_review_enhanced.sh` | Generates weekly review notes for reflection |
| `update_daily_note.py` | Auto-updates daily notes with project priorities |
| `create_flyflat_update.sh` | Creates FlyFlat project update notes |

**Quick Use:**
```bash
cd daily-automation
./create_daily_note_enhanced.sh
```

---

### 2. Integrations (5 scripts)

**Purpose:** Sync Obsidian with external services

| Script | Description |
|--------|-------------|
| `sync_to_notion.py` | Syncs Obsidian notes to Notion databases |
| `sync_calendar.py` | Syncs Google Calendar events to daily notes |
| `sync_gmail.py` | Syncs Gmail inbox to Obsidian |
| `setup-notion-sync.sh` | Automated setup wizard for Notion |
| `oauth_server.py` | OAuth callback server for Google APIs |

**Quick Use:**
```bash
cd integrations
python3 sync_to_notion.py              # Sync all to Notion
python3 sync_to_notion.py --dry-run    # Test without syncing
python3 sync_calendar.py               # Sync today's calendar
```

---

### 3. Screenshots (4 scripts)

**Purpose:** Screenshot capture, organization, and OCR

| Script | Description |
|--------|-------------|
| `capture-screenshot.sh` | Captures screenshots to vault with CleanShot X |
| `daily-screenshot.sh` | Captures screenshots to daily note attachments |
| `project-screenshot.sh` | Captures screenshots for specific projects |
| `ocr-to-daily.sh` | OCR screenshots and append text to daily note |

**Quick Use:**
```bash
cd screenshots
./capture-screenshot.sh
./ocr-to-daily.sh /path/to/screenshot.png
```

---

### 4. Setup & Configuration (4 scripts)

**Purpose:** Installation and configuration tools

| Script | Description |
|--------|-------------|
| `setup-integrations.sh` | Master setup for 1Password CLI, CleanShot X, Alfred |
| `setup_wizard.py` | Interactive Python setup wizard |
| `get-api-key.sh` | Securely retrieves API keys from 1Password |
| `open-vault.sh` | Opens ObsidianVault in Obsidian app |

**Quick Use:**
```bash
cd setup
./setup-integrations.sh                 # Run master setup
./get-api-key.sh "Anthropic API"        # Get specific API key
```

---

### 5. Utilities (2 scripts)

**Purpose:** Metrics tracking and backup automation

| Script | Description |
|--------|-------------|
| `update_metrics.py` | Interactive metrics tracking for revenue & activities |
| `sync-documents-to-gdrive.sh` | Syncs vault documents to Google Drive backup |

**Quick Use:**
```bash
cd utilities
python3 update_metrics.py              # Update metrics interactively
./sync-documents-to-gdrive.sh          # Backup to Google Drive
```

---

### 6. Project Scripts (3 scripts)

**Purpose:** Project-specific automation

| Script | Description |
|--------|-------------|
| `waltersignal_education.py` | Education content automation for WalterSignal |
| `web_dev_education.py` | Web development education content generation |
| `create-utm-vm.applescript` | AppleScript for creating UTM virtual machines |

---

### 7. Alfred Workflows (7 scripts)

**Purpose:** Quick access to vault features via Alfred launcher

| Script | Keyword | Description |
|--------|---------|-------------|
| `vault-commands.sh` | `obs` | Main vault commands entry point |
| `quick-note.sh` | `qn` | Create quick capture notes |
| `search-vault-filter.sh` | `vs` | Search vault (filter) |
| `search-vault-action.sh` | `vs` | Search vault (action) |
| `screenshot-to-vault.sh` | `ss` | Screenshot to vault |
| `get-api-keys-filter.sh` | `api` | Get API keys (filter) |
| `get-api-keys-action.sh` | `api` | Get API keys (action) |

**Setup:**
1. Install Alfred
2. Import workflows from `alfred-workflows/`
3. Configure keywords in Alfred Preferences

**Documentation:** See `docs/ALFRED-README.md`

---

### 8. MCP Servers (1 server)

**Purpose:** AI-powered research capabilities via Model Context Protocol

**Perplexity Research Server** (`mcp-servers/perplexity-research/`)
- `server.py` - MCP server implementation
- `setup.sh` - Setup script

**Tools:**
- `perplexity_search` - Quick AI search with citations
- `perplexity_deep_research` - Iterative deep-dive analysis
- `perplexity_compare` - Structured entity comparison

**Setup:**
```bash
cd mcp-servers/perplexity-research
./setup.sh
```

---

## 📚 Complete Documentation

All documentation is in the `docs/` directory:

| Document | Description |
|----------|-------------|
| **SCRIPTS-README.md** | Complete reference for all 22 scripts (8,000+ words) |
| **INDEX.md** | Quick reference index by task |
| **CONTRIBUTING.md** | Guidelines for adding new scripts |
| **ALFRED-README.md** | Alfred workflows documentation |
| **QUICK-SETUP.md** | 5-minute quick start guide |
| **Setup Guides** | Step-by-step for each integration |

**Start here:** `docs/SCRIPTS-README.md`

---

## 🔧 Dependencies

### Required
- **Obsidian** - Note-taking app
- **Python 3.8+** - For Python scripts
- **Bash/Zsh** - For shell scripts

### Optional
- **1Password CLI** - Secure credential management (`brew install --cask 1password-cli`)
- **CleanShot X** - Screenshot capture (https://cleanshot.com/)
- **Alfred Powerpack** - macOS launcher workflows (https://www.alfredapp.com/)
- **Notion** - For Notion sync
- **Google Workspace** - For Calendar/Gmail sync

### Python Packages
```bash
pip3 install notion-client python-frontmatter google-auth-oauthlib google-api-python-client httpx mcp
```

---

## ⚡ Quick Setup

### 1. Install Dependencies
```bash
# macOS tools
brew install --cask 1password-cli obsidian

# Python packages
pip3 install notion-client python-frontmatter google-auth-oauthlib google-api-python-client
```

### 2. Run Master Setup
```bash
cd setup
./setup-integrations.sh
```

### 3. Configure Shell Aliases (Optional)
Add to `~/.zshrc`:
```bash
# ObsidianVault aliases
alias obs-daily='~/path/to/daily-automation/create_daily_note_enhanced.sh'
alias obs-metrics='python3 ~/path/to/utilities/update_metrics.py'
alias obs-notion='python3 ~/path/to/integrations/sync_to_notion.py'
```

Then: `source ~/.zshrc`

---

## 🎯 Common Workflows

### Morning Routine
```bash
./daily-automation/create_daily_note_enhanced.sh  # Create today's note
python3 integrations/sync_calendar.py             # Sync meetings
```

### During the Day
```bash
./screenshots/capture-screenshot.sh               # Capture screenshots
python3 integrations/sync_to_notion.py            # Sync to Notion
```

### Evening Review
```bash
python3 utilities/update_metrics.py               # Update metrics
./utilities/sync-documents-to-gdrive.sh           # Backup to Google Drive
```

---

## 🔐 Security

**Credentials:**
- Never commit API keys or tokens
- Use 1Password CLI for secure storage
- Token files stored in home directory (`~/.lifehub-notion-token`)
- OAuth tokens cached with encryption

**Git Safety:**
- `.env` files excluded
- Token files excluded
- Personal database IDs sanitized in examples

---

## 📊 Statistics

- **Total Scripts:** 22
- **Shell Scripts:** 13
- **Python Scripts:** 9
- **AppleScripts:** 1
- **Alfred Workflows:** 7
- **MCP Servers:** 1
- **Documentation Files:** 13
- **Total Lines of Code:** 3,500+

---

## 🐛 Troubleshooting

### Script Won't Run
```bash
chmod +x script.sh
```

### Command Not Found
```bash
source ~/.zshrc
which python3
```

### 1Password CLI Issues
```bash
op signin
op account list
```

### Obsidian Won't Open
- Verify vault name is "ObsidianVault"
- Check Obsidian URI: `open "obsidian://open?vault=ObsidianVault"`

### Python Import Errors
```bash
pip3 install [missing-package]
```

**For detailed troubleshooting, see:** `docs/SCRIPTS-README.md`

---

## 🔄 Updates & Maintenance

### Adding New Scripts

1. **Create script in appropriate directory**
   ```bash
   touch category/new-script.sh
   chmod +x category/new-script.sh
   ```

2. **Follow guidelines in `docs/CONTRIBUTING.md`**

3. **Update this README**

4. **Commit and push**
   ```bash
   git add .
   git commit -m "Add new-script: description"
   git push
   ```

---

## 📦 Use in Your Own Vault

These scripts are designed for ObsidianVault but can be adapted:

1. **Clone this repository**
   ```bash
   git clone https://github.com/mikefinneran-sudo/custom-scripts.git
   ```

2. **Update paths in scripts**
   - Find: `$HOME/Documents/ObsidianVault`
   - Replace: Your vault path

3. **Update vault name**
   - Find: `vault=ObsidianVault`
   - Replace: Your vault name

4. **Test each script individually**

---

## 🤝 Contributing

This is a personal toolkit, but if you find it useful:

1. Fork the repository
2. Adapt for your use case
3. Share improvements via PR

---

## 📄 License

MIT License - Free to use and modify

---

## 🔗 Related Projects

- **ObsidianVault** - https://github.com/mikefinneran-sudo/obsidian-vault
- **ScrapeMaster** - https://github.com/mikefinneran-sudo/scrapemaster
- **Ivy League AI Education** - https://github.com/mikefinneran-sudo/ivy-league-ai-education

---

## 📞 Support

For detailed documentation on each script:
1. See `docs/SCRIPTS-README.md` for complete reference
2. See `docs/INDEX.md` for quick lookup
3. Check individual script comments for inline docs
4. Review setup guides in `docs/` for step-by-step instructions

---

**Last Updated:** 2025-10-28
**Version:** 2.0
**Author:** Mike Finneran
**Repository:** https://github.com/mikefinneran-sudo/custom-scripts
