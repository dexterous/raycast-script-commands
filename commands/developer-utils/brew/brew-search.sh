#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search for package
# @raycast.mode fullOutput
# @raycast.packageName Brew
#
# Optional parameters:
# @raycast.icon 🍺
# @raycast.needsConfirmation false
# @raycast.argument1 {"type": "text", "placeholder": "Search pattern"}
#
# Documentation:
# @raycast.description Searches brew packages for specified prefix.
# @raycast.author Saager Mhatre
# @raycast.authorURL https://github.com/dexterous

if ! command -v brew &> /dev/null; then
  echo "brew command is required (https://brew.sh).";
  exit 1;
fi

brew search $1

