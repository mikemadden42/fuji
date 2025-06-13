-- Set these values based on your ultrawide monitor's resolution and preference
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define some consistent values for easier adjustments
property padding: 50 -- General padding from screen edges
property verticalSpacing: 60 -- Spacing between vertically stacked windows

-- Standard dimensions for side-panel apps (e.g., code editors, utilities)
property sideAppWidth: 1000
property sideAppHeight: round ((screenHeight - (2 * padding) - verticalSpacing) / 2) -- Fit two vertically

-- Dimensions for a large central browser
property braveWidth: round (screenWidth * 0.55) -- About 55% of screen width
property braveHeight: round (screenHeight * 0.9) -- About 90% of screen height

tell application "System Events"

	-- --- Column 1: Left Side (Sublime Text, iTerm2/Terminal) ---

	tell process "Sublime Text"
		tell window 1
			-- Sublime Text on the far left, top.
			set position to {padding, padding}
			set size to {sideAppWidth, sideAppHeight}
		end tell
	end tell

	-- Uncomment and adjust if you use iTerm2
	-- tell process "iTerm2"
	-- 	tell window 1
	-- 		-- iTerm2 below Sublime Text
	-- 		set position to {padding, padding + sideAppHeight + verticalSpacing}
	-- 		set size to {sideAppWidth, sideAppHeight}
	-- 	end tell
	-- end tell

	-- Uncomment and adjust if you use Terminal
	-- tell process "Terminal"
	-- 	tell window 1
	-- 		-- Terminal below Sublime Text (or iTerm2 if used instead)
	-- 		set position to {padding, padding + sideAppHeight + verticalSpacing}
	-- 		set size to {sideAppWidth, sideAppHeight}
	-- 	end tell
	-- end tell

	-- --- Column 2: Center (Brave Browser) ---

	tell process "Brave Browser"
		tell window 1
			-- Brave Browser takes up a large central portion of the screen.
			set xPosition to round ((screenWidth - braveWidth) / 2)
			set yPosition to round ((screenHeight - braveHeight) / 2)
			set position to {xPosition, yPosition}
			set size to {braveWidth, braveHeight}
		end tell
	end tell

	-- --- Column 3: Right Side (Books, KeePassXC) ---

	tell process "Books"
		tell window 1
			-- Books on the far right, top.
			set xPosition to screenWidth - sideAppWidth - padding
			set position to {xPosition, padding}
			set size to {sideAppWidth, sideAppHeight}
		end tell
	end tell

	tell process "KeePassXC"
		tell window 1
			-- KeePassXC below Books.
			set xPosition to screenWidth - sideAppWidth - padding
			set position to {xPosition, padding + sideAppHeight + verticalSpacing}
			set size to {sideAppWidth, sideAppHeight}
		end tell
	end tell

	-- --- Messenger and Signal (if used) ---
	-- Note: These were handled in a previous script. If you want them here,
	-- you'll need to decide where they fit in this layout.
	-- You could potentially put them in a smaller third column near the center,
	-- or stack them on one of the existing columns if height allows.

	-- tell process "Messenger"
	-- 	tell window 1
	-- 		-- Example: Small window in a dedicated spot, perhaps mid-left or mid-right.
	-- 		set position to {round (screenWidth / 3) - 300, round (screenHeight / 2) - 300}
	-- 		set size to {600, 600}
	-- 	end tell
	-- end tell

	-- tell process "Signal"
	-- 	tell window 1
	-- 		-- Example: Small window next to Messenger or below it.
	-- 		set position to {round (screenWidth * 2 / 3) - 300, round (screenHeight / 2) - 300}
	-- 		set size to {600, 600}
	-- 	end tell
	-- end tell

end tell
