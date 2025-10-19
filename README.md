# Mike Finneran - Utilities & Scripts

**Personal collection of reusable scripts and automation tools**

---

## 📁 Contents

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
git clone https://github.com/mikefinneran-sudo/utilities.git
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

- **ScrapeMaster** - https://github.com/mikefinneran-sudo/scrapemaster
- **Ivy League AI Education** - https://github.com/mikefinneran-sudo/ivy-league-ai-education

---

## 📊 Script Index

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

### Data Processing

(Coming soon)

### Automation

(Coming soon)

---

## 🛠️ Maintenance

**Last Updated:** October 18, 2025
**Scripts:** 3 active
**Categories:** 2 (Gmail, Files)

---

## 📞 Questions?

Check the README in each script's directory for detailed documentation.
