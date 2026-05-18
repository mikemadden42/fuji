-- External display: Dell U2722D, 2560x1440.
property screenWidth: 2560
property screenHeight: 1440

-- Define some consistent values for easier adjustments
property padding: 50 -- Padding from screen edges
property horizontalSpacing: 60 -- Spacing between columns
property verticalSpacing: 60 -- Spacing between rows

-- Right column is sized to fit Books (min 1001 wide) and KeePassXC
-- (min 800 wide). Left column fits Amazon Kindle (min 626 wide) and
-- Sublime Text comfortably. Brave gets what's left in the middle.
property leftColWidth: 640
property rightColWidth: 1010
property braveWidth: screenWidth - (2 * padding) - leftColWidth - rightColWidth - (2 * horizontalSpacing)

property usableHeight: screenHeight - (2 * padding)
property sideAppHeight: (usableHeight - verticalSpacing) div 2
property braveHeight: usableHeight

-- Column X-positions
property leftColumnX: padding
property centerColumnX: padding + leftColWidth + horizontalSpacing
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
				set size to {leftColWidth, sideAppHeight}
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
				set size to {leftColWidth, sideAppHeight}
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
				set size to {rightColWidth, sideAppHeight}
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
				set size to {rightColWidth, sideAppHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange KeePassXC: " & errMsg with title "AppleScript Error"
	end try

end tell
