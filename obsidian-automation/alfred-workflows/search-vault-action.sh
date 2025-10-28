#!/bin/bash
# Alfred Workflow: Search Vault (Action)
# Opens selected note in Obsidian

FILE_PATH="{query}"
open "obsidian://open?vault=ObsidianVault&file=${FILE_PATH}"
