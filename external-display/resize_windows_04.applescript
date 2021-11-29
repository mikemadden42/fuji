-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "Music"
	tell window 1
		set position to {800, 600}
		set size to {1000, 650}
	end tell
end tell

tell application "System Events" to tell process "TV"
	tell window 1
		set position to {240, 320}
		set size to {1000, 650}
	end tell
end tell

tell application "System Events" to tell process "Photos"
	tell window 1
		set position to {600, 450}
		set size to {1000, 650}
	end tell
end tell
