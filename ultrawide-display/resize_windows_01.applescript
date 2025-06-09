-- Set these values based on your ultrawide monitor's resolution and preference
-- A common ultrawide resolution is 3440x1440 or 2560x1080.
-- For example, if your resolution is 3440 pixels wide, half of that is 1720.
-- You'll want to experiment with these numbers.
property screenWidth: 3440 -- Replace with your monitor's actual width

--tell application "System Events" to tell process "iTerm2"
--	tell window 1
--		-- Shift iTerm2 significantly to the right
--		set position to {1000, 400} -- Increased X from 50 to 1000
--		set size to {960, 900}
--	end tell
--end tell

tell application "System Events" to tell process "Brave Browser"
	tell window 1
		-- Brave can take up a large portion of the screen, center it more
		set position to {1700, 360} -- Increased X from 460 to 1700
		set size to {1200, 800}
	end tell
end tell

tell application "System Events" to tell process "Books"
	tell window 1
		-- Books could be on the far right
		set position to {2000, 300} -- Increased X from 1200 to 2600
		-- set size to {960, 600} -- Uncomment and adjust if needed
	end tell
end tell

tell application "System Events" to tell process "KeePassXC"
	tell window 1
		-- KeePassXC on the far right, perhaps near Books
		set position to {2000, 800} -- Increased X from 1200 to 2600
		set size to {960, 600}
	end tell
end tell

-- tell application "System Events" to tell process "Messenger"
-- 	tell window 1
-- 		set position to {1800, 120} -- Example adjustment
-- 		set size to {960, 600}
-- 	end tell
-- end tell

-- tell application "System Events" to tell process "Signal"
-- 	tell window 1
-- 		set position to {2200, 150} -- Example adjustment
-- 		set size to {960, 600}
-- 	end tell
-- end tell

tell application "System Events" to tell process "Sublime Text"
	tell window 1
		-- Sublime Text can be in the middle or left-center
		set position to {500, 80} -- Increased X from 100 to 500
		set size to {960, 600}
	end tell
end tell

--tell application "System Events" to tell process "Terminal"
--	tell window 1
--		-- Terminal can be near iTerm2 or its own space
--		set position to {1200, 300} -- Increased X from 300 to 1200
--		-- set size to {960, 900} -- Uncomment and adjust if needed
--	end tell
--end tell
