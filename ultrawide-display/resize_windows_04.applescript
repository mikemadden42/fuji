-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH

tell application "System Events" to tell process "Music"
	tell window 1
		-- Music can be nicely centered or placed on the right half.
		set position to {1200, 600} -- Increased X from 800 to 1200
		set size to {1000, 650} -- Consider making this wider if you like (e.g., {1400, 650})
	end tell
end tell

tell application "System Events" to tell process "TV"
	tell window 1
		-- TV could occupy a large central space or be to the right of another app.
		set position to {1800, 320} -- Increased X from 240 to 1800
		set size to {1000, 650} -- You might want to make this significantly wider for video (e.g., {1800, 900})
	end tell
end tell

tell application "System Events" to tell process "Photos"
	tell window 1
		-- Photos might be best in a central or slightly-right position to view images.
		set position to {1400, 450} -- Increased X from 600 to 1400
		set size to {1000, 650} -- Consider making this wider as well (e.g., {1600, 800})
	end tell
end tell
