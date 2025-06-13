-- Set these values based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define general padding from screen edges
property screenPaddingX: 50
property screenPaddingY: 50

-- Define spacing BETWEEN the 2x2 grid cells
property gridGapX: 20
property gridGapY: 20

-- Calculate usable dimensions for the grid (space left after outer padding)
property usableWidth: screenWidth - (2 * screenPaddingX)
property usableHeight: screenHeight - (2 * screenPaddingY)

-- Calculate individual cell dimensions for a 2x2 grid, accounting for gaps
-- For 2 columns, there is 1 gap; for 2 rows, there is 1 gap.
property cellWidth: round ((usableWidth - gridGapX) / 2)
property cellHeight: round ((usableHeight - gridGapY) / 2)

-- Helper to calculate X position for a given column (1-indexed)
on getXPosition(colIndex)
	return screenPaddingX + ((colIndex - 1) * (cellWidth + gridGapX))
end getXPosition

-- Helper to calculate Y position for a given row (1-indexed)
on getYPosition(rowIndex)
	return screenPaddingY + ((rowIndex - 1) * (cellHeight + gridGapY))
end getYPosition


tell application "System Events"

	-- --- Music: Top-Left Cell (Row 1, Column 1) ---
	set musicX to my getXPosition(1)
	set musicY to my getYPosition(1)
	try
		activate application "Music" -- Try to activate the application
		tell process "Music"
			tell window 1
				set position to {musicX, musicY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Music: " & errMsg with title "AppleScript Error"
	end try

	-- --- Photos: Top-Right Cell (Row 1, Column 2) ---
	set photosX to my getXPosition(2)
	set photosY to my getYPosition(1)
	try
		activate application "Photos" -- Try to activate the application
		tell process "Photos"
			tell window 1
				set position to {photosX, photosY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Photos: " & errMsg with title "AppleScript Error"
	end try

	-- --- TV: Bottom-Left Cell (Row 2, Column 1) ---
	set tvX to my getXPosition(1)
	set tvY to my getYPosition(2)
	try
		activate application "TV" -- Try to activate the application
		tell process "TV"
			tell window 1
				set position to {tvX, tvY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange TV: " & errMsg with title "AppleScript Error"
	end try

	-- --- Voice Recordings: Bottom-Right Cell (Row 2, Column 2) ---
	set vrX to my getXPosition(2)
	set vrY to my getYPosition(2)
	try
		activate application "Voice Recordings" -- Try to activate the application
		tell process "Voice Recordings"
			tell window 1
				set position to {vrX, vrY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Voice Recordings: " & errMsg with title "AppleScript Error"
	end try

end tell
