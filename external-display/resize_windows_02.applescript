-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "Code"
	tell window 1
		set position to {380, 360}
		set size to {1200, 800}
	end tell
end tell
