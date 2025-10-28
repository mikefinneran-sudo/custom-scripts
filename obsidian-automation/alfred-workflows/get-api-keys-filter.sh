#!/bin/bash
# Alfred Workflow: Get API Keys (Script Filter)
# Keyword: api {query}

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
    },
    {
      "uid": "notion",
      "title": "Notion API",
      "subtitle": "Copy Notion integration token",
      "arg": "Notion API",
      "autocomplete": "notion",
      "icon": {"path": "/Applications/1Password.app"}
    }
  ]
}
EOF
