-- Internal display: 14" MacBook Pro, 3024x1964 @ 2x (logical 1512x982).
property screenWidth: 1512
property screenHeight: 982

-- Padding from screen edges and between windows
property padding: 25
property horizontalSpacing: 10
property verticalSpacing: 10

-- Brave hero on the left
property braveWidth: 850
property braveHeight: screenHeight - (2 * padding)
property braveX: padding
property braveY: padding

-- Right column hosts Sublime up top and the reading stack at the bottom.
-- Books refuses to shrink below 1001x530 and KeePassXC below 800x532,
-- so the reading stack uses those constraints as its target size and
-- anchors to the bottom-right corner. The stack will overlap Brave's
-- right edge by ~390pt; the apps are cmd-tab-switchable.
property readingStackWidth: 1001
property readingStackHeight: 532
property readingStackX: screenWidth - padding - readingStackWidth
property readingStackY: screenHeight - padding - readingStackHeight

-- Sublime sits in the top of the right column, above the reading stack.
property sublimeX: padding + braveWidth + horizontalSpacing
property sublimeY: padding
property sublimeWidth: screenWidth - padding - sublimeX
property sublimeHeight: readingStackY - sublimeY - verticalSpacing


tell application "System Events"

	-- --- Brave Browser: Hero, left side, full height ---

	try
		activate application "Brave Browser"
		tell process "Brave Browser"
			tell window 1
				set position to {braveX, braveY}
				set size to {braveWidth, braveHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Brave Browser: " & errMsg with title "AppleScript Error"
	end try

	-- --- Sublime Text: Top of right column ---

	try
		activate application "Sublime Text"
		tell process "Sublime Text"
			tell window 1
				set position to {sublimeX, sublimeY}
				set size to {sublimeWidth, sublimeHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Sublime Text: " & errMsg with title "AppleScript Error"
	end try

	-- --- Reading stack: Books, Kindle, KeePassXC overlap at bottom-right ---

	try
		-- Launch Services name is "Amazon Kindle"; System Events process is "Kindle".
		activate application "Amazon Kindle"
		tell process "Kindle"
			tell window 1
				set position to {readingStackX, readingStackY}
				set size to {readingStackWidth, readingStackHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Amazon Kindle: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "Books"
		tell process "Books"
			tell window 1
				set position to {readingStackX, readingStackY}
				set size to {readingStackWidth, readingStackHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Books: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "KeePassXC"
		tell process "KeePassXC"
			tell window 1
				set position to {readingStackX, readingStackY}
				set size to {readingStackWidth, readingStackHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange KeePassXC: " & errMsg with title "AppleScript Error"
	end try

end tell
