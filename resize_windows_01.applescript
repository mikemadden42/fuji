-- https://apple.stackexchange.com/questions/106388/osascript-set-bounds-of-window-not-working-after-mavericks-upgrade
tell application "System Events" to tell process "iTerm2"
	tell window 1
		set position to {0, 0}
		set size to {960, 900}
	end tell
end tell

tell application "System Events" to tell process "Brave Browser"
	tell window 1
		set position to {160, 60}
		set size to {1200, 800}
	end tell

end tell

tell application "System Events" to tell process "KeePassXC"
	tell window 1
		set position to {400, 200}
		set size to {960, 600}
	end tell
end tell

-- tell application "System Events" to tell process "Messenger"
-- 	tell window 1
-- 		set position to {40, 120}
-- 		set size to {960, 600}
-- 	end tell
-- end tell

-- tell application "System Events" to tell process "Signal"
-- 	tell window 1
-- 		set position to {300, 150}
-- 		set size to {960, 600}
-- 	end tell
-- end tell

tell application "System Events" to tell process "Sublime Text"
	tell window 1
		set position to {100, 80}
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Terminal"
	tell window 1
		set position to {100, 100}
		-- set size to {960, 900}
	end tell
end tell
