-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH

tell application "System Events" to tell process "Signal"
	tell window 1
		-- Signal can be placed on the right side, perhaps as a primary communication window.
		set position to {2000, 150} -- Increased X from 300 to 2000
		set size to {800, 800} -- Adjusted size for a taller, slightly narrower messaging app, adjust as needed
	end tell
end tell

tell application "System Events" to tell process "Messenger"
	tell window 1
		-- Messenger can be placed next to Signal or below it, depending on preference.
		set position to {1600, 600} -- Increased X from 500 to 2000, adjusted Y to be below Signal
		set size to {800, 650} -- Adjusted width to match Signal for consistency, adjust as needed
	end tell
end tell
