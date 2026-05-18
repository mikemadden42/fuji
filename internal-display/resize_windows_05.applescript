-- Internal display: 14" MacBook Pro, 3024x1964 @ 2x (logical 1512x982).
property screenWidth: 1512
property screenHeight: 982

-- Define some consistent values for easier adjustments
property padding: 20
property appWidth: 720
property appHeight: 880

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
