# Mike Finneran - Utilities & Scripts

**Personal collection of reusable scripts and automation tools**

---

## 📁 Contents

### 🎯 ObsidianVault Automation (NEW!)
**Complete automation toolkit for personal knowledge management**
- **22 scripts** - Daily notes, metrics, integrations, screenshots
- **7 Alfred workflows** - Quick vault access via launcher
- **1 MCP server** - AI-powered research with Perplexity Pro
- **13+ docs** - Complete setup and reference guides

👉 **[See obsidian-automation/ directory](./obsidian-automation/README.md)** for full documentation

### Gmail Tools
- **amazon_parser** - Parse Amazon order confirmations from Gmail
- Extract order details, prices, delivery dates
- Export to CSV for expense tracking

### File Management
- **find_duplicates.sh** - Find duplicate files by hash
- **sync_to_icloud_backup.sh** - Backup automation

### Data Processing
- (More tools to be added)

---

## 🚀 Quick Start

Each script has its own README with:
- Purpose and use case
- Setup instructions
- Usage examples
- Dependencies

---

## 📚 Documentation

### By Category

**Obsidian Automation:**
- `obsidian-automation/` - Complete automation toolkit
  - 📖 [Main README](./obsidian-automation/README.md)
  - 📖 [Scripts Reference](./obsidian-automation/docs/SCRIPTS-README.md)
  - 📖 [Quick Index](./obsidian-automation/docs/INDEX.md)
  - 📖 [Contributing Guide](./obsidian-automation/docs/CONTRIBUTING.md)
  - 📖 [Alfred Workflows](./obsidian-automation/docs/ALFRED-README.md)

**Email Automation:**
- `gmail/amazon_parser/` - Amazon order tracking

**File Utilities:**
- `files/find_duplicates.sh` - Duplicate finder
- `files/sync_to_icloud_backup.sh` - iCloud backup

**Data Tools:**
- (Coming soon)

---

## 🔧 Setup

### Prerequisites

**Python scripts:**
```bash
python3 --version  # 3.8+
pip3 install -r requirements.txt
```

**Shell scripts:**
```bash
chmod +x script_name.sh
```

---

## 📦 Installation

### Clone the repo
```bash
git clone https://github.com/username-sudo/utilities.git
cd utilities
```

### Install dependencies
```bash
pip3 install -r requirements.txt
```

### Run any script
```bash
cd gmail/amazon_parser
python3 amazon_orders.py
```

---

## 🎯 Use Cases

### Amazon Order Tracking
**Problem:** Need to track Amazon purchases for expense reports

**Solution:**
```bash
cd gmail/amazon_parser
python3 amazon_orders.py
# Outputs: amazon_orders.csv
```

### Find Duplicate Files
**Problem:** Cleaning up duplicate files across drives

**Solution:**
```bash
./files/find_duplicates.sh ~/Documents
```

### Automated Backups
**Problem:** Regular backups to iCloud

**Solution:**
```bash
./files/sync_to_icloud_backup.sh
```

---

## 📝 Adding New Scripts

### 1. Create Directory
```bash
mkdir -p category/script_name
```

### 2. Add Script
```bash
cp your_script.py category/script_name/
```

### 3. Add README
```bash
cat > category/script_name/README.md << 'EOF'
# Script Name

## Purpose
What this script does

## Usage
How to run it

## Dependencies
What it needs
EOF
```

### 4. Update Main README
Add entry to this file under appropriate category

---

## 🔐 Security

### Credentials
- **Never commit credentials** to GitHub
- Use `.gitignore` for sensitive files:
  ```
  credentials.json
  token.pickle
  *.key
  .env
  ```

### API Keys
- Store in environment variables
- Use `.env.example` as template

---

## 🤝 Contributing

This is a personal repo, but if you find it useful:
1. Fork it
2. Adapt for your use
3. Share improvements via PR

---

## 📄 License

MIT License - Free to use and modify

---

## 🔗 Related Projects

- **Ivy League AI Education** - https://github.com/username-sudo/ivy-league-ai-education

---

## 📊 Script Index

### Obsidian Automation (22 scripts)

**Daily Automation (4 scripts)**
- `create_daily_note_enhanced.sh` - Create comprehensive daily notes
- `create_weekly_review_enhanced.sh` - Generate weekly reviews
- `update_daily_note.py` - Auto-update notes with project priorities
- `create_client_update.sh` - ClientProject project updates

**Integrations (5 scripts)**
- `sync_to_notion.py` - Sync vault to Notion databases
- `sync_calendar.py` - Sync Google Calendar to daily notes
- `sync_gmail.py` - Sync Gmail inbox to vault
- `setup-notion-sync.sh` - Notion setup wizard
- `oauth_server.py` - OAuth callback server

**Screenshots (4 scripts)**
- `capture-screenshot.sh` - Screenshot to vault with CleanShot X
- `daily-screenshot.sh` - Screenshot to daily attachments
- `project-screenshot.sh` - Project-specific screenshots
- `ocr-to-daily.sh` - OCR screenshots to text

**Setup & Utilities (6 scripts)**
- `setup-integrations.sh` - Master setup script
- `setup_wizard.py` - Interactive setup wizard
- `get-api-key.sh` - Retrieve API keys from 1Password
- `open-vault.sh` - Open vault in Obsidian
- `update_metrics.py` - Track revenue & activities
- `sync-documents-to-gdrive.sh` - Backup to Google Drive

**Project Scripts (3 scripts)**
- `project_education.py` - ProjectX automation
- `web_dev_education.py` - Web dev content generation
- `create-utm-vm.applescript` - Create UTM VMs

**Alfred Workflows (7 scripts)**
- Full vault control via Alfred launcher
- See [Alfred README](./obsidian-automation/docs/ALFRED-README.md)

**MCP Servers (1 server)**
- `perplexity-research` - AI research with Perplexity Pro
- **Status:** ✅ Active

---

### Gmail Tools

**amazon_parser**
- **Purpose:** Extract Amazon orders from Gmail
- **Input:** Gmail API access
- **Output:** CSV with order details
- **Status:** ✅ Active

### File Management

**find_duplicates.sh**
- **Purpose:** Find duplicate files by hash
- **Input:** Directory path
- **Output:** List of duplicates
- **Status:** ✅ Active

**sync_to_icloud_backup.sh**
- **Purpose:** Automated backup to iCloud
- **Input:** Source directory
- **Output:** Backup in iCloud
- **Status:** ✅ Active

---

## 🛠️ Maintenance

**Last Updated:** October 28, 2025
**Scripts:** 25+ active
**Categories:** 4 (Obsidian Automation, Gmail, Files, Data)
**Lines of Code:** 4,000+

---

## 📞 Questions?

Check the README in each script's directory for detailed documentation.
