-- Set these values based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT

-- Define some consistent values for easier adjustments
property padding: 50 -- Padding from screen edges
property horizontalSpacing: 60 -- Spacing between columns
property verticalSpacing: 60 -- Spacing between rows

-- Side columns hold two stacked apps; center column holds Brave full-height
property sideAppWidth: 850
property usableHeight: screenHeight - (2 * padding)
property sideAppHeight: (usableHeight - verticalSpacing) div 2

-- Brave fills the remaining horizontal space between the two side columns
property braveWidth: screenWidth - (2 * padding) - (2 * sideAppWidth) - (2 * horizontalSpacing)
property braveHeight: usableHeight

-- Column X-positions
property leftColumnX: padding
property centerColumnX: padding + sideAppWidth + horizontalSpacing
property rightColumnX: centerColumnX + braveWidth + horizontalSpacing

-- Row Y-positions
property topRowY: padding
property bottomRowY: padding + sideAppHeight + verticalSpacing

tell application "System Events"

	-- --- Column 1: Left Side (Sublime Text, Amazon Kindle) ---

	try
		activate application "Sublime Text"
		tell process "Sublime Text"
			tell window 1
				set position to {leftColumnX, topRowY}
				set size to {sideAppWidth, sideAppHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Sublime Text: " & errMsg with title "AppleScript Error"
	end try

	try
		-- Launch Services name is "Amazon Kindle"; System Events process is "Kindle".
		activate application "Amazon Kindle"
		tell process "Kindle"
			tell window 1
				set position to {leftColumnX, bottomRowY}
				set size to {sideAppWidth, sideAppHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Amazon Kindle: " & errMsg with title "AppleScript Error"
	end try

	-- --- Column 2: Center (Brave Browser, full height) ---

	try
		activate application "Brave Browser"
		tell process "Brave Browser"
			tell window 1
				set position to {centerColumnX, topRowY}
				set size to {braveWidth, braveHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Brave Browser: " & errMsg with title "AppleScript Error"
	end try

	-- --- Column 3: Right Side (Books, KeePassXC) ---

	try
		activate application "Books"
		tell process "Books"
			tell window 1
				set position to {rightColumnX, topRowY}
				set size to {sideAppWidth, sideAppHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Books: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "KeePassXC"
		tell process "KeePassXC"
			tell window 1
				set position to {rightColumnX, bottomRowY}
				set size to {sideAppWidth, sideAppHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange KeePassXC: " & errMsg with title "AppleScript Error"
	end try

end tell
