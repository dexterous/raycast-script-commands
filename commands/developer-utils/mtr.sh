#!/bin/bash

# @raycast.title MTR
# @raycast.author Saager Mhatre
# @raycast.authorURL https://github.com/dexterous
# @raycast.description Run MTR on an IP address or URL.

# @raycast.icon 🌐
# @raycast.mode fullOutput
# @raycast.packageName Internet
# @raycast.schemaVersion 1

# @raycast.argument1 { "type": "text", "placeholder": "URL or IP address" }

PATH=/usr/local/sbin:$PATH
mtr --report-wide "$1"
