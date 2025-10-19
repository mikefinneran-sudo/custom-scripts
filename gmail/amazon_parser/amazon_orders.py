#!/usr/bin/env python3
"""
Gmail Amazon Order Parser
Extracts Amazon orders from Gmail and creates a markdown table
"""

import os
import pickle
import base64
import re
from datetime import datetime
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from bs4 import BeautifulSoup
import email

# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']

def get_gmail_service():
    """Authenticate and return Gmail API service"""
    creds = None
    script_dir = os.path.dirname(os.path.abspath(__file__))
    token_path = os.path.join(script_dir, 'token.pickle')
    creds_path = os.path.join(script_dir, 'credentials.json')

    # The file token.pickle stores the user's access and refresh tokens
    if os.path.exists(token_path):
        with open(token_path, 'rb') as token:
            creds = pickle.load(token)

    # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(creds_path, SCOPES)
            creds = flow.run_local_server(port=0)
        # Save the credentials for the next run
        with open(token_path, 'wb') as token:
            pickle.dump(creds, token)

    return build('gmail', 'v1', credentials=creds)

def get_message_body(msg):
    """Extract email body from message"""
    try:
        if 'parts' in msg['payload']:
            for part in msg['payload']['parts']:
                if part['mimeType'] == 'text/html':
                    data = part['body'].get('data')
                    if data:
                        return base64.urlsafe_b64decode(data).decode('utf-8')
                elif part['mimeType'] == 'text/plain':
                    data = part['body'].get('data')
                    if data:
                        return base64.urlsafe_b64decode(data).decode('utf-8')
        else:
            data = msg['payload']['body'].get('data')
            if data:
                return base64.urlsafe_b64decode(data).decode('utf-8')
    except Exception as e:
        print(f"Error extracting body: {e}")
    return ""

def parse_amazon_order(body, subject, date):
    """Parse Amazon order details from email body"""
    soup = BeautifulSoup(body, 'html.parser')

    # Try to extract order number
    order_number = None
    order_patterns = [
        r'Order\s*#?\s*(\d{3}-\d{7}-\d{7})',
        r'order\s*number[:\s]+(\d{3}-\d{7}-\d{7})',
    ]

    for pattern in order_patterns:
        match = re.search(pattern, body, re.IGNORECASE)
        if match:
            order_number = match.group(1)
            break

    # Try to extract total
    total = None
    total_patterns = [
        r'\$\s*([\d,]+\.\d{2})\s*(?:total|grand total)',
        r'(?:total|grand total)[:\s]+\$\s*([\d,]+\.\d{2})',
        r'Order\s*Total[:\s]+\$\s*([\d,]+\.\d{2})',
    ]

    for pattern in total_patterns:
        match = re.search(pattern, body, re.IGNORECASE)
        if match:
            total = match.group(1)
            break

    # Extract items - look for product links and names
    items = []

    # Method 1: Find product links
    product_links = soup.find_all('a', href=re.compile(r'/gp/product/|/dp/'))
    for link in product_links[:5]:  # Limit to first 5 items
        item_name = link.get_text(strip=True)
        if item_name and len(item_name) > 5:  # Filter out short/empty text
            items.append(item_name)

    # Method 2: If no items found, look in subject
    if not items:
        # Sometimes item name is in subject
        subject_match = re.search(r'shipped:?\s*(.+)', subject, re.IGNORECASE)
        if subject_match:
            items.append(subject_match.group(1).strip())

    return {
        'date': date,
        'order_number': order_number or 'N/A',
        'items': items if items else ['[Items not found in email]'],
        'total': total or 'N/A',
        'subject': subject
    }

def main():
    print("Connecting to Gmail...")
    service = get_gmail_service()

    print("\nSearching for Amazon orders...")

    # Search for Amazon emails
    query = 'from:amazon.com (subject:"Your Amazon.com order" OR subject:"shipped" OR subject:"Shipment" OR subject:"order")'

    results = service.users().messages().list(
        userId='me',
        q=query,
        maxResults=500  # Adjust as needed
    ).execute()

    messages = results.get('messages', [])

    if not messages:
        print('No Amazon orders found.')
        return

    print(f"Found {len(messages)} Amazon emails. Processing...\n")

    orders = []

    for idx, message in enumerate(messages, 1):
        print(f"Processing {idx}/{len(messages)}...", end='\r')

        msg = service.users().messages().get(
            userId='me',
            id=message['id'],
            format='full'
        ).execute()

        # Get headers
        headers = msg['payload']['headers']
        subject = next((h['value'] for h in headers if h['name'] == 'Subject'), '')
        date_str = next((h['value'] for h in headers if h['name'] == 'Date'), '')

        # Parse date
        try:
            date_obj = email.utils.parsedate_to_datetime(date_str)
            date = date_obj.strftime('%Y-%m-%d')
        except:
            date = date_str[:10] if len(date_str) >= 10 else 'N/A'

        # Get body
        body = get_message_body(msg)

        # Parse order details
        order = parse_amazon_order(body, subject, date)
        orders.append(order)

    print(f"\nProcessed {len(orders)} orders.\n")

    # Sort by date (newest first)
    orders.sort(key=lambda x: x['date'], reverse=True)

    # Generate markdown table
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_file = os.path.join(script_dir, 'amazon_orders.md')

    with open(output_file, 'w') as f:
        f.write("# Amazon Orders\n\n")
        f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"Total Orders Found: {len(orders)}\n\n")
        f.write("| Date | Order Number | Items | Total |\n")
        f.write("|------|--------------|-------|-------|\n")

        for order in orders:
            items_str = '<br>'.join(order['items'][:3])  # Limit to 3 items per order
            if len(order['items']) > 3:
                items_str += f"<br>*...and {len(order['items']) - 3} more*"

            f.write(f"| {order['date']} | {order['order_number']} | {items_str} | ${order['total']} |\n")

    print(f"✅ Markdown table created: {output_file}")
    print(f"\nTotal orders: {len(orders)}")

    # Calculate total spend (where available)
    total_spend = 0
    orders_with_total = 0
    for order in orders:
        if order['total'] != 'N/A':
            try:
                amount = float(order['total'].replace(',', ''))
                total_spend += amount
                orders_with_total += 1
            except:
                pass

    if orders_with_total > 0:
        print(f"Total spend (from {orders_with_total} orders with totals): ${total_spend:,.2f}")

if __name__ == '__main__':
    main()
