-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "Calendar"
	tell window 1
		set position to {1000, 600}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Mail"
	tell window 1
		set position to {40, 120}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Messages"
	tell window 1
		set position to {1000, 150}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Notes"
	tell window 1
		set position to {100, 80}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Reminders"
	tell window 1
		set position to {700, 100}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Slack"
	tell window 1
		set position to {100, 400}
		set size to {960, 900}
	end tell
end tell
