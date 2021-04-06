#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Display source of a package
# @raycast.mode fullOutput
# @raycast.packageName Brew
#
# Optional parameters:
# @raycast.icon 🍺
# @raycast.needsConfirmation false
# @raycast.argument1 {"type": "text", "placeholder": "Package name"}
#
# Documentation:
# @raycast.description Displays source for formula/cask.
# @raycast.author Saager Mhatre
# @raycast.authorURL https://github.com/dexterous

for cmd in brew gvim; do
  if ! command -v "${cmd}" &> /dev/null; then
    echo "${cmd} command is required";
    exit 1;
  fi
done

brew cat "${1}" | gview -M - +'set ft=ruby'
