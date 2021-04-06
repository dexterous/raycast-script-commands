#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title World Time
# @raycast.mode inline
# @raycast.refreshTime 5s
# @raycast.packageName Dashboard

# Optional parameters:
# @raycast.icon 🕐
#
# Documentation:
# @raycast.description Show the time from elsewhere in the world
# @raycast.author Jesse Claven
# @raycast.authorURL https://github.com/jesse-c

# Timezones can be found in /usr/share/zoneinfo

while read -r timezone name; do
  echo -n "| $(TZ="${timezone}" date +"${name} %I:%M %p") "
done <<EOF
America/Los_Angeles LA
America/Chicago Chi
America/New_York NYC
Asia/Kolkata PUN
Singapore SG
EOF

echo '|'

# nyc=$(TZ=America/New_York date +"%H:%M")
# lon=$(TZ=Europe/London date +"%H:%M")
# bne=$(TZ=Australia/Brisbane date +"%H:%M")
# 
# echo "New York City: $nyc | London: $lon | Brisbane: $bne"
