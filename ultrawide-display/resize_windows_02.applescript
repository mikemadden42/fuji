-- Set this value based on your ultrawide monitor's resolution.
-- For example, if your resolution is 3440 pixels wide.
property screenWidth: 3440 -- Replace with your monitor's actual width

tell application "System Events" to tell process "Code"
	tell window 1
		-- To move 'Code' (likely VS Code) more towards the center or right on an ultrawide,
		-- you'll need a significantly larger X-coordinate than 380.
		-- This example places it roughly in the middle-left, allowing space for other apps.
		set position to {800, 360} -- Increased X from 380 to 800
		set size to {1200, 800} -- You might want to make this wider, e.g., {1600, 800}
	end tell
end tell
