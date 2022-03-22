-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "Signal"
	tell window 1
		set position to {300, 150}
		set size to {1000, 650}
	end tell
end tell

tell application "System Events" to tell process "Messenger"
	tell window 1
		set position to {500, 550}
		set size to {1000, 650}
	end tell
end tell
