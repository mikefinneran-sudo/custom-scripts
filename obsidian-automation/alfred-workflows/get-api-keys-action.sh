#!/bin/bash
# Alfred Workflow: Get API Keys (Action)
# Retrieves API key from 1Password and copies to clipboard

source ~/.zshrc

ITEM_NAME="{query}"

# Get API key from 1Password
API_KEY=$(op read "op://Private/${ITEM_NAME}/credential" 2>/dev/null)

if [ $? -eq 0 ]; then
    echo -n "$API_KEY" | pbcopy
    echo "✓ Copied ${ITEM_NAME} to clipboard"
else
    echo "✗ Error: Could not retrieve ${ITEM_NAME}"
    echo "Make sure item exists in 1Password 'Private' vault"
    exit 1
fi
