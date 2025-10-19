# Amazon Order Parser - Gmail

**Extract Amazon order details from Gmail confirmation emails**

---

## Purpose

Parse Amazon order confirmation emails to:
- Track purchases for expense reports
- Analyze spending patterns
- Export to accounting software
- Maintain purchase records

---

## Features

- ✅ Connects to Gmail via API
- ✅ Searches for Amazon order emails
- ✅ Extracts order number, date, total, items
- ✅ Exports to CSV format
- ✅ Handles multiple orders
- ✅ Automated authentication

---

## Setup

### 1. Install Dependencies

```bash
pip3 install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
```

Or use requirements.txt:
```bash
pip3 install -r requirements.txt
```

### 2. Get Gmail API Credentials

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create new project or select existing
3. Enable Gmail API
4. Create OAuth 2.0 credentials
5. Download as `credentials.json`
6. Place in this directory

**First Run:**
- Script will open browser for authorization
- Sign in with your Google account
- Grant Gmail access
- Token saved to `token.pickle` for future runs

---

## Usage

### Basic Usage

```bash
python3 amazon_orders.py
```

**Output:** `amazon_orders.csv` in current directory

### Custom Output

```bash
python3 amazon_orders.py --output ~/Desktop/orders.csv
```

### Date Range

```bash
# Last 30 days
python3 amazon_orders.py --days 30

# Specific date range
python3 amazon_orders.py --start-date 2025-01-01 --end-date 2025-03-31
```

### Verbose Mode

```bash
python3 amazon_orders.py --verbose
```

---

## Output Format

**CSV Columns:**
```csv
Order Number,Date,Total,Items,Delivery Date,Status
123-4567890-1234567,2025-10-15,$149.99,"Item 1, Item 2",2025-10-18,Delivered
```

---

## Configuration

### Email Filters

Edit `amazon_orders.py` to customize:

```python
# Search query
QUERY = 'from:auto-confirm@amazon.com subject:"Your Amazon.com order"'

# Date range
DAYS_BACK = 90  # Last 90 days
```

### Output Fields

Add/remove fields in `parse_order()`:

```python
order_data = {
    'order_number': extract_order_number(email),
    'date': extract_date(email),
    'total': extract_total(email),
    # Add more fields here
}
```

---

## Troubleshooting

### "credentials.json not found"

**Solution:**
1. Follow setup steps to get Gmail API credentials
2. Download `credentials.json` from Google Cloud Console
3. Place in same directory as script

### "Permission denied"

**Solution:**
```bash
chmod +x amazon_orders.py
```

### "No orders found"

**Possible causes:**
- Check date range (increase `--days`)
- Verify Gmail search query
- Check Amazon email address (might be different region)

### "Token expired"

**Solution:**
```bash
rm token.pickle
python3 amazon_orders.py
# Re-authorize in browser
```

---

## Security

### Never Commit Credentials

**In `.gitignore`:**
```
credentials.json
token.pickle
*.key
```

### Credentials Are Local Only

- `credentials.json` - Your Gmail API credentials
- `token.pickle` - Your authorization token
- These stay on your machine, never in git

### Safe to Share

- ✅ `amazon_orders.py` - The script code
- ✅ `README.md` - This documentation
- ✅ `requirements.txt` - Dependencies
- ❌ `credentials.json` - Keep private
- ❌ `token.pickle` - Keep private

---

## Automation

### Run Daily

**cron job (macOS/Linux):**
```bash
# Open crontab
crontab -e

# Add this line (runs daily at 9 AM)
0 9 * * * cd /path/to/gmail/amazon_parser && python3 amazon_orders.py
```

### Background Process

```bash
# Run in background
nohup python3 amazon_orders.py > output.log 2>&1 &

# Check if running
ps aux | grep amazon_orders.py
```

---

## Examples

### Export Last Month's Orders

```bash
python3 amazon_orders.py --days 30 --output ~/Desktop/october_orders.csv
```

### Quarterly Report

```bash
python3 amazon_orders.py --start-date 2025-10-01 --end-date 2025-12-31 --output Q4_2025.csv
```

### Check for New Orders

```bash
# Last 7 days
python3 amazon_orders.py --days 7
```

---

## Integration

### Import to Excel

```bash
# Export CSV
python3 amazon_orders.py

# Open in Excel
open amazon_orders.csv
```

### Import to Google Sheets

```bash
# Export
python3 amazon_orders.py

# Upload to Google Drive
# File → Import → Upload CSV
```

### Import to Accounting Software

Most accounting software accepts CSV:
- QuickBooks: File → Import
- Xero: Accounts → Import
- Wave: Upload transactions

---

## Extending

### Add Custom Fields

```python
def parse_order(email):
    # Existing fields
    order_data = {...}

    # Add new field
    order_data['tax'] = extract_tax(email)
    order_data['shipping'] = extract_shipping(email)

    return order_data
```

### Filter by Amount

```python
# Only orders over $100
if extract_total(email) > 100:
    orders.append(parse_order(email))
```

### Send Email Report

```python
import smtplib

# After generating CSV
send_email_with_attachment('amazon_orders.csv')
```

---

## Performance

**Typical run:**
- 100 emails: ~10 seconds
- 500 emails: ~30 seconds
- 1000 emails: ~60 seconds

**Gmail API Limits:**
- Quota: 1 billion requests/day (more than enough)
- Rate: ~10,000 requests/second

---

## Dependencies

```
google-auth==2.23.0
google-auth-oauthlib==1.1.0
google-auth-httplib2==0.1.1
google-api-python-client==2.100.0
```

See `requirements.txt` for full list.

---

## Version History

**v1.0** (Oct 2025)
- Initial release
- Basic order extraction
- CSV export

---

## License

MIT License - Free to use and modify

---

## Related Tools

- **ScrapeMaster** - Web scraping for business data
- **Utilities** - Other automation scripts

---

**Last Updated:** October 18, 2025
**Status:** ✅ Active and tested
