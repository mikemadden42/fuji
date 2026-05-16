-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define some consistent values for easier adjustments
property padding: 50 -- General padding from screen edges and between windows
property appWidth: 900 -- A good width for messaging apps
property appHeight: 1200 -- Use more of the 1440px vertical space

-- Calculate the total width needed for both apps plus the inner padding
property totalAppsWidth: (appWidth * 2) + padding

-- Center both apps as a block, both horizontally and vertically
property startX: round ((screenWidth - totalAppsWidth) / 2)
property startY: round ((screenHeight - appHeight) / 2)


tell application "System Events"
	-- --- Signal: Placed on the left side of the central block ---
	try
		activate application "Signal"
		tell process "Signal"
			tell window 1
				set position to {startX, startY}
				set size to {appWidth, appHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Signal: " & errMsg with title "AppleScript Error"
	end try

	-- --- WhatsApp: Placed on the right side of the central block ---
	try
		activate application "WhatsApp"
		tell process "WhatsApp"
			tell window 1
				set position to {startX + appWidth + padding, startY}
				set size to {appWidth, appHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange WhatsApp: " & errMsg with title "AppleScript Error"
	end try

end tell
