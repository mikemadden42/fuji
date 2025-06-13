-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define some consistent values for easier adjustments
property padding: 50 -- General padding from screen edges
property verticalSpacing: 60 -- Spacing between vertically stacked windows
property standardWidth: 960 -- A good standard width for many apps

-- Calculate a suitable height for two items stacked vertically, considering padding and spacing
-- (screenHeight - topPadding - bottomPadding - verticalSpacing_between_items) / 2_items
property itemHeight: round ((screenHeight - (2 * padding) - verticalSpacing) / 2)

-- Calculate X-positions for different columns
property leftColumnX: padding
property centerColumnX: round (screenWidth / 2) - round (standardWidth / 2)
property rightColumnX: screenWidth - standardWidth - padding

tell application "System Events"
	-- --- Column 1: Left Side (Mail, Slack) ---

	tell process "Mail"
		tell window 1
			set position to {leftColumnX, padding}
			set size to {standardWidth, itemHeight}
		end tell
	end tell

	tell process "Slack"
		tell window 1
			-- Slack below Mail
			set position to {leftColumnX, padding + itemHeight + verticalSpacing}
			set size to {standardWidth, itemHeight}
		end tell
	end tell

	-- --- Column 2: Center-Left (Messages, Reminders) ---
    -- We'll place Messages and Reminders side-by-side in this column to save vertical space.

	tell process "Messages"
		tell window 1
			-- Messages will be in the top-left of this central area.
			set position to {centerColumnX, padding}
			set size to {round (standardWidth / 2) - round (verticalSpacing / 2), itemHeight} -- Half width
		end tell
	end tell

	tell process "Reminders"
		tell window 1
			-- Reminders will be next to Messages in the central area.
			-- X position is Messages's X + Messages's Width + spacing
			set remindersX to centerColumnX + (round (standardWidth / 2) - round (verticalSpacing / 2)) + verticalSpacing
			set position to {remindersX, padding}
			set size to {round (standardWidth / 2) - round (verticalSpacing / 2), itemHeight} -- Half width
		end tell
	end tell

	-- --- Column 3: Right Side (Calendar, Notes) ---

	tell process "Calendar"
		tell window 1
			-- Calendar goes on the top right.
			set position to {rightColumnX, padding}
			set size to {standardWidth, itemHeight}
		end tell
	end tell

	tell process "Notes"
		tell window 1
			-- Notes below Calendar.
			set position to {rightColumnX, padding + itemHeight + verticalSpacing}
			set size to {standardWidth, itemHeight}
		end tell
	end tell

end tell
