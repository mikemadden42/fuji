-- Internal display: 14" MacBook Pro, 3024x1964 @ 2x (logical 1512x982).
property screenWidth: 1512
property screenHeight: 982

-- Each window takes 2/3 of the screen width; VS Code anchors left, Ghostty
-- anchors right. They overlap by ~1/3 of the screen in the middle. The user
-- brings whichever is needed to the front via click / cmd-tab.
property topPadding: 40 -- Clear the notched menu bar
property bottomPadding: 25
property windowWidth: round (screenWidth * 2 / 3)
property windowHeight: screenHeight - topPadding - bottomPadding

property codeWindowX: 0
property ghosttyX: screenWidth - windowWidth
property windowY: topPadding

tell application "System Events"
	try
		activate application "Visual Studio Code"
		-- VS Code's macOS process is "Code" (Electron app), even though the
		-- Dock / Launch Services name is "Visual Studio Code".
		tell process "Code"
			tell window 1
				set position to {codeWindowX, windowY}
				set size to {windowWidth, windowHeight}
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
				set size to {windowWidth, windowHeight}
			end tell
		end tell
	on error errMsg
		display notification "Could not arrange Ghostty: " & errMsg with title "AppleScript Error"
	end try
end tell
