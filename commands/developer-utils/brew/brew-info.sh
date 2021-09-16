#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Display summary info for a package
# @raycast.mode compact
# @raycast.packageName Brew
#
# Optional parameters:
# @raycast.icon 🍺
# @raycast.needsConfirmation false
# @raycast.argument1 {"type": "text", "placeholder": "Package name"}
#
# Documentation:
# @raycast.description Installs specified brew package.
# @raycast.author Alex Zotov
# @raycast.authorURL https://github.com/lex4hex

for cmd in brew jq; do
  if ! command -v "${cmd}" &> /dev/null; then
    echo "${cmd} command is required";
    exit 1;
  fi
done

brew info --json "${1}" | jq -r '.[0] | [
  .desc,
  " ",
  "[", .tap, "/", .name, "] ", .full_name,
  " ",
  "[", if .installed[].version == .versions.stable then "*" else .installed[].version end, "]",
  .versions.stable
] | join("")'
