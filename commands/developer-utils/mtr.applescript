#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title MTR (iTerm)
# @raycast.packageName Internet
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🌐
# @raycast.argument1 { "type": "text", "placeholder": "URL or IP address" }
#
# Documentation:
# @raycast.description Run MTR in new iTerm window
# @raycast.author Saager Mhatre
# @raycast.authorURL https://github.com/dexterous

on run argv
    tell application "iTerm"
        set command to "mtr " & ( item 1 of argv )
        activate
        create window with default profile
        tell the first window
            # create tab with default profile
            tell current session to write text command
        end tell
    end tell
end run
