-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define desired window dimensions for the "Code" application
property codeWindowWidth: round (screenWidth * 0.7) -- Use about 70% of screen width
property codeWindowHeight: round (screenHeight * 0.9) -- Use about 90% of screen height

tell application "System Events"
	try
		activate application "Visual Studio Code"
		-- VS Code's macOS process is "Code" (Electron app), even though the
		-- Dock / Launch Services name is "Visual Studio Code".
		tell process "Code"
			tell window 1
				-- Center the window both horizontally and vertically
				set xPosition to round ((screenWidth - codeWindowWidth) / 2)
				set yPosition to round ((screenHeight - codeWindowHeight) / 2)
				set position to {xPosition, yPosition}
				set size to {codeWindowWidth, codeWindowHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Visual Studio Code: " & errMsg with title "AppleScript Error"
	end try
end tell
