# File Management Utilities

**Tools for file operations, backups, and organization**

---

## Scripts

### find_duplicates.sh
**Find duplicate files by computing MD5 hashes**

**Usage:**
```bash
./find_duplicates.sh ~/Documents
```

**Output:**
- Lists all duplicate files
- Groups by hash
- Shows file sizes

**Use cases:**
- Cleaning up Downloads folder
- Freeing disk space
- Organizing photo libraries

---

### sync_to_icloud_backup.sh
**Automated backup to iCloud Drive**

**Usage:**
```bash
./sync_to_icloud_backup.sh
```

**Features:**
- Syncs important files to iCloud
- Preserves timestamps
- Shows progress

**Use cases:**
- Daily backups
- Disaster recovery
- Cross-device sync

---

## Installation

```bash
# Make scripts executable
chmod +x find_duplicates.sh
chmod +x sync_to_icloud_backup.sh
```

---

## Documentation

See individual script headers for detailed usage and options.

---

**Last Updated:** October 18, 2025
