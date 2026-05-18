-- External display: Dell U2722D, 2560x1440.
property screenWidth: 2560
property screenHeight: 1440

-- Define some consistent values for easier adjustments
property padding: 50 -- General padding from screen edges and between windows
property appWidth: 1000 -- A good width for messaging apps
property appHeight: 1200 -- Use most of the 1440px vertical space

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
