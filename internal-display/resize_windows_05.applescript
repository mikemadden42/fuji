-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "Signal"
	tell window 1
		set position to {200, 50}
		set size to {1000, 650}
	end tell
end tell

tell application "System Events" to tell process "WhatsApp"
	tell window 1
		set position to {350, 200}
		set size to {1000, 650}
	end tell
end tell
