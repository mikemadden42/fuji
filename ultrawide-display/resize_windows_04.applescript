-- Set these values based on your ultrawide monitor's resolution.
property screenWidth : 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight : 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT

-- Define padding from screen edges
property screenPaddingTop : 50
property screenPaddingBottom : 50
property screenPaddingLeft : 50
-- Larger padding on the right to leave room for desktop icons (adjust as needed)
property screenPaddingRight : 600 

-- Define spacing BETWEEN the 2x2 grid cells
property gridGapX : 20
property gridGapY : 20

-- Calculate usable dimensions for the grid
property usableWidth : screenWidth - screenPaddingLeft - screenPaddingRight
property usableHeight : screenHeight - screenPaddingTop - screenPaddingBottom

-- Calculate individual cell dimensions using integer division (div) to prevent decimal errors
property cellWidth : (usableWidth - gridGapX) div 2
property cellHeight : (usableHeight - gridGapY) div 2

-- Helper to calculate X position for a given column (1-indexed)
on getXPosition(colIndex)
	return screenPaddingLeft + ((colIndex - 1) * (cellWidth + gridGapX))
end getXPosition

-- Helper to calculate Y position for a given row (1-indexed)
on getYPosition(rowIndex)
	return screenPaddingTop + ((rowIndex - 1) * (cellHeight + gridGapY))
end getYPosition


tell application "System Events"
	
	-- --- Music: Top-Left Cell (Row 1, Column 1) ---
	set musicX to my getXPosition(1)
	set musicY to my getYPosition(1)
	try
		activate application "Music"
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
		activate application "Photos"
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
		activate application "TV"
		tell process "TV"
			tell window 1
				set position to {tvX, tvY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange TV: " & errMsg with title "AppleScript Error"
	end try
	
	-- --- Voice Memos: Bottom-Right Cell (Row 2, Column 2) ---
	set vrX to my getXPosition(2)
	set vrY to my getYPosition(2)
	try
		activate application "Voice Memos" -- Corrected app name
		tell process "Voice Memos" -- Corrected app name
			tell window 1
				set position to {vrX, vrY}
				set size to {cellWidth, cellHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Voice Memos: " & errMsg with title "AppleScript Error"
	end try
	
end tell
