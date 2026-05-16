-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT

-- Layout: VS Code as the hero, Ghostty as a sidecar terminal column
property padding: 50
property horizontalSpacing: 60

property codeWindowWidth: round (screenWidth * 0.65) -- Hero gets ~65% of width
property codeWindowHeight: round (screenHeight * 0.9) -- ~90% of height
property ghosttyWidth: screenWidth - (2 * padding) - horizontalSpacing - codeWindowWidth
property ghosttyHeight: codeWindowHeight

-- Center the two-window block vertically; pin its left edge to padding
property windowY: round ((screenHeight - codeWindowHeight) / 2)
property codeWindowX: padding
property ghosttyX: padding + codeWindowWidth + horizontalSpacing

tell application "System Events"
	try
		activate application "Visual Studio Code"
		-- VS Code's macOS process is "Code" (Electron app), even though the
		-- Dock / Launch Services name is "Visual Studio Code".
		tell process "Code"
			tell window 1
				set position to {codeWindowX, windowY}
				set size to {codeWindowWidth, codeWindowHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Visual Studio Code: " & errMsg with title "AppleScript Error"
	end try

	try
		activate application "Ghostty"
		-- Ghostty's System Events process name is lowercase "ghostty".
		tell process "ghostty"
			tell window 1
				set position to {ghosttyX, windowY}
				set size to {ghosttyWidth, ghosttyHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Ghostty: " & errMsg with title "AppleScript Error"
	end try
end tell
