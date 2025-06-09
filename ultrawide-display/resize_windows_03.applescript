-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH

tell application "System Events" to tell process "Calendar"
	tell window 1
		-- Calendar can go on the right side
		set position to {2200, 600} -- Increased X from 1000 to 2200
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Mail"
	tell window 1
		-- Mail often needs a good amount of space, place it left-center
		set position to {600, 120} -- Increased X from 40 to 600
		set size to {1200, 800} -- Increased width for Mail
	end tell
end tell

tell application "System Events" to tell process "Messages"
	tell window 1
		-- Messages can be a smaller window on the right side
		set position to {2400, 150} -- Increased X from 1000 to 2400
		set size to {800, 600} -- Slightly reduced width, or adjust as needed
	end tell
end tell

tell application "System Events" to tell process "Notes"
	tell window 1
		-- Notes could be near messages or calendar
		set position to {2000, 80} -- Increased X from 100 to 2000
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Reminders"
	tell window 1
		-- Reminders can be on the right side, perhaps below Notes or Calendar
		set position to {2000, 750} -- Increased X from 700 to 2000, adjusted Y
		set size to {960, 600}
	end tell
end tell

tell application "System Events" to tell process "Slack"
	tell window 1
		-- Slack is often a primary communication app, so place it prominently left-mid
		set position to {40, 400} -- Keep it relatively left, but give it horizontal breathing room
		set size to {960, 900}
	end tell
end tell
