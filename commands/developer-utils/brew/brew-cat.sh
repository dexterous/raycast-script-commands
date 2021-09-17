#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Display source of a package
# @raycast.mode silent
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

if brew info "${1}" >/dev/null 2>&1; then
  brew cat "${1}" | gview -M - +'set ft=ruby' >/dev/null 2>&1

  brew info --json "${1}" | jq -r '.[0] | [
    "Source for ", .tap, "/", .name, " ", .full_name
  ] | join("")'
  
else
  echo "No such Formula/Cask ${1}!"

fi
