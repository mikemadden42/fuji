-- Internal display: 14" MacBook Pro, 3024x1964 @ 2x (logical 1512x982).
property screenWidth: 1512
property screenHeight: 982

-- Define some consistent values for easier adjustments
property padding: 40 -- General padding from screen edges
property horizontalSpacing: 15 -- Spacing between columns
property verticalSpacing: 15 -- Spacing between rows

-- Compute cell dimensions to fill a 3x2 grid across the screen
property usableWidth: screenWidth - (2 * padding)
property usableHeight: screenHeight - (2 * padding)
property columnWidth: (usableWidth - (2 * horizontalSpacing)) div 3
property itemHeight: (usableHeight - verticalSpacing) div 2

-- Column X-positions
property leftColumnX: padding
property centerColumnX: padding + columnWidth + horizontalSpacing
property rightColumnX: padding + (2 * (columnWidth + horizontalSpacing))

-- Row Y-positions
property topRowY: padding
property bottomRowY: padding + itemHeight + verticalSpacing

tell application "System Events"
	-- --- Column 1: Left Side (Mail, Slack) ---

	try
		activate application "Mail"
		tell process "Mail"
			tell window 1
				set position to {leftColumnX, topRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Mail: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "Slack"
		tell process "Slack"
			tell window 1
				set position to {leftColumnX, bottomRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Slack: " & errMsg with title "AppleScript Error"
	end try

	-- --- Column 2: Center (Messages, Reminders) ---

	try
		activate application "Messages"
		tell process "Messages"
			tell window 1
				set position to {centerColumnX, topRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Messages: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "Reminders"
		tell process "Reminders"
			tell window 1
				set position to {centerColumnX, bottomRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Reminders: " & errMsg with title "AppleScript Error"
	end try

	-- --- Column 3: Right Side (Calendar, Notes) ---

	try
		activate application "Calendar"
		tell process "Calendar"
			tell window 1
				set position to {rightColumnX, topRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Calendar: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "Notes"
		tell process "Notes"
			tell window 1
				set position to {rightColumnX, bottomRowY}
				set size to {columnWidth, itemHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Notes: " & errMsg with title "AppleScript Error"
	end try

end tell
