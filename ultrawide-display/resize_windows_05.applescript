-- Set this value based on your ultrawide monitor's resolution.
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- REPLACE WITH YOUR MONITOR'S ACTUAL WIDTH
property screenHeight: 1440 -- REPLACE WITH YOUR MONITOR'S ACTUAL HEIGHT (e.g., 1440 for 3440x1440)

-- Define some consistent values for easier adjustments
property padding: 50 -- General padding from screen edges and between windows
property appWidth: 900 -- A good width for messaging apps
property appHeight: 800 -- A good height for messaging apps

-- --- CORRECTED: These property calculations are now at the top level ---
-- Calculate the total width needed for both apps plus the inner padding
property totalAppsWidth: (appWidth * 2) + padding

-- Calculate the starting X position to center both apps as a block
property startX: round ((screenWidth - totalAppsWidth) / 2)
-- --- END CORRECTED ---


tell application "System Events"
	-- --- Signal: Placed on the left side of the central block ---
	tell process "Signal"
		tell window 1
			-- Position Signal starting from the calculated startX
			set position to {startX, padding}
			set size to {appWidth, appHeight}
		end tell
	end tell

	-- --- Messenger: Placed on the right side of the central block ---
	tell process "Messenger"
		tell window 1
			-- Position Messenger next to Signal, with padding in between
			set position to {startX + appWidth + padding, padding}
			set size to {appWidth, appHeight}
		end tell
	end tell

end tell
